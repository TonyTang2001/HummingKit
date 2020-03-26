//
//  HummingKit.swift
//  HummingKit
//
//  Created by 唐子轩 on 2019/9/5.
//  Copyright © 2019 TonyTang. All rights reserved.
//

import StoreKit
import Alamofire
import SwiftyJSON

public struct HummingKit {
    
    var developerToken: String
    var userToken: String
    let requestGenerator: HummingKitRequestFactory
    
    init(developerToken: String, userToken: String) {
        self.developerToken = developerToken
        self.userToken = userToken
        requestGenerator = HummingKitRequestFactory(developerToken: developerToken, userToken: userToken)
    }
    
    public typealias completionStringChunk = (_ success: Bool, _ error: Error?, _ result: String?) -> Void
    public typealias completionJSONChunk = (_ success: Bool, _ error: Error?, _ result: JSON?) -> Void
    
    /// Function for fetching Apple Music UserToken using DeveloperToken
    ///
    /// - Parameters:
    ///   - completion: status(true if succeeded), error(contains Error if failed), result(String response from server)
    public func fetchUserToken(completion: @escaping completionStringChunk) {
        print("Start Fetching User Token")
        
        let controller = SKCloudServiceController()
        controller.requestUserToken(forDeveloperToken: developerToken) { (userToken: String?, error: Error?) in
            if let musicUserToken = userToken {
                // Fetching SUCCEEDED
                print("Fetching SUCCEEDED, AppleMusicUserToken: \(musicUserToken)")
                completion(true, nil, musicUserToken)
            } else {
                // Fetching FAILED
                guard let error = error else { return }
                print("Fetching FAILED")
                print(error)
                print(error.localizedDescription)
                completion(false, error, nil)
            }
        }
    }
    
    /// Function for fetching user's Apple Music Storefront information
    ///
    /// - Parameters:
    ///   - completion: status(true if succeeded), error(contains Error if failed), result(JSON response from server)
    public func fetchUserStorefront(completion: @escaping completionJSONChunk) {
        
        let urlRequest = requestGenerator.createGetUserStorefrontRequest()
        Alamofire.request(urlRequest)
            .responseJSON { response in
//                print("fetchUserStorefront Request Response: \(response)")
                let result = Self.decodeResponseStatus(response)
                completion(result.success, result.error, result.responseJSON)
        }
        
    }
    
    // FIXME: -  This function has NOT been tested yet, possible to malfuntion or fail to work
    /// Function for fetching all playlists from user's library
    ///
    /// - Parameters:
    ///   - completion: status(true if succeeded), error(contains Error if failed), result(JSON response from server)
    public func fetchAllUserLibraryPlaylists(completion: @escaping completionJSONChunk) {
        
        var allFullInfo: JSON = []
        var offset: String = "0"
        var finished: Bool = false
        
        func fetchPartialUserLibraryPlaylists(Offset: String, completion: @escaping (_ partialInfo: JSON, _ nextOffset: String, _ finished: Bool, _ statusCheck: Bool, _ error: Error?) -> Void ) {
            
            let urlRequest = requestGenerator.createGetAllLibraryPlaylistsRequest(offset: Offset)
            
            var offsetIndexString: String = ""
            
            Alamofire.request(urlRequest)
                .responseJSON { response in
                    
                    let currentJson = JSON(response.result.value ?? "NA")
                    let playlistsInfoJson = currentJson["data"]
                    var isFinished = false
                    
                    if currentJson["next"].exists() {
                        // extract offsetIndexString from "next"
                        guard let next = currentJson["next"].string else { return }
                        offsetIndexString = Self.offsetMatches(for: "(\\d{2,})", in: next)
                        
                        isFinished = false
                    } else {
                        isFinished = true
                    }
                    
                    let result = Self.decodeResponseStatus(response)
                    completion(playlistsInfoJson, offsetIndexString, isFinished, result.success, result.error)
            }
        }
        
        func goto() {
            switch finished {
            case false:
                print("Fetching Continuing")
                fetchPartialUserLibraryPlaylists(Offset: offset, completion: { (songsInfoJson, nextOffset, isFinished, statusOK, error)  in
                    if !statusOK {
                        print("Fetching FAILED")
                        // One fetch among whole process failed, currently collected info will still be returned
                        completion(false, error, allFullInfo)
                    }
                    do {
                        try allFullInfo = allFullInfo.merged(with: songsInfoJson)
                    } catch {
                        print(error)
                    }
                    offset = nextOffset
                    finished = isFinished
                    goto()
                })
            case true:
                print("Fetching SUCCEEDED")
                completion(true, nil, allFullInfo)
            }
        }
        
        goto()
        
    }
    
