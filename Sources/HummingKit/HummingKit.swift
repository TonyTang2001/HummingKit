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

/// Main entry class of HummingKit framework
public class HummingKit {
    
    private var developerToken: String
    private var userToken: String
    private let requestGenerator: HummingKitRequestFactory
    
    /// Maximum time of retrying an segmental fetching request within an expensive request
    private var retryCountMax: Int = 3
    
    /// Initializer of HummingKit()
    /// - Parameters:
    ///   - developerToken: Apple Music Developer Token fetched beforehand using developer key issued by developer.apple.com
    ///   - userToken: Apple Music User Token fetched on user-end device using Apple Music Developer Token
    public init(developerToken: String, userToken: String) {
        self.developerToken = developerToken
        self.userToken = userToken
        requestGenerator = HummingKitRequestFactory(developerToken: developerToken, userToken: userToken)
    }
    
    /// Function to customize maximum time of retrying an segmental fetching request within an expensive request.
    /// - Parameter retryCount: The upper limit of time of retrying.
    public func setMaximumRequestRetryCount(_ retryCount: Int) {
        // Minimum legal valur of retryCountMax is 0.
        retryCountMax = (retryCount < 0) ? 0 : retryCount
    }
    
    /// Private function that modularize Alamofire url requesting and responses.
    /// - Parameters:
    ///   - urlRequest: URL request that needs to be conducted by Alamofire
    ///   - completion: Completion handler of request result of type Swift.Result<JSON, Error>
    ///   - result: Result of request, .success(JSON) or .failure(Error)
    private func requestByAlamofireJSON(urlRequest: URLRequest, completion: @escaping (_ result: Swift.Result<JSON, Error>) -> Void) {
        Alamofire.request(urlRequest)
            .responseJSON { response in
                var result: Swift.Result<JSON, Error>   // result to be modified and returned in completion handler
                let data = decodeResponseStatus(response)
                
                if data.success {
                    result = .success(data.responseJSON ?? "")
                } else {
                    guard let err = data.error else { return }
                    result = .failure(err)
                }
                
                completion(result)
        }
    }
    
    /// Private function that modularize Alamofire url requesting, specifically for those without response body.
    /// - Parameters:
    ///   - urlRequest: URL request that needs to be conducted by Alamofire
    ///   - completion: Completion handler of request result of type Swift.Result<String, Error>
    ///   - result: Result of request, .success(status) or .failure(Error)
    private func requestByAlamofireString(urlRequest: URLRequest, completion: @escaping (_ result: Swift.Result<String, Error>) -> Void) {
        Alamofire.request(urlRequest)
            .responseJSON { response in
                var result: Swift.Result<String, Error>   // result to be modified and returned in completion handler
                
                if let statusCode = response.response?.statusCode {
                    print("Request Status Code: \(statusCode)")
                    let decodedStatus = handleResponseStatusCode(statusCode: statusCode)
                    
                    if decodedStatus.success {
                        result = .success(decodedStatus.codeName)
                    } else {
                        // Status code indicates an error has occured
                        let data = decodeResponseStatus(response)
                        guard let err = data.error else { return }
                        result = .failure(err)
                    }
                } else {    // Status code unavailable
                    print("NO HTTP Status Code, Check Internet Availability and Retry Request")
                    let data = decodeResponseStatus(response)
                    guard let err = data.error else { return }
                    result = .failure(err)
                }
                
                completion(result)
        }
    }
    
    // MARK: - Storefonts
    /// Fetch user's Apple Music account default storefront information.
    /// - Parameters:
    ///   - completion: Completion handler of request result of type Swift.Result<Storefront, Error>
    ///   - result: Result of request, .success(Storefront) or .failure(Error)
    public func fetchUserStorefront(completion: @escaping (_ result: Swift.Result<Storefront, Error>) -> Void) {
        // Create URL Request using requestGenerator
        let urlRequest = requestGenerator.createGetUserStorefrontRequest()
        
        requestByAlamofireJSON(urlRequest: urlRequest) { result in
            var storefrontResult: Swift.Result<Storefront, Error>   // result to be modified and returned in completion handler
            
            switch result {
            case .success(let responseJson):
                let storefrontData: JSON = responseJson["data"].array![0]
                // Parse resource object from JSON response
                if let storefront = Storefront(storefrontData: storefrontData) {
                    storefrontResult = .success(storefront)
                } else {
                    // Parsing failed, complete with error
                    storefrontResult = .failure(HummingKitResponseError.responseCorrupted)
                }
            case .failure(let err):
                storefrontResult = .failure(err)
            }
            
            completion(storefrontResult)
        }
    }
    
    /// Fetch a storefront from Apple Music server using its identifier.
    /// - Parameters:
    ///   - storefrontID: The identifier (an ISO 3166 alpha-2 country code) of the storefront to be fetched.
    ///   - completion: Completion handler of request result of type Swift.Result<Storefront, Error>
    ///   - result: Result of request, .success(Storefront) or .failure(Error)
    public func fetchAStorefront(storefrontID: String, completion: @escaping (_ result: Swift.Result<Storefront, Error>) -> Void) {
        // Create URL Request using requestGenerator
        let urlRequest = requestGenerator.createGetAStorefrontRequest(storefrontID: storefrontID)
        
        requestByAlamofireJSON(urlRequest: urlRequest) { result in
            var storefrontResult: Swift.Result<Storefront, Error>   // result to be modified and returned in completion handler
            
            switch result {
            case .success(let responseJson):
                let storefrontData: JSON = responseJson["data"].array![0]
                // Parse resource object from JSON response
                if let storefront = Storefront(storefrontData: storefrontData) {
                    storefrontResult = .success(storefront)
                } else {
                    // Parsing failed, complete with error
                    storefrontResult = .failure(HummingKitResponseError.responseCorrupted)
                }
            case .failure(let err):
                storefrontResult = .failure(err)
            }
            
            completion(storefrontResult)
        }
    }
    
    /// Fetch an array of storefronts from Apple Music server using their identifiers.
    /// - Parameters:
    ///   - storefrontIDs: An array of the identifiers (ISO 3166 alpha-2 country codes) of the storefronts to be fetched.
    ///   - completion: Completion handler of request result of type Swift.Result<[Storefront], Error>
    ///   - result: Result of request, .success([Storefront]) or .failure(Error)
    public func fetchMultipleStorefronts(storefrontIDs: [String], completion: @escaping (_ result: Swift.Result<[Storefront], Error>) -> Void) {
        // Create URL Request using requestGenerator
        let urlRequest = requestGenerator.createGetMultipleStorefrontsRequest(storefrontIDs: storefrontIDs)
        
        requestByAlamofireJSON(urlRequest: urlRequest) { result in
            var storefrontsResult: Swift.Result<[Storefront], Error>    // result to be modified and returned in completion handler
            
            switch result {
            case .success(let responseJson):    // successfully get response from server
                
                var storefrontsArray: [Storefront] = []
                let storefrontsDataArray: [JSON] = responseJson["data"].array!
                
                storefrontsDataArray.forEach { storefrontData in
                    // Parse resource object from JSON response
                    if let storefront = Storefront(storefrontData: storefrontData) {
                        storefrontsArray.append(storefront)
                    } else {
                        // Parsing failed, complete with error
                        completion(.failure(HummingKitResponseError.responseCorrupted))
                        return
                    }
                }
                
                // set result to be returned
                storefrontsResult = .success(storefrontsArray)
                
            case .failure(let err): // failed to get response
                storefrontsResult = .failure(err)
            }
            
            completion(storefrontsResult)
        }
    }
    
    /// Fetch all storefronts available from Apple Music server all at once.
    /// - Parameters:
    ///   - completion: Completion handler of request result of type Swift.Result<[Storefront], Error>
    ///   - result: Result of request, .success([Storefront]) or .failure(Error)
    public func fetchAllStorefronts(completion: @escaping (_ result: Swift.Result<[Storefront], Error>) -> Void) {
        // Create URL Request using requestGenerator
        let urlRequest = requestGenerator.createGetAllStorefrontsRequest()
        
        requestByAlamofireJSON(urlRequest: urlRequest) { result in
            var storefrontsResult: Swift.Result<[Storefront], Error>    // result to be modified and returned in completion handler
            
            switch result {
            case .success(let responseJson):    // successfully get response from server
                
                var storefrontsArray: [Storefront] = []
                let storefrontsDataArray: [JSON] = responseJson["data"].array!
                
                storefrontsDataArray.forEach { storefrontData in
                    // Parse resource object from JSON response
                    if let storefront = Storefront(storefrontData: storefrontData) {
                        storefrontsArray.append(storefront)
                    } else {
                        // Parsing failed, complete with error
                        completion(.failure(HummingKitResponseError.responseCorrupted))
                        return
                    }
                }
                
                // set result to be returned
                storefrontsResult = .success(storefrontsArray)
                
            case .failure(let err): // failed to get response
                storefrontsResult = .failure(err)
            }
            
            completion(storefrontsResult)
        }
    }
    
    // MARK: - Add Resources to Library
    /// Add resources (playlists, albums, songs, MVs) to user library.
    /// - Parameters:
    ///   - playlistsIDs: An array of unique catalog identifiers of playlists to be added to user library
    ///   - albumsIDs: An array of unique catalog identifiers of albums to be added to user library
    ///   - songsIDs: An array of unique catalog identifiers of songs to be added to user library
    ///   - musicVideosIDs: An array of unique catalog identifiers of music videos to be added to user library
    ///   - completion: Completion handler of request result of type Swift.Result<String, Error>
    ///   - result: Result of request, .success(status) or .failure(Error)
    public func addResourcesToLibrary(playlistsIDs: [String], albumsIDs: [String], songsIDs: [String], musicVideosIDs: [String], completion: @escaping (_ result: Swift.Result<String, Error>) -> Void) {
        // Create URL Request using requestGenerator
        let urlRequest = requestGenerator.createAddResourcesToLibraryRequest(playlistsIDs: playlistsIDs, albumsIDs: albumsIDs, songsIDs: songsIDs, musicVideosIDs: musicVideosIDs)
        
        requestByAlamofireString(urlRequest: urlRequest) { result in
            completion(result)
        }
    }
    
    // MARK: - Albums
    /// Fetch a catalog album using its identifier.
    /// - Parameters:
    ///   - storefront: An identifier (ISO 3166 alpha-2 country codes) of the storefront which to perform request in
    ///   - albumID: The unique identifier of the album
    ///   - completion: Completion handler of request result of type Swift.Result<CatalogAlbum, Error>
    ///   - result: Result of request, .success(CatalogAlbum) or .failure(Error)
    public func fetchACatalogAlbum(storefront: String, albumID: String, completion: @escaping (_ result: Swift.Result<CatalogAlbum, Error>) -> Void) {
        // Create URL Request using requestGenerator
        let urlRequest = requestGenerator.createGetACatalogAlbumRequest(storefront: storefront, albumID: albumID)
        
        requestByAlamofireJSON(urlRequest: urlRequest) { result in
            var catalogAlbumResult: Swift.Result<CatalogAlbum, Error>   // result to be modified and returned in completion handler
            
            switch result {
            case .success(let responseJson):
                let catalogAlbumData: JSON = responseJson["data"].array![0]
                // Parse resource object from JSON response
                if let catalogAlbum = CatalogAlbum(albumData: catalogAlbumData) {
                    catalogAlbumResult = .success(catalogAlbum)
                } else {
                    // Parsing failed, complete with error
                    catalogAlbumResult = .failure(HummingKitResponseError.responseCorrupted)
                }
            case .failure(let err):
                catalogAlbumResult = .failure(err)
            }
            
            completion(catalogAlbumResult)
        }
    }
    