    // FIXME: -  Error Handling part of this function has NOT been tested yet, possible to malfuntion or fail to work
    /// Function for fetching all songs from user's library
    ///
    /// - Parameters:
    ///   - completion: status(true if succeeded), error(contains Error if failed), result(JSON response from server)
    public func fetchAllUserLibrarySongs(completion: @escaping completionJSONChunk) {
        
        var allFullInfo: JSON = []
        var offset: String = "0"
        var finished: Bool = false
        
        func fetchPartialUserLibrarySongs(Offset: String, completion: @escaping (_ partialInfo: JSON, _ nextOffset: String, _ finished: Bool, _ statusCheck: Bool, _ error: Error?) -> Void ) {
            
            let urlRequest = requestGenerator.createGetAllLibrarySongsRequest(offset: Offset)
            
            var offsetIndexString: String = ""
            
            Alamofire.request(urlRequest)
                .responseJSON { response in
                    
                    let currentJson = JSON(response.result.value ?? "NA")
                    let songsInfoJson = currentJson["data"]
                    var isFinished = false
                    
                    if currentJson["next"].exists() {
                        // extract offsetIndexString from "next"
                        guard let next = currentJson["next"].string else { return }
                        offsetIndexString = Self.offsetMatches(for: "(\\d{2,})", in: next)
                        
                        isFinished = false
                    } else {
                        isFinished = true
                    }
                    
                    let result = Self.decodeResponseStatus(response)
                    completion(songsInfoJson, offsetIndexString, isFinished, result.success, result.error)
            }
        }
        
        func goto() {
            switch finished {
            case false:
                print("Fetching Continuing")
                fetchPartialUserLibrarySongs(Offset: offset, completion: { (songsInfoJson, nextOffset, isFinished, statusOK, error) in
                    if !statusOK {
                        print("Fetching FAILED")
                        // One fetch among whole process failed, currently collected info will still be returned
                        completion(false, error, allFullInfo)
                    }
                    do {
                        try allFullInfo = allFullInfo.merged(with: songsInfoJson)
                    } catch {
                        print(error)
                    }
                    offset = nextOffset
                    finished = isFinished
                    goto()
                })
            case true:
                print("Fetching SUCCEEDED")
                completion(true, nil, allFullInfo)
            }
        }
        goto()
        
    }
    
    /// Private function for searching offest index from response ["next"]
    ///
    /// - Parameters:
    ///   - regex: regular expression feature
    ///   - text: string value from ["next"]
    /// - Returns: offset index in String
    private static func offsetMatches(for regex: String, in text: String) -> String {
        do {
            let regex = try NSRegularExpression(pattern: regex)
            let results = regex.matches(in: text,
                                        range: NSRange(text.startIndex..., in: text))
            let finalResult = results.map {
                String(text[Range($0.range, in: text)!])
            }
            return finalResult.last ?? ""
        } catch let error {
            print("invalid regex: \(error.localizedDescription)")
            return ""
        }
    }
    
    /// Private function for decoding response status returned from server
    ///
    /// - Parameter response: response from server
    /// - Returns: status(true if succeeded), error(contains Error if failed), result(JSON response from server)
    private static func decodeResponseStatus(_ response: DataResponse<Any>) -> (success: Bool, error: Error?, responseJSON: JSON?) {
        var statusCode = response.response?.statusCode
        if let error = response.result.error as? AFError {
            
            if let status = statusCode {
                statusCode = handleResponseAFError(statusCode: status, error: error)
                print("AFError: \(String(describing: statusCode))")
                // handling Alamofire Error
                return (false, error, nil)
            }
            
        } else if let error = response.result.error as? URLError {
            print("URLError: \(error)")
            // handling URLError
            return (false, error, nil)
        }
        
        if let statusCode = response.response?.statusCode {
            print("Request Status Code: \(statusCode)")
            let decodedStatus = handleResponseStatusCode(statusCode: statusCode)
            
            if decodedStatus.success {
                print(decodedStatus.codeName)
                print(decodedStatus.description)
                return (true, nil, JSON(response.result.value ?? "NA"))
            } else {
                print(decodedStatus.codeName)
                print(decodedStatus.description)
                // HTTP status code already printed out decodedStatus, error returned is nil
                return (false, nil, nil)
            }
            
        } else {
            // No HTTP Status Code, report in console & error returned is nil
            print("NO HTTP Status Code, Check Internet Availability and Retry Request")
            return (false, nil, nil)
        }
    }
    