    /// Fetch multiple catalog albums using their identifiers.
    /// - Parameters:
    ///   - storefront: An identifier (ISO 3166 alpha-2 country codes) of the storefront which to perform request in
    ///   - albumIDs: An array of the identifiers of the albums. Maximum fetch limit is 100.
    ///   - completion: Completion handler of request result of type Swift.Result<[CatalogAlbum], Error>
    ///   - result: Result of request, .success([CatalogAlbum]) or .failure(Error)
    public func fetchMultipleCatalogAlbums(storefront: String, albumIDs: [String], completion: @escaping (_ result: Swift.Result<[CatalogAlbum], Error>) -> Void) {
        
        // Declare and then initialize URL Request as initialization is failable due to array lengths
        var urlRequest: URLRequest
        do {
            urlRequest = try requestGenerator.createGetMultipleCatalogAlbumsRequest(storefront: storefront, albumIDs: albumIDs)
        } catch {
            completion(.failure(error))
            return
        }
        
        requestByAlamofireJSON(urlRequest: urlRequest) { result in
            
            var catalogAlbumsResult: Swift.Result<[CatalogAlbum], Error>    // result to be modified and returned in completion handler
            
            switch result {
            case .success(let responseJson):    // successfully get response from server
                // JSON array of CatalogAlbum, each element is of JSON type containing one catalogAlbum data
                let catalogAlbumsDataArray: [JSON] = responseJson["data"].array!
                
                var catalogAlbumsArray: [CatalogAlbum] = []
                
                catalogAlbumsDataArray.forEach { catalogAlbumData in
                    // Parse resource object from JSON response
                    if let catalogAlbum = CatalogAlbum(albumData: catalogAlbumData) {
                        catalogAlbumsArray.append(catalogAlbum)
                    } else {
                        // Parsing failed, complete with error
                        completion(.failure(HummingKitResponseError.responseCorrupted))
                        return
                    }
                }
                
                // set result to be returned
                catalogAlbumsResult = .success(catalogAlbumsArray)
                
            case .failure(let err): // failed to get response
                catalogAlbumsResult = .failure(err)
            }
            
            completion(catalogAlbumsResult)
        }
    }
    
    /// Fetch the relationship of specified catalog album using its identifier and relationship tag.
    /// - Parameters:
    ///   - storefront: An identifier (ISO 3166 alpha-2 country codes) of the storefront which to perform request in
    ///   - albumID: The unique identifier of the album
    ///   - relationship: The name tag of the relationship to fetch for this catalog album
    ///   - completion: Completion handler of request result of type Swift.Result<JSON, Error>
    ///   - result: Result of request, .success(JSON) or .failure(Error)
    public func fetchACatalogAlbumRelationship(storefront: String, albumID: String, relationship: String, completion: @escaping (_ result: Swift.Result<JSON, Error>) -> Void) {
        // Create URL Request using requestGenerator
        let urlRequest = requestGenerator.createGetACatalogAlbumRelationshipRequest(storefront: storefront, albumID: albumID, relationship: relationship)
        
        requestByAlamofireJSON(urlRequest: urlRequest) { result in
            completion(result)
        }
    }
    
    /// Fetch a library album using its identifier.
    /// - Parameters:
    ///   - albumID: The unique identifier of the album
    ///   - completion: Completion handler of request result of type Swift.Result<LibraryAlbum, Error>
    ///   - result: Result of request, .success(LibraryAlbum) or .failure(Error)
    public func fetchALibraryAlbum(albumID: String, completion: @escaping (_ result: Swift.Result<LibraryAlbum, Error>) -> Void) {
        // Create URL Request using requestGenerator
        let urlRequest = requestGenerator.createGetALibraryAlbumRequest(albumID: albumID)
        
        requestByAlamofireJSON(urlRequest: urlRequest) { result in
            var libraryAlbumResult: Swift.Result<LibraryAlbum, Error>   // result to be modified and returned in completion handler
            
            switch result {
            case .success(let responseJson):
                let libraryAlbumData: JSON = responseJson["data"].array![0]
                // Parse resource object from JSON response
                if let libraryAlbum = LibraryAlbum(albumData: libraryAlbumData) {
                    libraryAlbumResult = .success(libraryAlbum)
                } else {
                    // Parsing failed, complete with error
                    libraryAlbumResult = .failure(HummingKitResponseError.responseCorrupted)
                }
            case .failure(let err):
                libraryAlbumResult = .failure(err)
            }
            
            completion(libraryAlbumResult)
        }
    }
    
    /// Fetch the relationship of specified library album using its identifier and relationship tag.
    /// - Parameters:
    ///   - albumID: The unique identifier of the album
    ///   - relationship: The name tag of the relationship to fetch for this library album
    ///   - completion: Completion handler of request result of type Swift.Result<JSON, Error>
    ///   - result: Result of request, .success(JSON) or .failure(Error)
    public func fetchALibraryAlbumRelationship(albumID: String, relationship: String, completion: @escaping (_ result: Swift.Result<JSON, Error>) -> Void) {
        // Create URL Request using requestGenerator
        let urlRequest = requestGenerator.createGetALibraryAlbumRelationshipRequest(albumID: albumID, relationship: relationship)
        
        requestByAlamofireJSON(urlRequest: urlRequest) { result in
            completion(result)
        }
    }
    
    /// Fetch multiple library albums using their identifiers.
    /// - Parameters:
    ///   - albumIDs: An array of the identifiers of albums. Maximum fetch limit is 100.
    ///   - completion: Completion handler of request result of type Swift.Result<[LibraryAlbum], Error>
    ///   - result: Result of request, .success([LibraryAlbum]) or .failure(Error)
    public func fetchMultipleLibraryAlbums(albumIDs: [String], completion: @escaping (_ result: Swift.Result<[LibraryAlbum], Error>) -> Void) {
        
        // Declare and then initialize URL Request as initialization is failable due to array lengths
        var urlRequest: URLRequest
        do {
            urlRequest = try requestGenerator.createGetMultipleLibraryAlbumsRequest(albumIDs: albumIDs)
        } catch {
            completion(.failure(error))
            return
        }
        
        requestByAlamofireJSON(urlRequest: urlRequest) { result in
            
            var libraryAlbumsResult: Swift.Result<[LibraryAlbum], Error>    // result to be modified and returned in completion handler
            
            switch result {
            case .success(let responseJson):    // successfully get response from server
                // JSON array of LibraryAlbum, each element is of JSON type containing one LibraryAlbum data
                let libraryAlbumsDataArray: [JSON] = responseJson["data"].array!
                
                var libraryAlbumsArray: [LibraryAlbum] = []
                
                libraryAlbumsDataArray.forEach { libraryAlbumData in
                    // Parse resource object from JSON response
                    if let libraryAlbum = LibraryAlbum(albumData: libraryAlbumData) {
                        libraryAlbumsArray.append(libraryAlbum)
                    } else {
                        // Parsing failed, complete with error
                        completion(.failure(HummingKitResponseError.responseCorrupted))
                        return
                    }
                }
                
                // set result to be returned
                libraryAlbumsResult = .success(libraryAlbumsArray)
                
            case .failure(let err): // failed to get response
                libraryAlbumsResult = .failure(err)
            }
            
            completion(libraryAlbumsResult)
        }
    }
    
    /// Fetch all library albums by segments.
    /// - Parameters:
    ///   - completion: Completion handler of request result of type Swift.Result<([LibraryAlbum], FetchingStatus), Error>
    ///   - result: Result of request, .success([LibraryAlbum], FetchingStatus) or .failure(Error)
    public func fetchAllLibraryAlbums(completion: @escaping (_ result: Swift.Result<([LibraryAlbum], FetchingStatus), Error>) -> Void) {
        
        let limit:  String = "100"  // default to maximum
        var offset: String = "0"
        var retryCount: Int = 0
        var fetchingStatus: FetchingStatus = .preparingForStart
        var allLibraryAlbums: [LibraryAlbum] = []
        
        /// Function that recursively fetches paged LibraryAlbum resource until no available resource left or error occurs
        func continueFetching() {
            switch fetchingStatus {
                
            // Requests of fetchAllLibraryAlbums continuing or preparing to start
            case .preparingForStart, .inProgress:
                
                // Clear retry count and update fetching status
                retryCount = 0
                fetchingStatus = .inProgress
                
                fetchSegmentalLibraryAlbums(limit: limit, offset: offset) { result in
                    switch result {
                        
                    // Segmental fetching succeeded
                    case .success((let segmentalLibraryAlbumsArray, let newOffset, let segmentStatus)):
                        
                        // Append parsed segment of LibraryAlbum
                        allLibraryAlbums.append(contentsOf: segmentalLibraryAlbumsArray)
                        
                        // Decide next action in accordance to segment fetching status
                        switch segmentStatus {
                            
                        // Segmental fetching completed
                        case .completed:
                            
                            // Update offset and fetching status for next segmental request
                            offset = newOffset
                            fetchingStatus = .inProgress
                            
                            // Continue next segmental fetch
                            continueFetching()
                            
                        // Current segment is the ending of all available resources
                        case .ending:
                            
                            // Update fetching status and complete fetchAllLibraryAlbums function
                            fetchingStatus = .completed
                            completion(.success((allLibraryAlbums, fetchingStatus)))
                        
                        // Case falling out-of-logic
                        default:
                            // Complete with error case being logically impossible to occur
                            completion(.failure(HummingKitInternalError.impossibleCase))
                        }
                        
                    // Segmental fetch failed due to error
                    case .failure(let err):
                        // Update fetching status
                        fetchingStatus = .retryingWithError(error: err)
                        
                        // Retry(as offset kept unchanged) fetching of current segment
                        continueFetching()
                    }
                }
                
            // Current segment failed, retry recursively until retryCount hits maximum
            case .retryingWithError(let err): // Current segment fetching has failed on last try
                
                if retryCount >= retryCountMax {    // Has retried same request for 3 times
                    
                    if allLibraryAlbums.count > 0 {
                        // As long as allLibraryAlbums array contains objects, function completes with its content while flagged as .completedWithError
                        // Update fetching status and complete fetchAllLibraryAlbums function
                        fetchingStatus = .completedWithError
                        completion(.success((allLibraryAlbums, fetchingStatus)))
                    } else {
                        // When no LibraryAlbum has been fetched, function completes with total failure
                        completion(.failure(err))
                    }
                    
                } else {                            // Retry again
                    
                    // Update fetching status with error
                    fetchingStatus = .retryingWithError(error: err)
                    retryCount += 1
                    // Retry(as offset kept unchanged) fetching of current segment
                    continueFetching()
                }
                
            // Fetch has been marked completed
            default:
                break
                
            }
        }
        
        /// Function that fetches a segment of library albums contained in user library.
        /// - Parameters:
        ///   - limit: Maximum count of resources to be expected in response
        ///   - offset: The offset of starting resource to be expected in response
        ///   - completion: Completion handler of request result of type Swift.Result<([LibraryAlbum], newOffset: String, segmentStatus: FetchingStatus), Error>
        ///   - result: Result of request, .success(([LibraryAlbum], newOffset: String, segmentStatus: FetchingStatus)) or .failure(Error)
        func fetchSegmentalLibraryAlbums(limit: String, offset: String, completion: @escaping (_ result: Swift.Result<([LibraryAlbum], newOffset: String, segmentStatus: FetchingStatus), Error>) -> Void) {
            
            var newOffset: String = offset
            var segmentStatus: FetchingStatus = .preparingForStart
            
            let urlRequest = try! requestGenerator.createGetAllLibraryAlbumsRequest(limit: limit, offset: offset)
            
            // Update request status
            segmentStatus = .inProgress
            
            requestByAlamofireJSON(urlRequest: urlRequest) { result in
                var segmentalLibraryAlbumsArray: [LibraryAlbum] = []
                
                switch result {
                case .success(let responseJson):    // successfully got response from server
                    let segmentalLibraryAlbumsDataArray: [JSON] = responseJson["data"].array!
                    
                    segmentalLibraryAlbumsDataArray.forEach { libraryAlbumData in
                        // Parse resource object from JSON response
                        if let libraryAlbum = LibraryAlbum(albumData: libraryAlbumData) {
                            segmentalLibraryAlbumsArray.append(libraryAlbum)
                        } else {
                            // Parsing failed, complete segment with error
                            completion(.failure(HummingKitResponseError.responseCorrupted))
                            return
                        }
                    }
                    
                    // Detect existence of field "next"
                    if responseJson["next"].exists() {
                        // Try to parse offset from field "next"
                        let offsetParsingResult = regexSearch(for: "(\\d{2,})", in: responseJson["next"].string ?? "")
                        
                        switch offsetParsingResult {
                        case .success(let offsetParsed):
                            // Update offset variablefrom outer func
                            newOffset = offsetParsed
                        case .failure(let err):
                            // Field "next" exists but failed to parse offset value
                            // Complete with error
                            completion(.failure(err))
                            return
                        }
                        
                        // Update status, indicating current segment has been fetched and parsed
                        segmentStatus = .completed
                        completion(.success((segmentalLibraryAlbumsArray, newOffset: newOffset, segmentStatus: segmentStatus)))
                        return
                    } else {    // Field "next" does not exist, current segment is the ending
                        // Update status, indicating last segment has been fetched
                        segmentStatus = .ending
                        completion(.success((segmentalLibraryAlbumsArray, newOffset: newOffset, segmentStatus: segmentStatus)))
                        return
                    }
                    
                case .failure(let err): // failed to get response from server
                    completion(.failure(err))
                    return
                }
            }
        }
        
        // Start sequential(progressive) calling
        continueFetching()
    }
    
    // MARK: - Artists
    /// Fetch a catalog artist using their identifier.
    /// - Parameters:
    ///   - storefront: An identifier (ISO 3166 alpha-2 country codes) of the storefront which to perform request in
    ///   - artistID: The unique identifier of the artist
    ///   - completion: Completion handler of request result of type Swift.Result<CatalogArtist, Error>
    ///   - result: Result of request, .success(CatalogArtist) or .failure(Error)
    public func fetchACatalogArtist(storefront: String, artistID: String, completion: @escaping (_ result: Swift.Result<CatalogArtist, Error>) -> Void) {
        // Create URL Request using requestGenerator
        let urlRequest = requestGenerator.createGetACatalogArtistRequest(storefront: storefront, artistID: artistID)
        
        requestByAlamofireJSON(urlRequest: urlRequest) { result in
            var catalogArtistResult: Swift.Result<CatalogArtist, Error>
            
            switch result {
            case .success(let responseJson):
                let catalogArtistData: JSON = responseJson["data"].array![0]
                if let catalogArtist = CatalogArtist(artistData: catalogArtistData) {
                    catalogArtistResult = .success(catalogArtist)
                } else {
                    // Parsing failed, complete with error
                    catalogArtistResult = .failure(HummingKitResponseError.responseCorrupted)
                }
            case .failure(let err):
                catalogArtistResult = .failure(err)
            }
            
            completion(catalogArtistResult)
        }
    }
    
    /// Fetch multiple catalog artists using their identifiers.
    /// - Parameters:
    ///   - storefront: An identifier (ISO 3166 alpha-2 country codes) of the storefront which to perform request in
    ///   - artistIDs: The unique identifiers of the artists. Maximum fetch limit is 25.
    ///   - completion: Completion handler of request result of type Swift.Result<[CatalogArtist], Error>
    ///   - result: Result of request, .success([CatalogArtist]) or .failure(Error)
    public func fetchMultipleCatalogArtists(storefront: String, artistIDs: [String], completion: @escaping (_ result: Swift.Result<[CatalogArtist], Error>) -> Void) {
        
        // Declare and then initialize URL Request as initialization is failable due to array lengths
        var urlRequest: URLRequest
        do {
            urlRequest = try requestGenerator.createGetMultipleCatalogArtistsRequest(storefront: storefront, artistIDs: artistIDs)
        } catch {
            completion(.failure(error))
            return
        }
        
        requestByAlamofireJSON(urlRequest: urlRequest) { result in
            var catalogArtistsResult: Swift.Result<[CatalogArtist], Error>
            
            switch result {
            case .success(let responseJson):    // successfully get response from server
                // JSON array of CatalogArtist, each element is of JSON type containing one CatalogArtist data
                let catalogArtistsDataArray: [JSON] = responseJson["data"].array!
                
                var catalogArtistsArray: [CatalogArtist] = []
                
                catalogArtistsDataArray.forEach { catalogArtistData in
                    // Parse resource object from JSON response
                    if let catalogArtist = CatalogArtist(artistData: catalogArtistData) {
                        catalogArtistsArray.append(catalogArtist)
                    } else {
                        // Parsing failed, complete with error
                        completion(.failure(HummingKitResponseError.responseCorrupted))
                        return
                    }
                }
                
                // set result to be returned
                catalogArtistsResult = .success(catalogArtistsArray)
                
            case .failure(let err): // failed to get response
                catalogArtistsResult = .failure(err)
            }
            
            completion(catalogArtistsResult)
        }
    }
    
    /// Fetch the relationship of specified catalog artist using its identifier and relationship tag.
    /// - Parameters:
    ///   - storefront: An identifier (ISO 3166 alpha-2 country codes) of the storefront which to perform request in
    ///   - artistID: The unique identifier of the artist
    ///   - relationship: The name tag of the relationship to fetch for this catalog artist
    ///   - completion: Completion handler of request result of type Swift.Result<JSON, Error>
    ///   - result: Result of request, .success(JSON) or .failure(Error)
    public func fetchACatalogArtistRelationship(storefront: String, artistID: String, relationship: String, completion: @escaping (_ result: Swift.Result<JSON, Error>) -> Void) {
        // Create URL Request using requestGenerator
        let urlRequest = requestGenerator.createGetACatalogArtistRelationshipRequest(storefront: storefront, artistID: artistID, relationship: relationship)
        
        requestByAlamofireJSON(urlRequest: urlRequest) { result in
            completion(result)
        }
    }
    
    /// Fetch a library artist using their identifier.
    /// - Parameters:
    ///   - artistID: The unique identifier of the artist.
    ///   - completion: Completion handler of request result of type Swift.Result<LibraryArtist, Error>
    ///   - result: Result of request, .success(LibraryArtist) or .failure(Error)
    public func fetchALibraryArtist(artistID: String, completion: @escaping (_ result: Swift.Result<LibraryArtist, Error>) -> Void) {
        // Create URL Request using requestGenerator
        let urlRequest = requestGenerator.createGetALibraryArtistRequest(artistID: artistID)
        
        requestByAlamofireJSON(urlRequest: urlRequest) { result in
            var libraryArtistResult: Swift.Result<LibraryArtist, Error>
            
            switch result {
            case .success(let responseJson):
                let libraryArtistData: JSON = responseJson["data"].array![0]
                // Parse resource object from JSON response
                if let libraryArtist = LibraryArtist(artistData: libraryArtistData) {
                    libraryArtistResult = .success(libraryArtist)
                } else {
                    // Parsing failed, complete with error
                    libraryArtistResult = .failure(HummingKitResponseError.responseCorrupted)
                }
            case .failure(let err):
                libraryArtistResult = .failure(err)
            }
            
            completion(libraryArtistResult)
        }
    }
    
    /// Fetch the relationship of specified library artist using its identifier and relationship tag.
    /// - Parameters:
    ///   - artistID: The unique identifier of the artist.
    ///   - relationship: The name tag of the relationship to fetch for this library artist
    ///   - completion: Completion handler of request result of type Swift.Result<JSON, Error>
    ///   - result: Result of request, .success(JSON) or .failure(Error)
    public func fetchALibraryArtistRelationship(artistID: String, relationship: String, completion: @escaping (Swift.Result<JSON, Error>) -> Void) {
        // Create URL Request using requestGenerator
        let urlRequest = requestGenerator.createGetALibraryArtistRelationshipRequest(artistID: artistID, relationship: relationship)
        
        requestByAlamofireJSON(urlRequest: urlRequest) { result in
            completion(result)
        }
    }
    
    /// Fetch multiple library artists using their identifiers.
    /// - Parameters:
    ///   - artistIDs: The unique identifiers of the artists. Maximum fetch limit is 25.
    ///   - completion: Completion handler of request result of type Swift.Result<[LibraryArtist], Error>
    ///   - result: Result of request, .success([LibraryArtist]) or .failure(Error)
    public func fetchMultipleLibraryArtists(artistIDs: [String], completion: @escaping (Swift.Result<[LibraryArtist], Error>) -> Void) {
        
        // Declare and then initialize URL Request as initialization is failable due to array lengths
        var urlRequest: URLRequest
        do {
            urlRequest = try requestGenerator.createGetMultipleLibraryArtistsRequest(artistIDs: artistIDs)
        } catch {
            completion(.failure(error))
            return
        }
        
        requestByAlamofireJSON(urlRequest: urlRequest) { result in
            
            var libraryArtistsResult: Swift.Result<[LibraryArtist], Error>  // result to be modified and returned in completion handler
            
            switch result {
            case .success(let responseJson):    // successfully get response from server
                // JSON array of LibraryArtist, each element is of JSON type containing one LibraryArtist data
                let libraryArtistsDataArray: [JSON] = responseJson["data"].array!
                
                var libraryArtistsArray: [LibraryArtist] = []
                
                libraryArtistsDataArray.forEach { libaryArtistData in
                    // Parse resource object from JSON response
                    if let librarySong = LibraryArtist(artistData: libaryArtistData) {
                        libraryArtistsArray.append(librarySong)
                    } else {
                        // Parsing failed, complete with error
                        completion(.failure(HummingKitResponseError.responseCorrupted))
                        return
                    }
                }
                
                // set result to be returned
                libraryArtistsResult = .success(libraryArtistsArray)
                
            case .failure(let err): // failed to get response
                libraryArtistsResult = .failure(err)
            }
            
            completion(libraryArtistsResult)
        }
    }
    