    /// Private function for handling status code from request
    ///
    /// - Parameter statusCode: HTTP status code
    /// - Returns: status(true if succeeded), error(contains Error if failed), result(JSON response from server)
    private static func handleResponseStatusCode(statusCode: Int) -> (success: Bool, codeName: String, description: String) {
        //                Status Code Returned by Apple Music server: https://developer.apple.com/documentation/applemusicapi/common_objects/http_status_codes
        switch statusCode {
        case 200:
            return (true, "OK", "The request was successful; no errors or faults.")
        case 201:
            return (true, "Created", "Creation request was successful.")
        case 202:
            return (true, "Accepted", "Modification request was accepted but may not have completed.")
        case 204:
            return (true, "No Content", "Modification was successful, but there’s no content in the response.")
        case 301:
            return (false, "Moved Permanently", "Content may be available at a different URL.")
        case 302:
            return (false, "Found", "Content definitely available at a specific URL.")
        case 400:
            return (false, "Bad Request", "The request wasn’t accepted as formed.")
        case 401:
            let description401 = """
                The request wasn’t accepted because its authorization is missing or invalid due to an issue with the developer token.
                (For personal endpoints) Authorization issues may occur because the user wasn’t signed in or didn’t have a valid Apple Music subscription.
                (For music user token request) Developer token issues may occur because the token wasn’t received or was invalid. There could also be an error processing the request.
            """
            return (false, "Unauthorized", description401)
        case 403:
            let description403 = """
                The request wasn’t accepted due to an issue with the music user token or because it’s using incorrect authentication.
                (For personal endpoints) Authentication issues may occur if the account hasn’t accepted the Media and Apple Music privacy setting.
            """
            return (false, "Forbidden", description403)
        case 404:
            return (false, "Not Found", "The requested resource doesn’t exist.")
        case 405:
            return (false, "Method Not Allowed", "The method can’t be used for the request.")
        case 409:
            return (false, "Conflict", "A modification or creation request couldn’t be processed because there’s a conflict with the current state of the resource.")
        case 413:
            return (false, "Payload Too Large", "The body of the request is too large.")
        case 414:
            return (false, "URI Too Long", "The URI of the request is too long and won’t be processed.")
        case 429:
            return (false, "Too Many Requests", "The user has made too many requests. See Simulate the Too Many Requests Error.")
        case 500:
            return (false, "Internal Server Error", "There’s an error processing the request.")
        case 501:
            return (false, "Not Implemeneted", "Endpoint is currently unavailable and reserved for future use.")
        case 503:
            return (false, "Service Unavailable", "The service is currently unavailable to process requests.")
        default:
            return (false, "Unknown Status Code", "No Description Available.")
        }
    }
    
    /// Private function for handling Alamofire Error from request
    ///
    /// - Parameters:
    ///   - statusCode: status code from response
    ///   - error: Alamofire Error
    /// - Returns: status code
    private static func handleResponseAFError(statusCode: Int, error: AFError) -> Int {
        var status = error._code // statusCode private
        switch error {
        case .invalidURL(let url):
            print("Invalid URL: \(url) - \(error.localizedDescription)")
        case .parameterEncodingFailed(let reason):
            print("Parameter encoding failed: \(error.localizedDescription)")
            print("Failure Reason: \(reason)")
        case .multipartEncodingFailed(let reason):
            print("Multipart encoding failed: \(error.localizedDescription)")
            print("Failure Reason: \(reason)")
        case .responseValidationFailed(let reason):
            print("Response validation failed: \(error.localizedDescription)")
            print("Failure Reason: \(reason)")
            
            switch reason {
            case .dataFileNil, .dataFileReadFailed:
                print("Downloaded file could not be read")
            case .missingContentType(let acceptableContentTypes):
                print("Content Type Missing: \(acceptableContentTypes)")
            case .unacceptableContentType(let acceptableContentTypes, let responseContentType):
                print("Response content type: \(responseContentType) was unacceptable: \(acceptableContentTypes)")
            case .unacceptableStatusCode(let code):
                print("Response status code was unacceptable: \(code)")
                status = code
            }
        case .responseSerializationFailed(let reason):
            print("Response serialization failed: \(error.localizedDescription)")
            print("Failure Reason: \(reason)")
        }
        
        print("Underlying error: \(String(describing: error.underlyingError))")
        return status
    }
    
    
}