    /// Fetch all library artists by segments.
    /// - Parameters:
    ///   - completion: Completion handler of request result of type Swift.Result<([LibraryArtist], FetchingStatus), Error>
    ///   - result: Result of request, .success([LibraryArtist], FetchingStatus) or .failure(Error)
    public func fetchAllLibraryArtists(completion: @escaping (_ result: Swift.Result<([LibraryArtist], FetchingStatus), Error>) -> Void) {
        
        let limit:  String = "100"  // default to maximum for efficiency
        var offset: String = "0"
        var retryCount: Int = 0
        var fetchingStatus: FetchingStatus = .preparingForStart
        var allLibraryArtists: [LibraryArtist] = []
        
        /// Function that recursively fetches paged LibraryArtist resource until no available resource left or error occurs
        func continueFetching() {
            switch fetchingStatus {
                
            // Requests of fetchAllLibraryArtists continuing or preparing to start
            case .preparingForStart, .inProgress:
                
                // Clear retry count and update fetching status
                retryCount = 0
                fetchingStatus = .inProgress
                
                fetchSegmentalLibraryArtists(limit: limit, offset: offset) { result in
                    switch result {
                        
                    // Segmental fetching succeeded
                    case .success((let segmentalLibraryArtistsArray, let newOffset, let segmentStatus)):
                        
                        // Append parsed segment of LibraryArtist
                        allLibraryArtists.append(contentsOf: segmentalLibraryArtistsArray)
                        
                        // Decide next action in accordance to segment fetching status
                        switch segmentStatus {
                            
                        // Segmental fetching completed
                        case .completed:
                            
                            // Update offset and fetching status for next segmental request
                            offset = newOffset
                            fetchingStatus = .inProgress
                            
                            // Continue next segmental fetch
                            continueFetching()
                            
                        // Current segment is the ending of all available resources
                        case .ending:
                            
                            // Update fetching status and complete fetchAllLibraryArtists function
                            fetchingStatus = .completed
                            completion(.success((allLibraryArtists, fetchingStatus)))
                        
                        // Case falling out-of-logic
                        default:
                            // Complete with error case being logically impossible to occur
                            print("Current case is unexpected.")
                            
                            // Complete with error
                            completion(.failure(HummingKitInternalError.impossibleCase))
                        }
                        
                    // Segmental fetch failed due to error
                    case .failure(let err):
                        // Update fetching status
                        fetchingStatus = .retryingWithError(error: err)
                        
                        // Retry(as offset kept unchanged) fetching of current segment
                        continueFetching()
                    }
                }
                
            // Current segment failed, retry recursively until retryCount hits maximum
            case .retryingWithError(let err): // Current segment fetching has failed on last try
                
                if retryCount >= retryCountMax {    // Has retried same request for 3 times
                    
                    if allLibraryArtists.count > 0 {
                        // As long as allLibraryArtists array contains objects, function completes with its content while flagged as .completedWithError
                        // Update fetching status and complete fetchAllLibraryArtists function
                        fetchingStatus = .completedWithError
                        completion(.success((allLibraryArtists, fetchingStatus)))
                    } else {
                        // When no LibraryArtist has been fetched, function completes with total failure
                        completion(.failure(err))
                    }
                    
                } else {                            // Retry again
                    
                    // Update fetching status with error
                    fetchingStatus = .retryingWithError(error: err)
                    retryCount += 1
                    // Retry(as offset kept unchanged) fetching of current segment
                    continueFetching()
                }
                
            // Fetch has been marked completed
            default:
                break
                
            }
        }
        
        /// Function that fetches a segment of library artists contained in user library.
        /// - Parameters:
        ///   - limit: Maximum count of resources to be expected in response.
        ///   - offset: The offset of starting resource to be expected in response.
        ///   - completion: Completion handler of request result of type Swift.Result<([LibraryArtist], newOffset: String, segmentStatus: FetchingStatus), Error>
        ///   - result: Result of request, .success(([LibraryArtist], newOffset: String, segmentStatus: FetchingStatus)) or .failure(Error)
        func fetchSegmentalLibraryArtists(limit: String, offset: String, completion: @escaping (_ result: Swift.Result<([LibraryArtist], newOffset: String, segmentStatus: FetchingStatus), Error>) -> Void) {
            
            var newOffset: String = offset
            var segmentStatus: FetchingStatus = .preparingForStart
            
            let urlRequest = try! requestGenerator.createGetAllLibraryArtistsRequest(limit: limit, offset: offset)
            
            // Update request status
            segmentStatus = .inProgress
            
            requestByAlamofireJSON(urlRequest: urlRequest) { result in
                var segmentalLibraryArtistsArray: [LibraryArtist] = []
                
                switch result {
                case .success(let responseJson):    // successfully got response from server
                    let segmentalLibraryArtistsDataArray: [JSON] = responseJson["data"].array!
                    
                    segmentalLibraryArtistsDataArray.forEach { libraryArtistData in
                        // Parse resource object from JSON response
                        if let libraryArtist = LibraryArtist(artistData: libraryArtistData) {
                            segmentalLibraryArtistsArray.append(libraryArtist)
                        } else {
                            // Parsing failed, complete segment with error
                            completion(.failure(HummingKitResponseError.responseCorrupted))
                            return
                        }
                    }
                    
                    // Detect existence of field "next"
                    if responseJson["next"].exists() {
                        // Try to parse offset from field "next"
                        let offsetParsingResult = regexSearch(for: "(\\d{2,})", in: responseJson["next"].string ?? "")
                        
                        switch offsetParsingResult {
                        case .success(let offsetParsed):
                            // Update offset variablefrom outer func
                            newOffset = offsetParsed
                        case .failure(let err):
                            // Field "next" exists but failed to parse offset value
                            // Complete with error
                            completion(.failure(err))
                            return
                        }
                        
                        // Update status, indicating current segment has been fetched and parsed
                        segmentStatus = .completed
                        completion(.success((segmentalLibraryArtistsArray, newOffset: newOffset, segmentStatus: segmentStatus)))
                        return
                    } else {    // Field "next" does not exist, current segment is the ending
                        // Update status, indicating last segment has been fetched
                        segmentStatus = .ending
                        completion(.success((segmentalLibraryArtistsArray, newOffset: newOffset, segmentStatus: segmentStatus)))
                    }
                    
                case .failure(let err): // failed to get response from server
                    completion(.failure(err))
                    return
                }
            }
        }
        
        // Start sequential(progressive) calling
        continueFetching()
    }
    
    // MARK: - Songs
    /// Fetch a catalog song using its identifier
    /// - Parameters:
    ///   - storefront: An identifier (ISO 3166 alpha-2 country codes) of the storefront which to perform request in
    ///   - songID: The unique identifier of the song.
    ///   - completion: Completion handler of request result of type Swift.Result<CatalogSong, Error>
    ///   - result: Result of request, .success(CatalogSong) or .failure(Error)
    public func fetchACatalogSong(storefront: String, songID: String, completion: @escaping (_ result: Swift.Result<CatalogSong, Error>) -> Void) {
        // Create URL Request using requestGenerator
        let urlRequest = requestGenerator.createGetACatalogSongRequest(storefront: storefront, songID: songID)
        
        requestByAlamofireJSON(urlRequest: urlRequest) { result in
            var catalogSongResult: Swift.Result<CatalogSong, Error> // result to be modified and returned in completion handler
            
            switch result {
            case .success(let responseJson):
                let catalogSongData: JSON = responseJson["data"].array![0]
                // Parse resource object from JSON response
                if let catalogSong = CatalogSong(songData: catalogSongData) {
                    catalogSongResult = .success(catalogSong)
                } else {
                    // Parsing failed, complete with error
                    catalogSongResult = .failure(HummingKitResponseError.responseCorrupted)
                }
            case .failure(let err):
                catalogSongResult = .failure(err)
            }
            
            completion(catalogSongResult)
        }
    }
    
    /// Fetch multiple catalog songs using their identifiers.
    /// - Parameters:
    ///   - storefront: An identifier (ISO 3166 alpha-2 country codes) of the storefront which to perform request in
    ///   - songIDs: An array of the identifiers of the albums. Maximum fetch limit is 300.
    ///   - completion: Completion handler of request result of type Swift.Result<[CatalogSong], Error>
    ///   - result: Result of request, .success([CatalogSong]) or .failure(Error)
    public func fetchMultipleCatalogSongs(storefront: String, songIDs: [String], completion: @escaping (_ result: Swift.Result<[CatalogSong], Error>) -> Void) {
        
        // Declare and then initialize URL Request as initialization is failable due to array lengths
        var urlRequest: URLRequest
        do {
            urlRequest = try requestGenerator.createGetMultipleCatalogSongsRequest(storefront: storefront, songIDs: songIDs)
        } catch {
            completion(.failure(error))
            return
        }
        
        requestByAlamofireJSON(urlRequest: urlRequest) { result in
            
            var catalogSongsResult: Swift.Result<[CatalogSong], Error>  // result to be modified and returned in completion handler
            
            switch result {
            case .success(let responseJson):    // successfully get response from server
                // JSON array of CatalogSong, each element is of JSON type containing one CatalogSong data
                let catalogSongsDataArray: [JSON] = responseJson["data"].array!
                
                var catalogSongsArray: [CatalogSong] = []
                
                catalogSongsDataArray.forEach { catalogSongData in
                    // Parse resource object from JSON response
                    if let catalogSong = CatalogSong(songData: catalogSongData) {
                        catalogSongsArray.append(catalogSong)
                    } else {
                        // Parsing failed, complete with error
                        completion(.failure(HummingKitResponseError.responseCorrupted))
                        return
                    }
                }
                
                // set result to be returned
                catalogSongsResult = .success(catalogSongsArray)
                
            case .failure(let err): // failed to get response
                catalogSongsResult = .failure(err)
            }
            
            completion(catalogSongsResult)
        }
    }
    
    
    // TODO: Fetch Multiple Catalog Songs by their ISRCs
    
    
    /// Fetch the relationship of specified catalog song using its identifier and relationship tag.
    /// - Parameters:
    ///   - storefront: An identifier (ISO 3166 alpha-2 country codes) of the storefront which to perform request in
    ///   - songID: The unique identifier of the song
    ///   - relationship: The name tag of the relationship to fetch for this catalog song
    ///   - completion: Completion handler of request result of type Swift.Result<JSON, Error>
    ///   - result: Result of request, .success(JSON) or .failure(Error)
    public func fetchACatalogSongRelationship(storefront: String, songID: String, relationship: String, completion: @escaping (_ result: Swift.Result<JSON, Error>) -> Void) {
        // Create URL Request using requestGenerator
        let urlRequest = requestGenerator.createGetACatalogSongRelationshipRequest(storefront: storefront, songID: songID, relationship: relationship)
        
        requestByAlamofireJSON(urlRequest: urlRequest) { result in
            completion(result)
        }
    }
    
    /// Fetch a library song using its identifier.
    /// - Parameters:
    ///   - songID: The unique identifier of the song
    ///   - completion: Completion handler of request result of type Swift.Result<LibrarySong, Error>
    ///   - result: Result of request, .success(LibrarySong) or .failure(Error)
    public func fetchALibrarySong(songID: String, completion: @escaping (_ result: Swift.Result<LibrarySong, Error>) -> Void) {
        // Create URL Request using requestGenerator
        let urlRequest = requestGenerator.createGetALibrarySongRequest(songID: songID)
        
        requestByAlamofireJSON(urlRequest: urlRequest) { result in
            var librarySongResult: Swift.Result<LibrarySong, Error> // result to be modified and returned in completion handler
            
            switch result {
            case .success(let responseJson):
                let librarySongData: JSON = responseJson["data"].array![0]
                // Parse resource object from JSON response
                if let librarySong = LibrarySong(songData: librarySongData) {
                    librarySongResult = .success(librarySong)
                } else {
                    // Parsing failed, complete with error
                    librarySongResult = .failure(HummingKitResponseError.responseCorrupted)
                }
            case .failure(let err):
                librarySongResult = .failure(err)
            }
            
            completion(librarySongResult)
        }
    }
    
    /// Fetch the relationship of specified library song using its identifier and relationship tag.
    /// - Parameters:
    ///   - songID: The unique identifier of the song
    ///   - relationship: The name tag of the relationship to fetch for this library song
    ///   - completion: Completion handler of request result of type Swift.Result<JSON, Error>
    ///   - result: Result of request, .success(JSON) or .failure(Error)
    public func fetchALibrarySongRelationship(songID: String, relationship: String, completion: @escaping (_ result: Swift.Result<JSON, Error>) -> Void) {
        // Create URL Request using requestGenerator
        let urlRequest = requestGenerator.createGetALibrarySongRelationshipRequest(songID: songID, relationship: relationship)
        
        requestByAlamofireJSON(urlRequest: urlRequest) { result in
            completion(result)
        }
    }
    
    /// Fetch multiple library songs using their identifiers.
    /// - Parameters:
    ///   - songIDs: An array of the identifiers of library songs. Maximum fetch limit is 300.
    ///   - completion: Completion handler of request result of type Swift.Result<[LibrarySong], Error>
    ///   - result: Result of request, .success([LibrarySong]) or .failure(Error)
    public func fetchMultipleLibrarySongs(songIDs: [String], completion: @escaping (_ result: Swift.Result<[LibrarySong], Error>) -> Void) {
        
        // Declare and then initialize URL Request as initialization is failable due to array lengths
        var urlRequest: URLRequest
        do {
            urlRequest = try requestGenerator.createGetMultipleLibrarySongsRequest(songIDs: songIDs)
        } catch {
            completion(.failure(error))
            return
        }
        
        requestByAlamofireJSON(urlRequest: urlRequest) { result in
            
            var librarySongsResult: Swift.Result<[LibrarySong], Error>  // result to be modified and returned in completion handler
            
            switch result {
            case .success(let responseJson):    // successfully get response from server
                // JSON array of LibrarySong, each element is of JSON type containing one LibrarySong data
                let librarySongsDataArray: [JSON] = responseJson["data"].array!
                
                var librarySongsArray: [LibrarySong] = []
                
                librarySongsDataArray.forEach { libarySongData in
                    // Parse resource object from JSON response
                    if let librarySong = LibrarySong(songData: libarySongData) {
                        librarySongsArray.append(librarySong)
                    } else {
                        // Parsing failed, complete with error
                        completion(.failure(HummingKitResponseError.responseCorrupted))
                        return
                    }
                }
                
                // set result to be returned
                librarySongsResult = .success(librarySongsArray)
                
            case .failure(let err): // failed to get response
                librarySongsResult = .failure(err)
            }
            
            completion(librarySongsResult)
        }
    }
    
    /// Fetch all library songs by segments.
    /// - Parameters:
    ///   - completion: Completion handler of request result of type Swift.Result<([LibrarySong], FetchingStatus), Error>
    ///   - result: Result of request, .success([LibrarySong], FetchingStatus) or .failure(Error)
    public func fetchAllLibrarySongs(completion: @escaping (_ result: Swift.Result<([LibrarySong], FetchingStatus), Error>) -> Void) {
        
        let limit:  String = "100"  // default to maximum for efficiency
        var offset: String = "0"
        var retryCount: Int = 0
        var fetchingStatus: FetchingStatus = .preparingForStart
        var allLibrarySongs: [LibrarySong] = []

        /// Function that recursively fetches paged LibrarySong resource until no available resource left or error occurs
        func continueFetching() {
            switch fetchingStatus {
                
            // Requests of fetchAllLibrarySongs continuing or preparing to start
            case .preparingForStart, .inProgress:
                
                // Clear retry count and update fetching status
                retryCount = 0
                fetchingStatus = .inProgress
                
                fetchSegmentalLibrarySongs(limit: limit, offset: offset) { result in
                    switch result {
                        
                    // Segmental fetching succeeded
                    case .success((let segmentalLibrarySongsArray, let newOffset, let segmentStatus)):
                        
                        // Append parsed segment of LibrarySong
                        allLibrarySongs.append(contentsOf: segmentalLibrarySongsArray)
                        
                        // Decide next action in accordance to segment fetching status
                        switch segmentStatus {
                            
                        // Segmental fetching completed
                        case .completed:
                            
                            // Update offset and fetching status for next segmental request
                            offset = newOffset
                            fetchingStatus = .inProgress
                            
                            // Continue next segmental fetch
                            continueFetching()
                            
                        // Current segment is the ending of all available resources
                        case .ending:
                            
                            // Update fetching status and complete fetchAllLibrarySongs function
                            fetchingStatus = .completed
                            completion(.success((allLibrarySongs, fetchingStatus)))
                        
                        // Case falling out-of-logic
                        default:
                            // Complete with error case being logically impossible to occur
                            completion(.failure(HummingKitInternalError.impossibleCase))
                        }
                        
                    // Segmental fetch failed due to error
                    case .failure(let err):
                        // Update fetching status
                        fetchingStatus = .retryingWithError(error: err)
                        
                        // Retry(as offset kept unchanged) fetching of current segment
                        continueFetching()
                    }
                }
                
            // Current segment failed, retry recursively until retryCount hits maximum
            case .retryingWithError(let err): // Current segment fetching has failed on last try
                
                if retryCount >= retryCountMax {    // Has retried same request for 3 times
                    
                    if allLibrarySongs.count > 0 {
                        // As long as allLibrarySongs array contains objects, function completes with its content while flagged as .completedWithError
                        // Update fetching status and complete fetchAllLibrarySongs function
                        fetchingStatus = .completedWithError
                        completion(.success((allLibrarySongs, fetchingStatus)))
                    } else {
                        // When no LibrarySong has been fetched, function completes with total failure
                        completion(.failure(err))
                    }
                    
                } else {                            // Retry again
                    
                    // Update fetching status with error
                    fetchingStatus = .retryingWithError(error: err)
                    retryCount += 1
                    // Retry(as offset kept unchanged) fetching of current segment
                    continueFetching()
                }
                
            // Fetch has been marked completed
            default:
                break
                
            }
        }

        /// Function that fetches a segment of library songs contained in user library.
        /// - Parameters:
        ///   - limit: Maximum count of resources to be expected in response
        ///   - offset: The offset of starting resource to be expected in response
        ///   - completion: Completion handler of request result of type Swift.Result<([LibrarySong], newOffset: String, segmentStatus: FetchingStatus), Error>
        ///   - result: Result of request, .success(([LibrarySong], newOffset: String, segmentStatus: FetchingStatus)) or .failure(Error)
        func fetchSegmentalLibrarySongs(limit: String, offset: String, completion: @escaping (_ result: Swift.Result<([LibrarySong], newOffset: String, segmentStatus: FetchingStatus), Error>) -> Void) {
            
            var newOffset: String = offset
            var segmentStatus: FetchingStatus = .preparingForStart
            
            let urlRequest = try! requestGenerator.createGetAllLibrarySongsRequest(limit: limit, offset: offset)
            
            // Update request status
            segmentStatus = .inProgress
            
            requestByAlamofireJSON(urlRequest: urlRequest) { result in
                var segmentalLibrarySongsArray: [LibrarySong] = []
                
                switch result {
                case .success(let responseJson):    // successfully got response from server
                    let segmentalLibrarySongsDataArray: [JSON] = responseJson["data"].array!
                    
                    segmentalLibrarySongsDataArray.forEach { librarySongData in
                        // Parse resource object from JSON response
                        if let librarySong = LibrarySong(songData: librarySongData) {
                            segmentalLibrarySongsArray.append(librarySong)
                        } else {
                            // Parsing failed, complete segment with error
                            completion(.failure(HummingKitResponseError.responseCorrupted))
                            return
                        }
                    }
                    
                    // Detect existence of field "next"
                    if responseJson["next"].exists() {
                        // Try to parse offset from field "next"
                        let offsetParsingResult = regexSearch(for: "(\\d{2,})", in: responseJson["next"].string ?? "")
                        
                        switch offsetParsingResult {
                        case .success(let offsetParsed):
                            // Update offset variablefrom outer func
                            newOffset = offsetParsed
                        case .failure(let err):
                            // Field "next" exists but failed to parse offset value
                            // Complete with error
                            completion(.failure(err))
                            return
                        }
                        
                        // Update status, indicating current segment has been fetched and parsed
                        segmentStatus = .completed
                        completion(.success((segmentalLibrarySongsArray, newOffset: newOffset, segmentStatus: segmentStatus)))
                        return
                    } else {    // Field "next" does not exist, current segment is expected to be ultimate
                        // Update status, indicating last segment has been fetched
                        segmentStatus = .ending
                        completion(.success((segmentalLibrarySongsArray, newOffset: newOffset, segmentStatus: segmentStatus)))
                        return
                    }
                    
                case .failure(let err): // failed to get response
                    completion(.failure(err))
                }
            }
        }

        // Start sequential(progressive) calling
        continueFetching()

    }
    
    // MARK: - Music Videos(MV)
    /// Fetch a catalog music video using its identifier.
    /// - Parameters:
    ///   - storefront: An identifier (ISO 3166 alpha-2 country codes) of the storefront which to perform request in
    ///   - mvID: The unique identifier of the music video
    ///   - completion: Completion handler of request result of type Swift.Result<CatalogMV, Error>
    ///   - result: Result of request, .success(CatalogMV) or .failure(Error)
    public func fetchACatalogMV(storefront: String, mvID: String, completion: @escaping (_ result: Swift.Result<CatalogMV, Error>) -> Void) {
        // Create URL Request using requestGenerator
        let urlRequest = requestGenerator.createGetACatalogMVRequest(storefront: storefront, mvID: mvID)
        
        requestByAlamofireJSON(urlRequest: urlRequest) { result in
            var catalogMVResult: Swift.Result<CatalogMV, Error> // result to be modified and returned in completion handler
            
            switch result {
            case .success(let responseJson):
                let catalogMVData: JSON = responseJson["data"].array![0]
                if let catalogMV = CatalogMV(mvData: catalogMVData) {
                    catalogMVResult = .success(catalogMV)
                } else {
                    // Parsing failed, complete with error
                    catalogMVResult = .failure(HummingKitResponseError.responseCorrupted)
                }
            case .failure(let err):
                catalogMVResult = .failure(err)
            }
            
            completion(catalogMVResult)
        }
    }
    
    /// Fetch the relationship of specified catalog music video using its identifier and relationship tag.
    /// - Parameters:
    ///   - storefront: An identifier (ISO 3166 alpha-2 country codes) of the storefrontwhich to perform request in
    ///   - mvID: The unique identifier of the music video
    ///   - relationship: The name tag of the relationship to fetch for this catalog music video
    ///   - completion: Completion handler of request result of type Swift.Result<JSON, Error>
    ///   - result: Result of request, .success(JSON) or .failure(Error)
    public func fetchACatalogMVRelationship(storefront: String, mvID: String, relationship: String, completion: @escaping (_ result: Swift.Result<JSON, Error>) -> Void) {
        // Create URL Request using requestGenerator
        let urlRequest = requestGenerator.createGetACatalogMVRelationshipRequest(storefront: storefront, mvID: mvID, relationship: relationship)
        
        requestByAlamofireJSON(urlRequest: urlRequest) { result in
            completion(result)
        }
    }
    
    /// Fetch multiple catalog music videos using their identifiers.
    /// - Parameters:
    ///   - storefront: An identifier (ISO 3166 alpha-2 country codes) of the storefront which to perform request in
    ///   - mvIDs: An array of the identifiers of the music videos. Maximum fetch limit is 100.
    ///   - completion: Completion handler of request result of type Swift.Result<[CatalogMV], Error>
    ///   - result: Result of request, .success([CatalogMV]) or .failure(Error)
    public func fetchMultipleCatalogMVs(storefront: String, mvIDs: [String], completion: @escaping (_ result: Swift.Result<[CatalogMV], Error>) -> Void) {
        
        // Declare and then initialize URL Request as initialization is failable due to array lengths
        var urlRequest: URLRequest
        do {
            urlRequest = try requestGenerator.createGetMultipleCatalogMVsRequest(storefront: storefront, mvIDs: mvIDs)
        } catch {
            completion(.failure(error))
            return
        }
        
        requestByAlamofireJSON(urlRequest: urlRequest) { result in
            var catalogMVsResult: Swift.Result<[CatalogMV], Error>  // result to be modified and returned in completion handler
            
            switch result {
            case .success(let responseJson):    // successfully get response from server
                // JSON array of CatalogMV, each element is of JSON type containing one CatalogMV data
                let catalogMVsDataArray: [JSON] = responseJson["data"].array!
                
                var catalogMVsArray: [CatalogMV] = []
                
                catalogMVsDataArray.forEach { catalogMVData in
                    // Parse resource object from JSON response
                    if let catalogMV = CatalogMV(mvData: catalogMVData) {
                        catalogMVsArray.append(catalogMV)
                    } else {
                        // Parsing failed, complete with error
                        completion(.failure(HummingKitResponseError.responseCorrupted))
                        return
                    }
                }
                
                // set result to be returned
                catalogMVsResult = .success(catalogMVsArray)
                
            case .failure(let err): // failed to get response
                catalogMVsResult = .failure(err)
            }
            
            completion(catalogMVsResult)
        }
    }
    
    
    // TODO: Get Multiple Catalog MVs by ISRC
    
    
    /// Fetch a library music video using its identifier.
    /// - Parameters:
    ///   - mvID: The unique identifier of the music video
    ///   - completion: Completion handler of request result of type Swift.Result<LibraryMV, Error>
    ///   - result: Result of request, .success(LibraryMV) or .failure(Error)
    public func fetchALibraryMV(mvID: String, completion: @escaping (_ result: Swift.Result<LibraryMV, Error>) -> Void) {
        // Create URL Request using requestGenerator
        let urlRequest = requestGenerator.createGetALibraryMVRequest(mvID: mvID)
        
        requestByAlamofireJSON(urlRequest: urlRequest) { result in
            var libraryMVResult: Swift.Result<LibraryMV, Error> // result to be modified and returned in completion handler
            
            switch result {
            case .success(let responseJson):
                let libraryMVData: JSON = responseJson["data"].array![0]
                // Parse resource object from JSON response
                if let libraryMV = LibraryMV(mvData: libraryMVData) {
                    libraryMVResult = .success(libraryMV)
                } else {
                    // Parsing failed, complete with error
                    libraryMVResult = .failure(HummingKitResponseError.responseCorrupted)
                }
            case .failure(let err):
                libraryMVResult = .failure(err)
            }
            
            completion(libraryMVResult)
        }
    }
    
    /// Fetch the relationship of specified library music video using its identifier and relationship tag.
    /// - Parameters:
    ///   - mvID: The unique identifier of the music video
    ///   - relationship: The name tag of the relationship to fetch for this library music video
    ///   - completion: Completion handler of request result of type Swift.Result<JSON, Error>
    ///   - result: Result of request, .success(JSON) or .failure(Error)
    public func fetchALibraryMVRelationship(mvID: String, relationship: String, completion: @escaping (_ result: Swift.Result<JSON, Error>) -> Void) {
        // Create URL Request using requestGenerator
        let urlRequest = requestGenerator.createGetALibraryMVRelationshipRequest(mvID: mvID, relationship: relationship)
        
        requestByAlamofireJSON(urlRequest: urlRequest) { result in
            completion(result)
        }
    }
    
    /// Fetch multiple library music videos using their identifiers.
    /// - Parameters:
    ///   - mvIDs: An array of the identifiers of music videos. Maximum fetch limit is 100.
    ///   - completion: Completion handler of request result of type Swift.Result<[LibraryMV], Error>
    ///   - result: Result of request, .success([LibraryMV]) or .failure(Error)
    public func fetchMultipleLibraryMVs(mvIDs: [String], completion: @escaping (_ result: Swift.Result<[LibraryMV], Error>) -> Void) {
        
        // Declare and then initialize URL Request as initialization is failable due to array lengths
        var urlRequest: URLRequest
        do {
            urlRequest = try requestGenerator.createGetMultipleLibraryMVsRequest(mvIDs: mvIDs)
        } catch {
            completion(.failure(error))
            return
        }
        
        requestByAlamofireJSON(urlRequest: urlRequest) { result in
            var libraryMVsResult: Swift.Result<[LibraryMV], Error>  // result to be modified and returned in completion handler
            
            switch result {
            case .success(let responseJson):    // successfully get response from server
                // JSON array of LibraryMV, each element is of JSON type containing one LibraryMV data
                let libraryMVsDataArray: [JSON] = responseJson["data"].array!
                
                var libraryMVsArray: [LibraryMV] = []
                
                // parse each catalogAlbum from each JSON
                libraryMVsDataArray.forEach { libaryMVData in
                    if let libraryMV = LibraryMV(mvData: libaryMVData) {
                        libraryMVsArray.append(libraryMV)
                    } else {
                        // Parsing failed, complete with error
                        completion(.failure(HummingKitResponseError.responseCorrupted))
                        return
                    }
                }
                
                // set result to be returned
                libraryMVsResult = .success(libraryMVsArray)
                
            case .failure(let err): // failed to get response
                libraryMVsResult = .failure(err)
            }
            
            completion(libraryMVsResult)
        }
    }
    
    /// Fetch all library music videos by segments.
    /// - Parameters:
    ///   - completion: Completion handler of request result of type Swift.Result<([LibraryMV], FetchingStatus), Error>
    ///   - result: Result of request, .success([LibraryMV], FetchingStatus) or .failure(Error)
    public func fetchAllLibraryMVs(completion: @escaping (_ result: Swift.Result<([LibraryMV], FetchingStatus), Error>) -> Void) {
        
        let limit:  String = "100"  // default to maximum for efficiency
        var offset: String = "0"
        var retryCount: Int = 0
        var fetchingStatus: FetchingStatus = .preparingForStart
        var allLibraryMVs: [LibraryMV] = []

        /// Function that recursively fetches paged LibraryMV resource until no available resource left or error occurs
        func continueFetching() {
            switch fetchingStatus {
                
            // Requests of fetchAllLibraryMVs continuing or preparing to start
            case .preparingForStart, .inProgress:
                
                // Clear retry count and update fetching status
                retryCount = 0
                fetchingStatus = .inProgress
                
                fetchSegmentalLibraryMVs(limit: limit, offset: offset) { result in
                    switch result {
                        
                    // Segmental fetching succeeded
                    case .success((let segmentalLibraryMVsArray, let newOffset, let segmentStatus)):
                        
                        // Append parsed segment of LibraryMV
                        allLibraryMVs.append(contentsOf: segmentalLibraryMVsArray)
                        
                        // Decide next action in accordance to segment fetching status
                        switch segmentStatus {
                            
                        // Segmental fetching completed
                        case .completed:
                            
                            // Update offset and fetching status for next segmental request
                            offset = newOffset
                            fetchingStatus = .inProgress
                            
                            // Continue next segmental fetch
                            continueFetching()
                            
                        // Current segment is the ending of all available resources
                        case .ending:
                            
                            // Update fetching status and complete fetchAllLibraryMVs function
                            fetchingStatus = .completed
                            completion(.success((allLibraryMVs, fetchingStatus)))
                        
                        // Case falling out-of-logic
                        default:
                            // Complete with error case being logically impossible to occur
                            completion(.failure(HummingKitInternalError.impossibleCase))
                        }
                        
                    // Segmental fetching failed due to error
                    case .failure(let err):
                        // Update fetching status
                        fetchingStatus = .retryingWithError(error: err)
                        
                        // Retry(as offset kept unchanged) fetching of current segment
                        continueFetching()
                    }
                }
                
            // Current segment failed, retry recursively until retryCount hits maximum
            case .retryingWithError(let err): // Current segment fetching has failed on last try
                
                if retryCount >= retryCountMax {    // Has retried same request for 3 times
                    
                    if allLibraryMVs.count > 0 {
                        // As long as allLibraryMVs array contains objects, function completes with its content while flagged as .completedWithError
                        // Update fetching status and complete fetchAllLibraryMVs function
                        fetchingStatus = .completedWithError
                        completion(.success((allLibraryMVs, fetchingStatus)))
                    } else {
                        // When no LibraryMV has been fetched, function completes with total failure
                        completion(.failure(err))
                    }
                    
                } else {                            // Retry again
                    
                    // Update fetching status with error
                    fetchingStatus = .retryingWithError(error: err)
                    retryCount += 1
                    // Retry(as offset kept unchanged) fetching of current segment
                    continueFetching()
                }
                
            // Fetch has been marked completed
            default:
                break
                
            }
        }

        /// Function that fetches a segment of library music videos contained in user library.
        /// - Parameters:
        ///   - limit: Maximum count of resources to be expected in response
        ///   - offset: The offset of starting resource to be expected in response
        ///   - completion: Completion handler of request result of type Swift.Result<([LibraryMV], newOffset: String, segmentStatus: FetchingStatus), Error>
        ///   - result: Result of request, .success(([LibraryMV], newOffset: String, segmentStatus: FetchingStatus)) or .failure(Error)
        func fetchSegmentalLibraryMVs(limit: String, offset: String, completion: @escaping (_ result: Swift.Result<([LibraryMV], newOffset: String, segmentStatus: FetchingStatus), Error>) -> Void) {
            
            var newOffset: String = offset
            var segmentStatus: FetchingStatus = .preparingForStart
            
            let urlRequest = try! requestGenerator.createGetAllLibraryMVsRequest(limit: limit, offset: offset)
            
            // Update request status
            segmentStatus = .inProgress
            
            requestByAlamofireJSON(urlRequest: urlRequest) { result in
                var segmentalLibraryMVsArray: [LibraryMV] = []
                
                switch result {
                case .success(let responseJson):    // successfully got response from server
                    let segmentalLibraryMVsDataArray: [JSON] = responseJson["data"].array!
                    
                    segmentalLibraryMVsDataArray.forEach { libraryMVData in
                        // Parse resource object from JSON response
                        if let libraryMV = LibraryMV(mvData: libraryMVData) {
                            segmentalLibraryMVsArray.append(libraryMV)
                        } else {
                            // Parsing failed, complete segment with error
                            completion(.failure(HummingKitResponseError.responseCorrupted))
                            return
                        }
                    }
                    
                    // Detect existence of field "next"
                    if responseJson["next"].exists() {
                        // Try to parse offset from field "next"
                        let offsetParsingResult = regexSearch(for: "(\\d{2,})", in: responseJson["next"].string ?? "")
                        
                        switch offsetParsingResult {
                        case .success(let offsetParsed):
                            // Update offset variablefrom outer func
                            newOffset = offsetParsed
                        case .failure(let err):
                            // Field "next" exists but failed to parse offset value
                            // Complete with error
                            completion(.failure(err))
                            return
                        }
                        
                        // Update status, indicating current segment has been fetched and parsed
                        segmentStatus = .completed
                        completion(.success((segmentalLibraryMVsArray, newOffset: newOffset, segmentStatus: segmentStatus)))
                        return
                    } else {    // Field "next" does not exist, current segment is the ending
                        // Update status, indicating last segment has been fetched
                        segmentStatus = .ending
                        completion(.success((segmentalLibraryMVsArray, newOffset: newOffset, segmentStatus: segmentStatus)))
                        return
                    }
                    
                case .failure(let err): // failed to get response
                    completion(.failure(err))
                    return
                }
            }
        }

        // Start sequential(progressive) calling
        continueFetching()

    }
    
    // MARK: - Playlist
    /// Fetch a catalog playlist using its identifier
    /// - Parameters:
    ///   - storefront: An identifier (ISO 3166 alpha-2 country codes) of the storefront which to perform request in
    ///   - playlistID: The unique identifier of the playlist
    ///   - completion: Completion handler of request result of type Swift.Result<CatalogPlaylist, Error>
    ///   - result: Result of request, .success(CatalogPlaylist) or .failure(Error)
    public func fetchACatalogPlaylist(storefront: String, playlistID: String, completion: @escaping (_ result: Swift.Result<CatalogPlaylist, Error>) -> Void) {
        // Create URL Request using requestGenerator
        let urlRequest = requestGenerator.createGetACatalogPlaylistRequest(storefront: storefront, playlistID: playlistID)
        
        requestByAlamofireJSON(urlRequest: urlRequest) { result in
            var catalogPlaylistResult: Swift.Result<CatalogPlaylist, Error> // result to be modified and returned in completion handler
            
            switch result {
            case .success(let responseJson):
                let catalogPlaylistData: JSON = responseJson["data"].array![0]
                // Parse resource object from JSON response
                if let catalogPlaylist = CatalogPlaylist(playlistData: catalogPlaylistData) {
                    catalogPlaylistResult = .success(catalogPlaylist)
                } else {
                    // Parsing failed, complete with error
                    catalogPlaylistResult = .failure(HummingKitResponseError.responseCorrupted)
                }
            case .failure(let err):
                catalogPlaylistResult = .failure(err)
            }
            
            completion(catalogPlaylistResult)
        }
    }
    
    /// Fetch the relationship of specified catalog album using its identifier and relationship tag.
    /// - Parameters:
    ///   - storefront: An identifier (ISO 3166 alpha-2 country codes) of the storefront which to perform request in
    ///   - playlistID: The unique identifier of the playlist
    ///   - relationship: The name tag of the relationship to fetch for this catalog playlist
    ///   - completion: Completion handler of request result of type Swift.Result<JSON, Error>
    ///   - result: Result of request, .success(JSON) or .failure(Error)
    public func fetchACatalogPlaylistRelationship(storefront: String, playlistID: String, relationship: String, completion: @escaping (_ result: Swift.Result<JSON, Error>) -> Void) {
        // Create URL Request using requestGenerator
        let urlRequest = requestGenerator.createGetACatalogPlaylistRelationshipRequest(storefront: storefront, playlistID: playlistID, relationship: relationship)
        
        requestByAlamofireJSON(urlRequest: urlRequest) { result in
            completion(result)
        }
    }
    
    /// Fetch multiple catalog playlists using their identifiers.
    /// - Parameters:
    ///   - storefront: An identifier (ISO 3166 alpha-2 country codes) of the storefront which to perform request in
    ///   - playlistIDs: An array of the identifiers of playlists. Maximum fetch limit is 25.
    ///   - completion: Completion handler of request result of type Swift.Result<[CatalogPlaylist], Error>
    ///   - result: Result of request, .success([CatalogPlaylist]) or .failure(Error)
    public func fetchMultipleCatalogPlaylists(storefront: String, playlistIDs: [String], completion: @escaping (_ result: Swift.Result<[CatalogPlaylist], Error>) -> Void) {
        
        // Declare and then initialize URL Request as initialization is failable due to array lengths
        var urlRequest: URLRequest
        do {
            urlRequest = try requestGenerator.createGetMultipleCatalogPlaylistsRequest(storefront: storefront, playlistIDs: playlistIDs)
        } catch {
            completion(.failure(error))
            return
        }
        
        requestByAlamofireJSON(urlRequest: urlRequest) { result in
            
            var catalogPlaylistsResult: Swift.Result<[CatalogPlaylist], Error>  // result to be modified and returned in completion handler
            
            switch result {
            case .success(let responseJson):    // successfully get response from server
                // JSON array of CatalogPlaylist, each element is of JSON type containing one CatalogPlaylist data
                let catalogPlaylistsDataArray: [JSON] = responseJson["data"].array!
                
                var catalogPlaylistsArray: [CatalogPlaylist] = []
                
                catalogPlaylistsDataArray.forEach { catalogPlaylistData in
                    // Parse resource object from JSON response
                    if let catalogPlaylist = CatalogPlaylist(playlistData: catalogPlaylistData) {
                        catalogPlaylistsArray.append(catalogPlaylist)
                    } else {
                        // Parsing failed, complete with error
                        completion(.failure(HummingKitResponseError.responseCorrupted))
                        return
                    }
                }
                
                // set result to be returned
                catalogPlaylistsResult = .success(catalogPlaylistsArray)
                
            case .failure(let err): // failed to get response
                catalogPlaylistsResult = .failure(err)
            }
            
            completion(catalogPlaylistsResult)
        }
    }
    
    /// Fetch a library playlist using its identifier
    /// - Parameters:
    ///   - playlistID: The unique identifier of the playlist.
    ///   - completion: Completion handler of request result of type Swift.Result<LibraryPlaylist, Error>
    ///   - result: Result of request, .success(LibraryPlaylist) or .failure(Error)
    public func fetchALibraryPlaylist(playlistID: String, completion: @escaping (_ result: Swift.Result<LibraryPlaylist, Error>) -> Void) {
        // Create URL Request using requestGenerator
        let urlRequest = requestGenerator.createGetALibraryPlaylistRequest(playlistID: playlistID)
        
        requestByAlamofireJSON(urlRequest: urlRequest) { result in
            var libraryPlaylistResult: Swift.Result<LibraryPlaylist, Error> // result to be modified and returned in completion handler
            
            switch result {
            case .success(let responseJson):
                let libraryPlaylistData: JSON = responseJson["data"].array![0]
                // Parse resource object from JSON response
                if let libraryPlaylist = LibraryPlaylist(playlistData: libraryPlaylistData) {
                    libraryPlaylistResult = .success(libraryPlaylist)
                } else {
                    // Parsing failed, complete with error
                    libraryPlaylistResult = .failure(HummingKitResponseError.responseCorrupted)
                }
            case .failure(let err):
                libraryPlaylistResult = .failure(err)
            }
            
            completion(libraryPlaylistResult)
        }
    }
    
    /// Fetch the relationship of specified library playlist using its identifier and relationship tag.
    /// - Parameters:
    ///   - playlistID: The unique identifier of the playlist
    ///   - relationship: The name tag of the relationship to fetch for this library playlist
    ///   - completion: Completion handler of request result of type Swift.Result<JSON, Error>
    ///   - result: Result of request, .success(JSON) or .failure(Error)
    public func fetchALibraryPlaylistRelationship(playlistID: String, relationship: String, completion: @escaping (_ result: Swift.Result<JSON, Error>) -> Void) {
        // Create URL Request using requestGenerator
        let urlRequest = requestGenerator.createGetALibraryPlaylistRelationshipRequest(playlistID: playlistID, relationship: relationship)
        
        requestByAlamofireJSON(urlRequest: urlRequest) { result in
            completion(result)
        }
    }
    
    /// Fetch multiple library playlists using their identifiers.
    /// - Parameters:
    ///   - playlistIDs: An array of the identifiers of playlists. Maximum fetch limit is 25.
    ///   - completion: Completion handler of request result of type Swift.Result<[LibraryPlaylist], Error>
    ///   - result: Result of request, .success([LibraryPlaylist]) or .failure(Error)
    public func fetchMultipleLibraryPlaylists(storefront: String, playlistIDs: [String], completion: @escaping (_ result: Swift.Result<[LibraryPlaylist], Error>) -> Void) {
        
        // Declare and then initialize URL Request as initialization is failable due to array lengths
        var urlRequest: URLRequest
        do {
            urlRequest = try requestGenerator.createGetMultipleLibraryPlaylistsRequest(playlistIDs: playlistIDs)
        } catch {
            completion(.failure(error))
            return
        }
        
        requestByAlamofireJSON(urlRequest: urlRequest) { result in
            var libraryPlaylistsResult: Swift.Result<[LibraryPlaylist], Error>  // result to be modified and returned in completion handler
            
            switch result {
            case .success(let responseJson):    // successfully get response from server
                // JSON array of LibraryPlaylists, each element is of JSON type containing one LibraryPlaylist data
                let libraryPlaylistsDataArray: [JSON] = responseJson["data"].array!
                
                var libraryPlaylistsArray: [LibraryPlaylist] = []
                
                libraryPlaylistsDataArray.forEach { libraryPlaylistData in
                    // Parse resource object from JSON response
                    if let libraryPlaylist = LibraryPlaylist(playlistData: libraryPlaylistData) {
                        libraryPlaylistsArray.append(libraryPlaylist)
                    } else {
                        // Parsing failed, complete with error
                        completion(.failure(HummingKitResponseError.responseCorrupted))
                        return
                    }
                }
                
                // set result to be returned
                libraryPlaylistsResult = .success(libraryPlaylistsArray)
                
            case .failure(let err): // failed to get response
                libraryPlaylistsResult = .failure(err)
            }
            
            completion(libraryPlaylistsResult)
        }
    }
    
    /// Fetch all library playlists by segments.
    /// - Parameters:
    ///   - completion: Completion handler of request result of type Swift.Result<([LibraryPlaylist], FetchingStatus), Error>
    ///   - result: Result of request, .success([LibraryPlaylist], FetchingStatus) or .failure(Error)
    public func fetchAllLibraryPlaylists(completion: @escaping (_ result: Swift.Result<([LibraryPlaylist], FetchingStatus), Error>) -> Void) {
        
        let limit:  String = "100"  // default to maximum for efficiency
        var offset: String = "0"
        var retryCount: Int = 0
        var fetchingStatus: FetchingStatus = .preparingForStart
        var allLibraryPlaylists: [LibraryPlaylist] = []

        /// Function that recursively fetches paged LibraryPlaylist resource until no available resource left or error occurs
        func continueFetching() {
            switch fetchingStatus {
                
            // Requests of fetchAllLibraryPlaylists continuing or preparing to start
            case .preparingForStart, .inProgress:
                
                // Clear retry count and update fetching status
                retryCount = 0
                fetchingStatus = .inProgress
                
                fetchSegmentalLibraryPlaylists(limit: limit, offset: offset) { result in
                    switch result {
                        
                    // Segmental fetching succeeded
                    case .success((let segmentalLibraryPlaylistsArray, let newOffset, let segmentStatus)):
                        
                        // Append parsed segment of LibraryPlaylist
                        allLibraryPlaylists.append(contentsOf: segmentalLibraryPlaylistsArray)
                        
                        // Decide next action in accordance to segment fetching status
                        switch segmentStatus {
                            
                        // Segmental fetching completed
                        case .completed:
                            
                            // Update offset and fetching status for next segmental request
                            offset = newOffset
                            fetchingStatus = .inProgress
                            
                            // Continue next segmental fetch
                            continueFetching()
                            
                        // Current segment is the ending of all available resources
                        case .ending:
                            
                            // Update fetching status and complete fetchAllLibraryPlaylists function
                            fetchingStatus = .completed
                            completion(.success((allLibraryPlaylists, fetchingStatus)))
                        
                        // Case falling out-of-logic
                        default:
                            // Complete with error case being logically impossible to occur
                            completion(.failure(HummingKitInternalError.impossibleCase))
                        }
                        
                    // Segmental fetch failed due to error
                    case .failure(let err):
                        // Update fetching status
                        fetchingStatus = .retryingWithError(error: err)
                        
                        // Retry(as offset kept unchanged) fetching of current segment
                        continueFetching()
                    }
                }
                
            // Current segment failed, retry recursively until retryCount hits maximum
            case .retryingWithError(let err): // Current segment fetching has failed on last try
                
                if retryCount >= retryCountMax {    // Has retried same request for 3 times
                    
                    if allLibraryPlaylists.count > 0 {
                        // As long as allLibraryPlaylists array contains objects, function completes with its content while flagged as .completedWithError
                        // Update fetching status and complete fetchAllLibraryPlaylists function
                        fetchingStatus = .completedWithError
                        completion(.success((allLibraryPlaylists, fetchingStatus)))
                    } else {
                        // When no LibraryPlaylist has been fetched, function completes with total failure
                        completion(.failure(err))
                    }
                    
                } else {                            // Retry again
                    
                    // Update fetching status with error
                    fetchingStatus = .retryingWithError(error: err)
                    retryCount += 1
                    // Retry(as offset kept unchanged) fetching of current segment
                    continueFetching()
                }
                
            // Fetch has been marked completed
            default:
                break
                
            }
        }

        /// Function that fetches a segment of library playlists contained in user library.
        /// - Parameters:
        ///   - limit: Maximum count of resources to be expected in response
        ///   - offset: The offset of starting resource to be expected in response
        ///   - completion: Completion handler of request result of type Swift.Result<([LibraryPlaylist], newOffset: String, segmentStatus: FetchingStatus), Error>
        ///   - result: Result of request, .success(([LibraryPlaylist], newOffset: String, segmentStatus: FetchingStatus)) or .failure(Error)
        func fetchSegmentalLibraryPlaylists(limit: String, offset: String, completion: @escaping (_ result: Swift.Result<([LibraryPlaylist], newOffset: String, segmentStatus: FetchingStatus), Error>) -> Void) {
            
            var newOffset: String = offset
            var segmentStatus: FetchingStatus = .preparingForStart
            
            let urlRequest = try! requestGenerator.createGetAllLibraryPlaylistsRequest(limit: limit, offset: offset)
            
            // Update request status
            segmentStatus = .inProgress
            
            requestByAlamofireJSON(urlRequest: urlRequest) { result in
                var segmentalLibraryPlaylistsArray: [LibraryPlaylist] = []
                
                switch result {
                case .success(let responseJson):    // successfully got response from server
                    let segmentalLibraryPlaylistsDataArray: [JSON] = responseJson["data"].array!
                    
                    segmentalLibraryPlaylistsDataArray.forEach { libraryPlaylistData in
                        // Parse resource object from JSON response
                        if let libraryPlaylist = LibraryPlaylist(playlistData: libraryPlaylistData) {
                            segmentalLibraryPlaylistsArray.append(libraryPlaylist)
                        } else {
                            // Parsing failed, complete segment with error
                            completion(.failure(HummingKitResponseError.responseCorrupted))
                            return
                        }
                    }
                    
                    // Detect existence of field "next"
                    if responseJson["next"].exists() {
                        // Try to parse offset from field "next"
                        let offsetParsingResult = regexSearch(for: "(\\d{2,})", in: responseJson["next"].string ?? "")
                        
                        switch offsetParsingResult {
                        case .success(let offsetParsed):
                            // Update offset variablefrom outer func
                            newOffset = offsetParsed
                        case .failure(let err):
                            // Field "next" exists but failed to parse offset value
                            // Complete with error
                            completion(.failure(err))
                            return
                        }
                        
                        // Update status, indicating current segment has been fetched and parsed
                        segmentStatus = .completed
                        completion(.success((segmentalLibraryPlaylistsArray, newOffset: newOffset, segmentStatus: segmentStatus)))
                        return
                    } else {    // Field "next" does not exist, current segment is the ending
                        // Update status, indicating last segment has been fetched
                        segmentStatus = .ending
                        completion(.success((segmentalLibraryPlaylistsArray, newOffset: newOffset, segmentStatus: segmentStatus)))
                        return
                    }
                    
                case .failure(let err): // failed to get response from server
                    completion(.failure(err))
                }
            }
        }

        // Start sequential(progressive) calling
        continueFetching()
    }
    
    /// Create a new library playlist.
    /// - Parameters:
    ///   - name: The name of playlist to be created
    ///   - description: Optional. The description of the playlist to be created
    ///   - songsIDs: An array of identifiers of songs to be contained in the playlist
    ///   - completion: Completion handler of request result of type Swift.Result<String, Error>
    ///   - result: Result of request, .success(status) or .failure(Error)
    public func createAPlaylist(name: String, description: String?, songsIDs: [String], completion: @escaping (_ result: Swift.Result<String, Error>) -> Void) {
        // Handles optional description field
        let plDescription = description ?? ""
        // Create URL Request using requestGenerator
        let urlRequest = requestGenerator.createCreateANewLibraryPlaylistRequest(name: name, description: plDescription, songsIDs: songsIDs)
        
        requestByAlamofireString(urlRequest: urlRequest) { result in
            completion(result)
        }
    }
    
    /// Add songs to a library playlist owned by the user, using their identifiers
    /// - Parameters:
    ///   - playlistID: The unique identifier of the playlist
    ///   - songsIDs: An array of identifiers of songs to be added to the playlist
    ///   - completion: Completion handler of request result of type Swift.Result<String, Error>
    ///   - result: Result of request, .success(status) or .failure(Error)
    public func addTracksToAPlaylist(playlistID: String, songsIDs: [String], completion: @escaping (_ result: Swift.Result<String, Error>) -> Void) {
        // Create URL Request using requestGenerator
        let urlRequest = requestGenerator.createAddTracksToAPlaylistRequest(playlistID: playlistID, songsIDs: songsIDs)
        
        requestByAlamofireString(urlRequest: urlRequest) { result in
            completion(result)
        }
    }
    
    // MARK: - Stations
    /// Fetch a catalog station using its identifier.
    /// - Parameters:
    ///   - storefront: An identifier (ISO 3166 alpha-2 country codes) of the storefront which to perform request in
    ///   - stationID: The unique identifier of the station
    ///   - completion: Completion handler of request result of type Swift.Result<CatalogStation, Error>
    ///   - result: Result of request, .success(CatalogStation) or .failure(Error)
    public func fetchACatalogStation(storefront: String, stationID: String, completion: @escaping (_ result: Swift.Result<CatalogStation, Error>) -> Void) {
        // Create URL Request using requestGenerator
        let urlRequest = requestGenerator.createGetACatalogStationRequest(storefront: storefront, stationID: stationID)
        
        requestByAlamofireJSON(urlRequest: urlRequest) { result in
            var catalogStationResult: Swift.Result<CatalogStation, Error>   // result to be modified and returned in completion handler
            
            switch result {
            case .success(let responseJson):
                let catalogStationData: JSON = responseJson["data"].array![0]
                // Parse resource object from JSON response
                if let catalogStation = CatalogStation(stationData: catalogStationData) {
                    catalogStationResult = .success(catalogStation)
                } else {
                    // Parsing failed, complete with error
                    catalogStationResult = .failure(HummingKitResponseError.responseCorrupted)
                }
            case .failure(let err):
                catalogStationResult = .failure(err)
            }
            
            completion(catalogStationResult)
        }
    }
    
    /// Fetch multiple catalog stations using their identifiers.
    /// - Parameters:
    ///   - storefront: An identifier (ISO 3166 alpha-2 country codes) of the storefront which to perform request in
    ///   - stationIDs: An array of the identifiers of the stations. Maximum fetch limit is 100.
    ///   - completion: Completion handler of request result of type Swift.Result<[CatalogStation], Error>
    ///   - result: Result of request, .success([CatalogStation]) or .failure(Error)
    public func fetchMultipleCatalogStations(storefront: String, stationIDs: [String], completion: @escaping (_ result: Swift.Result<[CatalogStation], Error>) -> Void) {
        
        // Declare and then initialize URL Request as initialization is failable due to array lengths
        var urlRequest: URLRequest
        do {
            urlRequest = try requestGenerator.createGetMultipleCatalogStationsRequest(storefront: storefront, stationIDs: stationIDs)
        } catch {
            completion(.failure(error))
            return
        }
        
        requestByAlamofireJSON(urlRequest: urlRequest) { result in
            var catalogStationsResult: Swift.Result<[CatalogStation], Error>    // result to be modified and returned in completion handler
            
            switch result {
            case .success(let responseJson):    // successfully get response from server
                // JSON array of CatalogStation, each element is of JSON type containing one CatalogStation data
                let catalogStationsDataArray: [JSON] = responseJson["data"].array!
                
                var catalogStationsArray: [CatalogStation] = []
                
                catalogStationsDataArray.forEach { catalogStationData in
                    // Parse resource object from JSON response
                    if let catalogStation = CatalogStation(stationData: catalogStationData) {
                        catalogStationsArray.append(catalogStation)
                    } else {
                        // Parsing failed, complete with error
                        completion(.failure(HummingKitResponseError.responseCorrupted))
                        return
                    }
                }
                
                // set result to be returned
                catalogStationsResult = .success(catalogStationsArray)
                
            case .failure(let err): // failed to get response
                catalogStationsResult = .failure(err)
            }
            
            completion(catalogStationsResult)
        }
    }
    
    
    
    // TODO: - More Functionality
    
    
}
