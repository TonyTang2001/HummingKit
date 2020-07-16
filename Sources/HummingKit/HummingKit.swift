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

public class HummingKit {
    
    private var developerToken: String
    private var userToken: String
    private let requestGenerator: HummingKitRequestFactory
    
    private var retryCountMax: Int = 3
    
    public init(developerToken: String, userToken: String) {
        self.developerToken = developerToken
        self.userToken = userToken
        requestGenerator = HummingKitRequestFactory(developerToken: developerToken, userToken: userToken)
    }
    
    public func setMaximumRequestRetryTime(_ retryCount: Int) {
        retryCountMax = retryCount
    }
    
    /// Private function that modularize Alamofire url requesting and responses
    /// - Parameters:
    ///   - urlRequest: URL request that needs to be conducted by Alamofire
    ///   - completion: Swift.Result type handles json response, .success(JSON) or .failure(Error)
    private func requestByAlamofireJSON(urlRequest: URLRequest, completion: @escaping (Swift.Result<JSON, Error>) -> Void) {
        Alamofire.request(urlRequest)
            .responseJSON { response in
                let data = Self.decodeResponseStatus(response)
                var result: Swift.Result<JSON, Error>
                if data.success {
                    result = .success(data.responseJSON ?? "")
                } else {
                    guard let err = data.error else { return }
                    result = .failure(err)
                }
                completion(result)
        }
    }
    
    /// Overloads requestByAlamofire() for requests without response body, such that only status code is returned for clearance of whether the action is approved by the server or not
    /// - Parameters:
    ///   - urlRequest: URL request that needs to be conducted by Alamofire
    ///   - completion: Swift.Result type handles json response, .success("") or .failure(Error)
    private func requestByAlamofireString(urlRequest: URLRequest, completion: @escaping (Swift.Result<String, Error>) -> Void) {
        Alamofire.request(urlRequest)
            .responseJSON { response in
                var result: Swift.Result<String, Error>
                
                if let statusCode = response.response?.statusCode {
                    print("Request Status Code: \(statusCode)")
                    let decodedStatus = HummingKit.handleResponseStatusCode(statusCode: statusCode)
                    
                    if decodedStatus.success {
                        result = .success("")
                    } else {
                        let data = Self.decodeResponseStatus(response)
                        guard let err = data.error else { return }
                        result = .failure(err)
                    }
                    
                } else {
                    // No HTTP Status Code, report in console & error returned is nil
                    print("NO HTTP Status Code, Check Internet Availability and Retry Request")
                    let data = Self.decodeResponseStatus(response)
                    guard let err = data.error else { return }
                    result = .failure(err)
                }
                
                completion(result)
        }
    }
    
    // MARK: - Storefonts
    /// Fetch user's Apple Music account storefront information
    /// - Parameter completion: .success(Storefront) or .failure(Error)
    public func fetchUserStorefront(completion: @escaping (Swift.Result<Storefront, Error>) -> Void) {
        let urlRequest = requestGenerator.createGetUserStorefrontRequest()
        
        requestByAlamofireJSON(urlRequest: urlRequest) { result in
            var storefrontResult: Swift.Result<Storefront, Error>
            
            switch result {
            case .success(let responseJson):
                let storefrontData: JSON = responseJson["data"].array![0]
                let storefront = Storefront(storefrontData: storefrontData)
                storefrontResult = .success(storefront!)
            case .failure(let err):
                storefrontResult = .failure(err)
            }
            
            completion(storefrontResult)
        }
    }
    
    /// Fetch a storefront from Apple Music server using its identifier
    /// - Parameters:
    ///   - storefrontID: The identifier (an ISO 3166 alpha-2 country code) for the storefront you want to fetch.
    ///   - completion: .success(Storefront) or .failure(Error)
    public func fetchAStorefront(storefrontID: String, completion: @escaping (Swift.Result<Storefront, Error>) -> Void) {
        let urlRequest = requestGenerator.createGetAStorefrontRequest(storefrontID: storefrontID)
        
        requestByAlamofireJSON(urlRequest: urlRequest) { result in
            var storefrontResult: Swift.Result<Storefront, Error>
            
            switch result {
            case .success(let responseJson):
                let storefrontData: JSON = responseJson["data"].array![0]
                let storefront = Storefront(storefrontData: storefrontData)
                storefrontResult = .success(storefront!)
            case .failure(let err):
                storefrontResult = .failure(err)
            }
            
            completion(storefrontResult)
        }
    }
    
    /// Fetch a number of storefronts by their identifiers at the same time
    /// - Parameters:
    ///   - storefrontIDs: An array of the identifiers (ISO 3166 alpha-2 country codes) for the storefronts you want to fetch.
    ///   - completion: .success([Storefront]) or .failure(Error)
    public func fetchMultipleStorefronts(storefrontIDs: [String], completion: @escaping (Swift.Result<[Storefront], Error>) -> Void) {
        let urlRequest = requestGenerator.createGetMultipleStorefrontsRequest(storefrontIDs: storefrontIDs)
        
        requestByAlamofireJSON(urlRequest: urlRequest) { result in
            var storefrontsResult: Swift.Result<[Storefront], Error>
            
            switch result {
            case .success(let responseJson):    // successfully get response from server
                
                var storefrontsArray: [Storefront] = []
                let storefrontsDataArray: [JSON] = responseJson["data"].array!
                
                storefrontsDataArray.forEach { storefrontData in
                    let storefront = Storefront(storefrontData: storefrontData)
                    storefrontsArray.append(storefront!)
                }
                
                // set result to be returned
                storefrontsResult = .success(storefrontsArray)
                
            case .failure(let err): // failed to get response
                storefrontsResult = .failure(err)
            }
            
            completion(storefrontsResult)
        }
    }
    
    /// Fetch all storefronts available at the same time
    /// - Parameter completion: .success([Storefront]]) or .failure(Error)
    public func fetchAllStorefronts(completion: @escaping (Swift.Result<[Storefront], Error>) -> Void) {
        let urlRequest = requestGenerator.createGetAllStorefrontsRequest()
        
        requestByAlamofireJSON(urlRequest: urlRequest) { result in
            var storefrontsResult: Swift.Result<[Storefront], Error>
            
            switch result {
            case .success(let responseJson):    // successfully get response from server
                
                var storefrontsArray: [Storefront] = []
                let storefrontsDataArray: [JSON] = responseJson["data"].array!
                
                storefrontsDataArray.forEach { storefrontData in
                    let storefront = Storefront(storefrontData: storefrontData)
                    storefrontsArray.append(storefront!)
                }
                
                // set result to be returned
                storefrontsResult = .success(storefrontsArray)
                
            case .failure(let err): // failed to get response
                storefrontsResult = .failure(err)
            }
            
            completion(storefrontsResult)
        }
    }
    
    // MARK: - Add Resources
    /// Add reources (playlists, albums, songs, MVs) to user library
    /// - Parameters:
    ///   - playlistsIDs: an array of unique catalog identifiers for targeted playlists
    ///   - albumsIDs: an array of unique catalog identifiers for targeted albums
    ///   - songsIDs: an array of unique catalog identifiers for targeted songs
    ///   - musicVideosIDs: an array of unique catalog identifiers for targeted music videos
    ///   - completion: .success(StatusCode) or .failure(Error)
    public func addResourcesToLibrary(playlistsIDs: [String], albumsIDs: [String], songsIDs: [String], musicVideosIDs: [String], completion: @escaping (Swift.Result<String, Error>) -> Void) {
        let urlRequest = requestGenerator.createAddResourcesToLibraryRequest(playlistsIDs: playlistsIDs, albumsIDs: albumsIDs, songsIDs: songsIDs, musicVideosIDs: musicVideosIDs)
        
        requestByAlamofireString(urlRequest: urlRequest) { result in
            completion(result)
        }
    }
    
    // MARK: - Albums
    /// Fetch a catalog album using its identifier
    /// - Parameters:
    ///   - storefront: An identifier (ISO 3166 alpha-2 country codes) of the storefront you want to perform this request in.
    ///   - albumID: The unique identifier for the album.
    ///   - completion: .success(CatalogAlbum) or .failure(Error)
    public func fetchACatalogAlbum(storefront: String, albumID: String, completion: @escaping (Swift.Result<CatalogAlbum, Error>) -> Void) {
        let urlRequest = requestGenerator.createGetACatalogAlbumRequest(storefront: storefront, albumID: albumID)
        
        requestByAlamofireJSON(urlRequest: urlRequest) { result in
            
            var catalogAlbumResult: Swift.Result<CatalogAlbum, Error>
            
            switch result {
            case .success(let responseJson):
                let catalogAlbumData: JSON = responseJson["data"].array![0]
                let catalogAlbum = CatalogAlbum(albumData: catalogAlbumData)
                catalogAlbumResult = .success(catalogAlbum!)
            case .failure(let err):
                catalogAlbumResult = .failure(err)
            }
            
            completion(catalogAlbumResult)
        }
    }
    
    /// Fetch multiple catalog albums using their identifiers
    /// - Parameters:
    ///   - storefront: An identifier (ISO 3166 alpha-2 country codes) of the storefront you want to perform this request in.
    ///   - albumIDs: The unique identifiers for the albums. The maximum fetch limit is 100.
    ///   - completion: .success(JSON) or .failure(Error)
    public func fetchMultipleCatalogAlbums(storefront: String, albumIDs: [String], completion: @escaping (Swift.Result<[CatalogAlbum], Error>) -> Void) {
        
        var urlRequest: URLRequest
        
        do {
            urlRequest = try requestGenerator.createGetMultipleCatalogAlbumsRequest(storefront: storefront, albumIDs: albumIDs)
        } catch {
            completion(.failure(error))
            return
        }
        
        requestByAlamofireJSON(urlRequest: urlRequest) { result in
            
            var catalogAlbumsResult: Swift.Result<[CatalogAlbum], Error>
            
            switch result {
            case .success(let responseJson):    // successfully get response from server
                // JSON array of catalogAlbums, each element is of JSON type containing one catalogAlbum data
                let catalogAlbumsDataArray: [JSON] = responseJson["data"].array!
                
                var catalogAlbumsArray: [CatalogAlbum] = []
                
                // parse each catalogAlbum from each JSON
                catalogAlbumsDataArray.forEach { catalogAlbumData in
                    let catalogAlbum = CatalogAlbum(albumData: catalogAlbumData)
                    catalogAlbumsArray.append(catalogAlbum!)
                }
                
                // set result to be returned
                catalogAlbumsResult = .success(catalogAlbumsArray)
                
            case .failure(let err): // failed to get response
                catalogAlbumsResult = .failure(err)
            }
            
            completion(catalogAlbumsResult)
        }
    }
    
    /// Fetch the relationship of a catalog album using its identifier and relationship name
    /// - Parameters:
    ///   - storefront: An identifier (ISO 3166 alpha-2 country codes) of the storefront you want to perform this request in.
    ///   - albumID: The unique identifier for the album.
    ///   - relationship: The name of the relationship you want to fetch for this resource.
    ///   - completion: .success(JSON) or .failure(Error)
    public func fetchACatalogAlbumRelationship(storefront: String, albumID: String, relationship: String, completion: @escaping (Swift.Result<JSON, Error>) -> Void) {
        let urlRequest = requestGenerator.createGetACatalogAlbumRelationshipRequest(storefront: storefront, albumID: albumID, relationship: relationship)
        
        requestByAlamofireJSON(urlRequest: urlRequest) { result in
            completion(result)
        }
    }
    
    /// Fetch a library album using its identifier
    /// - Parameters:
    ///   - albumID: The unique identifier for the album.
    ///   - completion: .success(LibraryAlbum) or .failure(Error)
    public func fetchALibraryAlbum(storefront: String, albumID: String, completion: @escaping (Swift.Result<LibraryAlbum, Error>) -> Void) {
        let urlRequest = requestGenerator.createGetALibraryAlbumRequest(albumID: albumID)
        
        requestByAlamofireJSON(urlRequest: urlRequest) { result in
            var libraryAlbumResult: Swift.Result<LibraryAlbum, Error>
            
            switch result {
            case .success(let responseJson):
                let libraryAlbumData: JSON = responseJson["data"].array![0]
                let libraryAlbum = LibraryAlbum(albumData: libraryAlbumData)
                libraryAlbumResult = .success(libraryAlbum!)
            case .failure(let err):
                libraryAlbumResult = .failure(err)
            }
            
            completion(libraryAlbumResult)
        }
    }
    
    /// Fetch the relationship of a library album using its identifier and relationship name
    /// - Parameters:
    ///   - albumID: The unique identifier for the album.
    ///   - relationship: The name of the relationship you want to fetch for this resource.
    ///   - completion: .success(JSON) or .failure(Error)
    public func fetchALibraryAlbumRelationship(albumID: String, relationship: String, completion: @escaping (Swift.Result<JSON, Error>) -> Void) {
        let urlRequest = requestGenerator.createGetALibraryAlbumRelationshipRequest(albumID: albumID, relationship: relationship)
        
        requestByAlamofireJSON(urlRequest: urlRequest) { result in
            completion(result)
        }
    }
    
    /// Fetch multiple library albums using their identifiers
    /// - Parameters:
    ///   - albumIDs: The unique identifiers for the albums. The maximum fetch limit is 100.
    ///   - completion: .success(JSON) or .failure(Error)
    public func fetchMultipleLibraryAlbums(albumIDs: [String], completion: @escaping (Swift.Result<[LibraryAlbum], Error>) -> Void) {
        
        var urlRequest: URLRequest
        
        do {
            urlRequest = try requestGenerator.createGetMultipleLibraryAlbumsRequest(albumIDs: albumIDs)
        } catch {
            completion(.failure(error))
            return
        }
        
        requestByAlamofireJSON(urlRequest: urlRequest) { result in
            
            var libraryAlbumsResult: Swift.Result<[LibraryAlbum], Error>
            
            switch result {
            case .success(let responseJson):    // successfully get response from server
                // JSON array of catalogAlbums, each element is of JSON type containing one catalogAlbum data
                let libraryAlbumsDataArray: [JSON] = responseJson["data"].array!
                
                var libraryAlbumsArray: [LibraryAlbum] = []
                
                // parse each catalogAlbum from each JSON
                libraryAlbumsDataArray.forEach { libraryAlbumData in
                    let libraryAlbum = LibraryAlbum(albumData: libraryAlbumData)
                    libraryAlbumsArray.append(libraryAlbum!)
                }
                
                // set result to be returned
                libraryAlbumsResult = .success(libraryAlbumsArray)
                
            case .failure(let err): // failed to get response
                libraryAlbumsResult = .failure(err)
            }
            
            completion(libraryAlbumsResult)
        }
    }
    
    /// Fetch all library albums at once
    /// - Parameters:
    ///   - completion: .success(([LibraryAlbum], FetchingStatus)) or .failure(Error)
    public func fetchAllLibraryAlbums(completion: @escaping (Swift.Result<([LibraryAlbum], FetchingStatus), Error>) -> Void) {
        
        let limit:  String = "100"  // default to maximum for efficiency
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
                        case .completed:    // Fetching is not yet completed, following requests needed
                            
                            // Update offset and fetching status for next request
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
                        default:    // Other cases are logically impossible to occur
                            print("Current case is unexpected.")
                            
                            // Complete with error
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
                    // Increment retry count
                    retryCount += 1
                    // Retry(as offset kept unchanged) fetching of current segment
                    continueFetching()
                }
                
            // Fetch has been marked completed
            default:
                break
                
            }
        }
        
        /// Function that fetches a segment of all library albums
        /// - Parameters:
        ///   - limit: Maximum count of resources to be expected in response.
        ///   - offset: The offset of starting resource to be expected in response.
        ///   - completion: .success(([LibraryAlbum], newOffset: String, segmentStatus: FetchingStatus)) or .failure(Error)
        func fetchSegmentalLibraryAlbums(limit: String, offset: String, completion: @escaping (Swift.Result<([LibraryAlbum], newOffset: String, segmentStatus: FetchingStatus), Error>) -> Void) {
            
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
                    
                    // Parse each libraryAlbum from each JSON in segmentalLibraryAlbumsDataArray
                    segmentalLibraryAlbumsDataArray.forEach { libraryAlbumData in
                        let libraryAlbum = LibraryAlbum(albumData: libraryAlbumData)
                        // Append newly parsed libraryAlbum to [LibraryAlbum] array
                        segmentalLibraryAlbumsArray.append(libraryAlbum!)
                    }
                    
                    // Detect existence of field "next"
                    if responseJson["next"].exists() {
                        // Try to parse offset from field "next"
                        let offsetParsingResult = Self.offsetMatches(for: "(\\d{2,})", in: responseJson["next"].string ?? "")
                        
                        switch offsetParsingResult {
                        case .success(let offsetParsed):
                            // Update offset variablefrom outer func
                            newOffset = offsetParsed
                        case .failure(let err):
                            // Field "next" exists but failed to parse offset value
                            // Complete with error
                            completion(.failure(err))
                        }
                        
                        // Update status, indicating current segment has been fetched and parsed
                        segmentStatus = .completed
                        completion(.success((segmentalLibraryAlbumsArray, newOffset: newOffset, segmentStatus: segmentStatus)))
                        
                    } else {    // Field "next" does not exist, current segment is expected to be ultimate
                        // Update status, indicating last segment has been fetched
                        segmentStatus = .ending
                        completion(.success((segmentalLibraryAlbumsArray, newOffset: newOffset, segmentStatus: segmentStatus)))
                    }
                    
                case .failure(let err): // failed to get response
                    completion(.failure(err))
                }
                
            }
            
        }
        
        // Start sequential(progressive) calling
        continueFetching()
    }
    
    // MARK: - Artists
    /// Fetch a catalog artist using their identifier
    /// - Parameters:
    ///   - storefront: An identifier (ISO 3166 alpha-2 country codes) of the storefront you want to perform this request in.
    ///   - artistID: The unique identifier for the artist.
    ///   - completion: .success(CatalogArtist) or .failure(Error)
    public func fetchACatalogArtist(storefront: String, artistID: String, completion: @escaping (Swift.Result<CatalogArtist, Error>) -> Void) {
        let urlRequest = requestGenerator.createGetACatalogArtistRequest(storefront: storefront, artistID: artistID)
        
        requestByAlamofireJSON(urlRequest: urlRequest) { result in
            var catalogArtistResult: Swift.Result<CatalogArtist, Error>
            
            switch result {
            case .success(let responseJson):
                let catalogArtistData: JSON = responseJson["data"].array![0]
                let catalogArtist = CatalogArtist(artistData: catalogArtistData)
                catalogArtistResult = .success(catalogArtist!)
            case .failure(let err):
                catalogArtistResult = .failure(err)
            }
            
            completion(catalogArtistResult)
        }
    }
    
    /// Fetch multiple catalog artists using their identifiers
    /// - Parameters:
    ///   - storefront: An identifier (ISO 3166 alpha-2 country codes) of the storefront you want to perform this request in.
    ///   - artistIDs: The unique identifiers for the artists. The maximum fetch limit is 25.
    ///   - completion: .success(JSON) or .failure(Error)
    public func fetchMultipleCatalogArtists(storefront: String, artistIDs: [String], completion: @escaping (Swift.Result<[CatalogArtist], Error>) -> Void) {
        
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
                // JSON array of catalogAlbums, each element is of JSON type containing one catalogAlbum data
                let catalogArtistsDataArray: [JSON] = responseJson["data"].array!
                
                var catalogArtistsArray: [CatalogArtist] = []
                
                // parse each catalogAlbum from each JSON
                catalogArtistsDataArray.forEach { catalogArtistData in
                    let catalogArtist = CatalogArtist(artistData: catalogArtistData)
                    catalogArtistsArray.append(catalogArtist!)
                }
                
                // set result to be returned
                catalogArtistsResult = .success(catalogArtistsArray)
                
            case .failure(let err): // failed to get response
                catalogArtistsResult = .failure(err)
            }
            
            completion(catalogArtistsResult)
        }
    }
    
    /// Fetch relationship of a catalog artist using their identifier and relationship name
    /// - Parameters:
    ///   - storefront: An identifier (ISO 3166 alpha-2 country codes) of the storefront you want to perform this request in.
    ///   - artistID: The unique identifier for the artist.
    ///   - relationship: The name of the relationship you want to fetch for this resource.
    ///   - completion: .success(JSON) or .failure(Error)
    public func fetchACatalogArtistRelationship(storefront: String, artistID: String, relationship: String, completion: @escaping (Swift.Result<JSON, Error>) -> Void) {
        let urlRequest = requestGenerator.createGetACatalogArtistRelationshipRequest(storefront: storefront, artistID: artistID, relationship: relationship)
        
        requestByAlamofireJSON(urlRequest: urlRequest) { result in
            completion(result)
        }
    }
    
    /// Fetch a library artist using their identifier
    /// - Parameters:
    ///   - artistID: The unique identifier for the artist.
    ///   - completion: .success(LibraryArtist) or .failure(Error)
    public func fetchALibraryArtist(artistID: String, completion: @escaping (Swift.Result<LibraryArtist, Error>) -> Void) {
        let urlRequest = requestGenerator.createGetALibraryArtistRequest(artistID: artistID)
        
        requestByAlamofireJSON(urlRequest: urlRequest) { result in
            var libraryArtistResult: Swift.Result<LibraryArtist, Error>
            
            switch result {
            case .success(let responseJson):
                let libraryArtistData: JSON = responseJson["data"].array![0]
                let libraryArtist = LibraryArtist(artistData: libraryArtistData)
                libraryArtistResult = .success(libraryArtist!)
            case .failure(let err):
                libraryArtistResult = .failure(err)
            }
            
            completion(libraryArtistResult)
        }
    }
    
    /// Fetch all library artists at once
    /// - Parameters:
    ///   - completion: .success(([LibraryArtist], FetchingStatus)) or .failure(Error)
    public func fetchAllLibraryArtists(completion: @escaping (Swift.Result<([LibraryArtist], FetchingStatus), Error>) -> Void) {
        
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
                        case .completed:    // Fetching is not yet completed, following requests needed
                            
                            // Update offset and fetching status for next request
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
                        default:    // Other cases are logically impossible to occur
                            print("Current case is unexpected.")
                            
                            // Complete with error
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
                    // Increment retry count
                    retryCount += 1
                    // Retry(as offset kept unchanged) fetching of current segment
                    continueFetching()
                }
                
            // Fetch has been marked completed
            default:
                break
                
            }
        }
        
        /// Function that fetches a segment of all library artists
        /// - Parameters:
        ///   - limit: Maximum count of resources to be expected in response.
        ///   - offset: The offset of starting resource to be expected in response.
        ///   - completion: .success(([LibraryArtist], newOffset: String, segmentStatus: FetchingStatus)) or .failure(Error)
        func fetchSegmentalLibraryArtists(limit: String, offset: String, completion: @escaping (Swift.Result<([LibraryArtist], newOffset: String, segmentStatus: FetchingStatus), Error>) -> Void) {
            
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
                    
                    // Parse each libraryArtist from each JSON in segmentalLibraryArtistsDataArray
                    segmentalLibraryArtistsDataArray.forEach { libraryArtistData in
                        let libraryArtist = LibraryArtist(artistData: libraryArtistData)
                        // Append newly parsed libraryArtist to [LibraryArtist] array
                        segmentalLibraryArtistsArray.append(libraryArtist!)
                    }
                    
                    // Detect existence of field "next"
                    if responseJson["next"].exists() {
                        // Try to parse offset from field "next"
                        let offsetParsingResult = Self.offsetMatches(for: "(\\d{2,})", in: responseJson["next"].string ?? "")
                        
                        switch offsetParsingResult {
                        case .success(let offsetParsed):
                            // Update offset variablefrom outer func
                            newOffset = offsetParsed
                        case .failure(let err):
                            // Field "next" exists but failed to parse offset value
                            // Complete with error
                            completion(.failure(err))
                        }
                        
                        // Update status, indicating current segment has been fetched and parsed
                        segmentStatus = .completed
                        completion(.success((segmentalLibraryArtistsArray, newOffset: newOffset, segmentStatus: segmentStatus)))
                        
                    } else {    // Field "next" does not exist, current segment is expected to be ultimate
                        // Update status, indicating last segment has been fetched
                        segmentStatus = .ending
                        completion(.success((segmentalLibraryArtistsArray, newOffset: newOffset, segmentStatus: segmentStatus)))
                    }
                    
                case .failure(let err): // failed to get response
                    completion(.failure(err))
                }
                
            }
            
        }
        
        // Start sequential(progressive) calling
        continueFetching()
    }
    
    /// Fetch multiple library artists using their identifiers
    /// - Parameters:
    ///   - artistIDs: The unique identifiers for the albums. The maximum fetch limit is 25.
    ///   - completion: .success(JSON) or .failure(Error)
    public func fetchMultipleLibraryArtists(artistIDs: [String], completion: @escaping (Swift.Result<[LibraryArtist], Error>) -> Void) {
        
        var urlRequest: URLRequest
        
        do {
            urlRequest = try requestGenerator.createGetMultipleLibraryArtistsRequest(artistIDs: artistIDs)
        } catch {
            completion(.failure(error))
            return
        }
        
        requestByAlamofireJSON(urlRequest: urlRequest) { result in
            
            var libraryArtistsResult: Swift.Result<[LibraryArtist], Error>
            
            switch result {
            case .success(let responseJson):    // successfully get response from server
                // JSON array of catalogAlbums, each element is of JSON type containing one catalogAlbum data
                let libraryArtistsDataArray: [JSON] = responseJson["data"].array!
                
                var libraryArtistsArray: [LibraryArtist] = []
                
                // parse each catalogAlbum from each JSON
                libraryArtistsDataArray.forEach { libaryArtistData in
                    let librarySong = LibraryArtist(artistData: libaryArtistData)
                    libraryArtistsArray.append(librarySong!)
                }
                
                // set result to be returned
                libraryArtistsResult = .success(libraryArtistsArray)
                
            case .failure(let err): // failed to get response
                libraryArtistsResult = .failure(err)
            }
            
            completion(libraryArtistsResult)
        }
    }
    
    /// Fetch relationship of a library artist using their identifier and relationship name
    /// - Parameters:
    ///   - artistID: The unique identifier for the artist.
    ///   - relationship: The name of the relationship you want to fetch for this resource.
    ///   - completion: .success(JSON) or .failure(Error)
    public func fetchALibraryArtistRelationship(artistID: String, relationship: String, completion: @escaping (Swift.Result<JSON, Error>) -> Void) {
        let urlRequest = requestGenerator.createGetALibraryArtistRelationshipRequest(artistID: artistID, relationship: relationship)
        
        requestByAlamofireJSON(urlRequest: urlRequest) { result in
            completion(result)
        }
    }
    
    // MARK: - Songs
    /// Fetch a catalog song using its identifier
    /// - Parameters:
    ///   - storefront: An identifier (ISO 3166 alpha-2 country codes) of the storefront you want to perform this request in.
    ///   - songID: The unique identifier for the song.
    ///   - completion: .success(CatalogSong) or .failure(Error)
    public func fetchACatalogSong(storefront: String, songID: String, completion: @escaping (Swift.Result<CatalogSong, Error>) -> Void) {
        let urlRequest = requestGenerator.createGetACatalogSongRequest(storefront: storefront, songID: songID)
        
        requestByAlamofireJSON(urlRequest: urlRequest) { result in
            var catalogSongResult: Swift.Result<CatalogSong, Error>
            
            switch result {
            case .success(let responseJson):
                let catalogSongData: JSON = responseJson["data"].array![0]
                let catalogSong = CatalogSong(songData: catalogSongData)
                catalogSongResult = .success(catalogSong!)
            case .failure(let err):
                catalogSongResult = .failure(err)
            }
            
            completion(catalogSongResult)
        }
    }
    
    /// Fetch multiple catalog songs using their identifiers
    /// - Parameters:
    ///   - storefront: An identifier (ISO 3166 alpha-2 country codes) of the storefront you want to perform this request in.
    ///   - songIDs: An array of catalogIDs for targeted catalog songs. The maximum fetch limit is 300.
    ///   - completion: .success(JSON) or .failure(Error)
    public func fetchMultipleCatalogSongs(storefront: String, songIDs: [String], completion: @escaping (Swift.Result<[CatalogSong], Error>) -> Void) {
        
        var urlRequest: URLRequest
        
        do {
            urlRequest = try requestGenerator.createGetMultipleCatalogSongsRequest(storefront: storefront, songIDs: songIDs)
        } catch {
            completion(.failure(error))
            return
        }
        
        requestByAlamofireJSON(urlRequest: urlRequest) { result in
            var catalogSongsResult: Swift.Result<[CatalogSong], Error>
            
            switch result {
            case .success(let responseJson):    // successfully get response from server
                // JSON array of catalogAlbums, each element is of JSON type containing one catalogAlbum data
                let catalogSongsDataArray: [JSON] = responseJson["data"].array!
                
                var catalogSongsArray: [CatalogSong] = []
                
                // parse each catalogAlbum from each JSON
                catalogSongsDataArray.forEach { catalogSongData in
                    let catalogSong = CatalogSong(songData: catalogSongData)
                    catalogSongsArray.append(catalogSong!)
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
    
    
    /// Fetch relationship of a catalog song using its identifier and relationship name
    /// - Parameters:
    ///   - storefront: An identifier (ISO 3166 alpha-2 country codes) of the storefront you want to perform this request in.
    ///   - songID: The unique identifier for the song.
    ///   - completion: .success(JSON) or .failure(Error)
    public func fetchACatalogSongRelationship(storefront: String, songID: String, relationship: String, completion: @escaping (Swift.Result<JSON, Error>) -> Void) {
        let urlRequest = requestGenerator.createGetACatalogSongRelationshipRequest(storefront: storefront, songID: songID, relationship: relationship)
        
        requestByAlamofireJSON(urlRequest: urlRequest) { result in
            completion(result)
        }
    }
    
    /// Fetch a library song using its identifier
    /// - Parameters:
    ///   - songID: The unique identifier for the song.
    ///   - completion: .success(LibrarySong) or .failure(Error)
    public func fetchALibrarySong(storefront: String, songID: String, completion: @escaping (Swift.Result<LibrarySong, Error>) -> Void) {
        let urlRequest = requestGenerator.createGetALibrarySongRequest(songID: songID)
        
        requestByAlamofireJSON(urlRequest: urlRequest) { result in
            var librarySongResult: Swift.Result<LibrarySong, Error>
            
            switch result {
            case .success(let responseJson):
                let librarySongData: JSON = responseJson["data"].array![0]
                let librarySong = LibrarySong(songData: librarySongData)
                librarySongResult = .success(librarySong!)
            case .failure(let err):
                librarySongResult = .failure(err)
            }
            
            completion(librarySongResult)
        }
    }
    
    /// Fetch multiple library songs using their identifiers
    /// - Parameters:
    ///   - songIDs: An array of catalogIDs for targeted catalog songs. The maximum fetch limit is 300.
    ///   - completion: .success(JSON) or .failure(Error)
    public func fetchMultipleLibrarySongs(songIDs: [String], completion: @escaping (Swift.Result<[LibrarySong], Error>) -> Void) {
        
        var urlRequest: URLRequest
        
        do {
            urlRequest = try requestGenerator.createGetMultipleLibrarySongsRequest(songIDs: songIDs)
        } catch {
            completion(.failure(error))
            return
        }
        
        requestByAlamofireJSON(urlRequest: urlRequest) { result in
            
            var librarySongsResult: Swift.Result<[LibrarySong], Error>
            
            switch result {
            case .success(let responseJson):    // successfully get response from server
                // JSON array of catalogAlbums, each element is of JSON type containing one catalogAlbum data
                let librarySongsDataArray: [JSON] = responseJson["data"].array!
                
                var librarySongsArray: [LibrarySong] = []
                
                // parse each catalogAlbum from each JSON
                librarySongsDataArray.forEach { libarySongData in
                    let librarySong = LibrarySong(songData: libarySongData)
                    librarySongsArray.append(librarySong!)
                }
                
                // set result to be returned
                librarySongsResult = .success(librarySongsArray)
                
            case .failure(let err): // failed to get response
                librarySongsResult = .failure(err)
            }
            
            completion(librarySongsResult)
        }
    }
    
    /// Fetch all library songs at once
    /// - Parameters:
    ///   - completion: .success([LibrarySong], FetchingStatus) or .failure(Error)
    public func fetchAllLibrarySongs(storefront: String, completion: @escaping (Swift.Result<([LibrarySong], FetchingStatus), Error>) -> Void) {
        
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
                        case .completed:    // Fetching is not yet completed, following requests needed
                            
                            // Update offset and fetching status for next request
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
                        default:    // Other cases are logically impossible to occur
                            print("Current case is unexpected.")
                            
                            // Complete with error
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
                    // Increment retry count
                    retryCount += 1
                    // Retry(as offset kept unchanged) fetching of current segment
                    continueFetching()
                }
                
            // Fetch has been marked completed
            default:
                break
                
            }
        }

        /// Function that fetches a segment of all library songs
        /// - Parameters:
        ///   - limit: Maximum count of resources to be expected in response.
        ///   - offset: The offset of starting resource to be expected in response.
        ///   - completion: .success(([LibrarySong], newOffset: String, segmentStatus: FetchingStatus)) or .failure(Error)
        func fetchSegmentalLibrarySongs(limit: String, offset: String, completion: @escaping (Swift.Result<([LibrarySong], newOffset: String, segmentStatus: FetchingStatus), Error>) -> Void) {
            
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
                    
                    // Parse each librarySong from each JSON in segmentalLibrarySongsDataArray
                    segmentalLibrarySongsDataArray.forEach { librarySongData in
                        if let librarySong = LibrarySong(songData: librarySongData) {
                            // Append newly parsed librarySong to [LibrarySong] array
                            segmentalLibrarySongsArray.append(librarySong)
                        } else {
                            // Individual LibrarySong parsing failed, prompt JSON data in console
                            print(librarySongData)
                        }
                    }
                    
                    // Detect existence of field "next"
                    if responseJson["next"].exists() {
                        // Try to parse offset from field "next"
                        let offsetParsingResult = Self.offsetMatches(for: "(\\d{2,})", in: responseJson["next"].string ?? "")
                        
                        switch offsetParsingResult {
                        case .success(let offsetParsed):
                            // Update offset variablefrom outer func
                            newOffset = offsetParsed
                        case .failure(let err):
                            // Field "next" exists but failed to parse offset value
                            // Complete with error
                            completion(.failure(err))
                        }
                        
                        // Update status, indicating current segment has been fetched and parsed
                        segmentStatus = .completed
                        completion(.success((segmentalLibrarySongsArray, newOffset: newOffset, segmentStatus: segmentStatus)))
                        
                    } else {    // Field "next" does not exist, current segment is expected to be ultimate
                        // Update status, indicating last segment has been fetched
                        segmentStatus = .ending
                        completion(.success((segmentalLibrarySongsArray, newOffset: newOffset, segmentStatus: segmentStatus)))
                    }
                    
                case .failure(let err): // failed to get response
                    completion(.failure(err))
                }
                
            }
            
        }

        // Start sequential(progressive) calling
        continueFetching()

    }
    
    /// Fetch relationship of a library song using its identifier and relationship name
    /// - Parameters:
    ///   - songID: The unique identifier for the song.
    ///   - completion: .success(JSON) or .failure(Error)
    public func fetchALibrarySongRelationship(songID: String, relationship: String, completion: @escaping (Swift.Result<JSON, Error>) -> Void) {
        let urlRequest = requestGenerator.createGetALibrarySongRelationshipRequest(songID: songID, relationship: relationship)
        
        requestByAlamofireJSON(urlRequest: urlRequest) { result in
            completion(result)
        }
    }
    
    // MARK: - Music Videos(MV)
    /// Fetch a catalog music video using its identifier
    /// - Parameters:
    ///   - storefront: An identifier (ISO 3166 alpha-2 country codes) of the storefront you want to perform this request in.
    ///   - mvID: The unique identifier for the mv.
    ///   - completion: .success(JSON) or .failure(Error)
    public func fetchACatalogMV(storefront: String, mvID: String, completion: @escaping (Swift.Result<CatalogMV, Error>) -> Void) {
        let urlRequest = requestGenerator.createGetACatalogMVRequest(storefront: storefront, mvID: mvID)
        
        requestByAlamofireJSON(urlRequest: urlRequest) { result in
            
            var catalogMVResult: Swift.Result<CatalogMV, Error>
            
            switch result {
            case .success(let responseJson):
                let catalogMVData: JSON = responseJson["data"].array![0]
                let catalogMV = CatalogMV(mvData: catalogMVData)
                catalogMVResult = .success(catalogMV!)
            case .failure(let err):
                catalogMVResult = .failure(err)
            }
            
            completion(catalogMVResult)
        }
    }
    
    /// Fetch relationship of a catalog music video using its identifier and relationship name
    /// - Parameters:
    ///   - storefront: An identifier (ISO 3166 alpha-2 country codes) of the storefront you want to perform this request in.
    ///   - mvID: The unique identifier for the mv.
    ///   - completion: .success(JSON) or .failure(Error)
    public func fetchACatalogMVRelationship(storefront: String, mvID: String, relationship: String, completion: @escaping (Swift.Result<JSON, Error>) -> Void) {
        let urlRequest = requestGenerator.createGetACatalogMVRelationshipRequest(storefront: storefront, mvID: mvID, relationship: relationship)
        
        requestByAlamofireJSON(urlRequest: urlRequest) { result in
            completion(result)
        }
    }
    
    /// Fetch multiple catalog music videos using their identifiers
    /// - Parameters:
    ///   - storefront: An identifier (ISO 3166 alpha-2 country codes) of the storefront you want to perform this request in.
    ///   - mvIDs: An array of catalogIDs for targeted catalog mvs. The maximum fetch limit is 100.
    ///   - completion: .success(JSON) or .failure(Error)
    public func fetchMultipleCatalogMVs(storefront: String, mvIDs: [String], completion: @escaping (Swift.Result<[CatalogMV], Error>) -> Void) {
        
        var urlRequest: URLRequest
        
        do {
            urlRequest = try requestGenerator.createGetMultipleCatalogMVsRequest(storefront: storefront, mvIDs: mvIDs)
        } catch {
            completion(.failure(error))
            return
        }
        
        requestByAlamofireJSON(urlRequest: urlRequest) { result in
            var catalogMVsResult: Swift.Result<[CatalogMV], Error>
            
            switch result {
            case .success(let responseJson):    // successfully get response from server
                // JSON array of catalogAlbums, each element is of JSON type containing one catalogAlbum data
                let catalogMVsDataArray: [JSON] = responseJson["data"].array!
                
                var catalogMVsArray: [CatalogMV] = []
                
                // parse each catalogAlbum from each JSON
                catalogMVsDataArray.forEach { catalogMVData in
                    let catalogMV = CatalogMV(mvData: catalogMVData)
                    catalogMVsArray.append(catalogMV!)
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
    
    
    /// Fetch a library music video using its identifier
    /// - Parameters:
    ///   - mvID: The unique identifier for the mv.
    ///   - completion: .success(JSON) or .failure(Error)
    public func fetchALibraryMV(mvID: String, completion: @escaping (Swift.Result<LibraryMV, Error>) -> Void) {
        let urlRequest = requestGenerator.createGetALibraryMVRequest(mvID: mvID)
        
        requestByAlamofireJSON(urlRequest: urlRequest) { result in
            var libraryMVResult: Swift.Result<LibraryMV, Error>
            
            switch result {
            case .success(let responseJson):
                let libraryMVData: JSON = responseJson["data"].array![0]
                let libraryMV = LibraryMV(mvData: libraryMVData)
                libraryMVResult = .success(libraryMV!)
            case .failure(let err):
                libraryMVResult = .failure(err)
            }
            
            completion(libraryMVResult)
        }
    }
    
    /// Fetch relationship of a library music video using its identifier and relationship name
    /// - Parameters:
    ///   - mvID: The unique identifier for the mv.
    ///   - relationship: The name of the relationship you want to fetch for this resource.
    ///   - completion: .success(JSON) or .failure(Error)
    public func fetchALibraryMVRelationship(mvID: String, relationship: String, completion: @escaping (Swift.Result<JSON, Error>) -> Void) {
        let urlRequest = requestGenerator.createGetALibraryMVRelationshipRequest(mvID: mvID, relationship: relationship)
        
        requestByAlamofireJSON(urlRequest: urlRequest) { result in
            completion(result)
        }
    }
    
    /// Fetch multiple library music videos using their identifiers
    /// - Parameters:
    ///   - mvIDs: An array of catalogIDs for targeted library mvs. The maximum fetch limit is 100.
    ///   - completion: .success(JSON) or .failure(Error)
    public func fetchMultipleLibraryMVs(mvIDs: [String], completion: @escaping (Swift.Result<[LibraryMV], Error>) -> Void) {
        
        var urlRequest: URLRequest
        
        do {
            urlRequest = try requestGenerator.createGetMultipleLibraryMVsRequest(mvIDs: mvIDs)
        } catch {
            completion(.failure(error))
            return
        }
        
        requestByAlamofireJSON(urlRequest: urlRequest) { result in
            var libraryMVsResult: Swift.Result<[LibraryMV], Error>
            
            switch result {
            case .success(let responseJson):    // successfully get response from server
                // JSON array of catalogAlbums, each element is of JSON type containing one catalogAlbum data
                let libraryMVsDataArray: [JSON] = responseJson["data"].array!
                
                var libraryMVsArray: [LibraryMV] = []
                
                // parse each catalogAlbum from each JSON
                libraryMVsDataArray.forEach { libaryMVData in
                    let libraryMV = LibraryMV(mvData: libaryMVData)
                    libraryMVsArray.append(libraryMV!)
                }
                
                // set result to be returned
                libraryMVsResult = .success(libraryMVsArray)
                
            case .failure(let err): // failed to get response
                libraryMVsResult = .failure(err)
            }
            
            completion(libraryMVsResult)
        }
    }
    
    /// Fetch all library music videos at once, 100 at max at a time
    /// - Parameters:
    ///   - completion: .success([LibraryMV], FetchingStatus) or .failure(Error)
    public func fetchAllLibraryMVs(completion: @escaping (Swift.Result<([LibraryMV], FetchingStatus), Error>) -> Void) {
        
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
                        case .completed:    // Fetching is not yet completed, following requests needed
                            
                            // Update offset and fetching status for next request
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
                        default:    // Other cases are logically impossible to occur
                            print("Current case is unexpected.")
                            
                            // Complete with error
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
                    // Increment retry count
                    retryCount += 1
                    // Retry(as offset kept unchanged) fetching of current segment
                    continueFetching()
                }
                
            // Fetch has been marked completed
            default:
                break
                
            }
        }

        /// Function that fetches a segment of all library music videos
        /// - Parameters:
        ///   - limit: Maximum count of resources to be expected in response.
        ///   - offset: The offset of starting resource to be expected in response.
        ///   - completion: .success(([LibraryMV], newOffset: String, segmentStatus: FetchingStatus)) or .failure(Error)
        func fetchSegmentalLibraryMVs(limit: String, offset: String, completion: @escaping (Swift.Result<([LibraryMV], newOffset: String, segmentStatus: FetchingStatus), Error>) -> Void) {
            
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
                    
                    // Parse each libraryMV from each JSON in segmentalLibraryMVsDataArray
                    segmentalLibraryMVsDataArray.forEach { libraryMVData in
                        let libraryMV = LibraryMV(mvData: libraryMVData)
                        // Append newly parsed libraryMV to [LibraryMV] array
                        segmentalLibraryMVsArray.append(libraryMV!)
                    }
                    
                    // Detect existence of field "next"
                    if responseJson["next"].exists() {
                        // Try to parse offset from field "next"
                        let offsetParsingResult = Self.offsetMatches(for: "(\\d{2,})", in: responseJson["next"].string ?? "")
                        
                        switch offsetParsingResult {
                        case .success(let offsetParsed):
                            // Update offset variablefrom outer func
                            newOffset = offsetParsed
                        case .failure(let err):
                            // Field "next" exists but failed to parse offset value
                            // Complete with error
                            completion(.failure(err))
                        }
                        
                        // Update status, indicating current segment has been fetched and parsed
                        segmentStatus = .completed
                        completion(.success((segmentalLibraryMVsArray, newOffset: newOffset, segmentStatus: segmentStatus)))
                        
                    } else {    // Field "next" does not exist, current segment is expected to be ultimate
                        // Update status, indicating last segment has been fetched
                        segmentStatus = .ending
                        completion(.success((segmentalLibraryMVsArray, newOffset: newOffset, segmentStatus: segmentStatus)))
                    }
                    
                case .failure(let err): // failed to get response
                    completion(.failure(err))
                }
                
            }
            
        }

        // Start sequential(progressive) calling
        continueFetching()

    }
    
    // MARK: - Playlist
    /// Fetch a catalog playlist using its identifier
    /// - Parameters:
    ///   - storefront: An identifier (ISO 3166 alpha-2 country codes) of the storefront you want to perform this request in.
    ///   - playlistID: The unique identifier for the playlist.
    ///   - completion: .success(CatalogPlaylist) or .failure(Error)
    public func fetchACatalogPlaylist(storefront: String, playlistID: String, completion: @escaping (Swift.Result<CatalogPlaylist, Error>) -> Void) {
        let urlRequest = requestGenerator.createGetACatalogPlaylistRequest(storefront: storefront, playlistID: playlistID)
        
        requestByAlamofireJSON(urlRequest: urlRequest) { result in
            var catalogPlaylistResult: Swift.Result<CatalogPlaylist, Error>
            
            switch result {
            case .success(let responseJson):
                let catalogPlaylistData: JSON = responseJson["data"].array![0]
                let catalogPlaylist = CatalogPlaylist(playlistData: catalogPlaylistData)
                catalogPlaylistResult = .success(catalogPlaylist!)
            case .failure(let err):
                catalogPlaylistResult = .failure(err)
            }
            
            completion(catalogPlaylistResult)
        }
    }
    
    /// Fetch relationship of a catalog playlist using its identifier and relationship name
    /// - Parameters:
    ///   - storefront: An identifier (ISO 3166 alpha-2 country codes) of the storefront you want to perform this request in.
    ///   - playlistID: The unique identifier for the playlist.
    ///   - relationship: The name of the relationship you want to fetch for this resource.
    ///   - completion: .success(JSON) or .failure(Error)
    public func fetchACatalogPlaylistRelationship(storefront: String, playlistID: String, relationship: String, completion: @escaping (Swift.Result<JSON, Error>) -> Void) {
        let urlRequest = requestGenerator.createGetACatalogPlaylistRelationshipRequest(storefront: storefront, playlistID: playlistID, relationship: relationship)
        
        requestByAlamofireJSON(urlRequest: urlRequest) { result in
            completion(result)
        }
    }
    
    /// Fetch multiple catalog playlists using their identifiers, 25 at max at a time
    /// - Parameters:
    ///   - storefront: An identifier (ISO 3166 alpha-2 country codes) of the storefront you want to perform this request in.
    ///   - playlistIDs: An array of catalogIDs for targeted catalog playlists. The maximum fetch limit is 25.
    ///   - completion: .success([CatalogPlaylist]) or .failure(Error)
    public func fetchMultipleCatalogPlaylists(storefront: String, playlistIDs: [String], completion: @escaping (Swift.Result<[CatalogPlaylist], Error>) -> Void) {
        
        var urlRequest: URLRequest
        
        do {
            urlRequest = try requestGenerator.createGetMultipleCatalogPlaylistsRequest(storefront: storefront, playlistIDs: playlistIDs)
        } catch {
            completion(.failure(error))
            return
        }
        
        requestByAlamofireJSON(urlRequest: urlRequest) { result in
            var catalogPlaylistsResult: Swift.Result<[CatalogPlaylist], Error>
            
            switch result {
            case .success(let responseJson):    // successfully get response from server
                // JSON array of catalogPlaylists, each element is of JSON type containing one catalogPlaylist data
                let catalogPlaylistsDataArray: [JSON] = responseJson["data"].array!
                
                var catalogPlaylistsArray: [CatalogPlaylist] = []
                
                // parse each catalogPlaylist from each JSON
                catalogPlaylistsDataArray.forEach { catalogPlaylistData in
                    let catalogPlaylist = CatalogPlaylist(playlistData: catalogPlaylistData)
                    catalogPlaylistsArray.append(catalogPlaylist!)
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
    ///   - playlistID: The unique identifier for the playlist.
    ///   - completion: .success(LibraryPlaylist) or .failure(Error)
    public func fetchALibraryPlaylist(playlistID: String, completion: @escaping (Swift.Result<LibraryPlaylist, Error>) -> Void) {
        let urlRequest = requestGenerator.createGetALibraryPlaylistRequest(playlistID: playlistID)
        
        requestByAlamofireJSON(urlRequest: urlRequest) { result in
            var libraryPlaylistResult: Swift.Result<LibraryPlaylist, Error>
            
            switch result {
            case .success(let responseJson):
                let libraryPlaylistData: JSON = responseJson["data"].array![0]
                let libraryPlaylist = LibraryPlaylist(playlistData: libraryPlaylistData)
                libraryPlaylistResult = .success(libraryPlaylist!)
            case .failure(let err):
                libraryPlaylistResult = .failure(err)
            }
            
            completion(libraryPlaylistResult)
        }
    }
    
    /// Fetch relationship of a library playlist using its identifier and relationship name
    /// - Parameters:
    ///   - playlistID: The unique identifier for the playlist.
    ///   - relationship: The name of the relationship you want to fetch for this resource.
    ///   - completion: .success(JSON) or .failure(Error)
    public func fetchALibraryPlaylistRelationship(playlistID: String, relationship: String, completion: @escaping (Swift.Result<JSON, Error>) -> Void) {
        let urlRequest = requestGenerator.createGetALibraryPlaylistRelationshipRequest(playlistID: playlistID, relationship: relationship)
        
        requestByAlamofireJSON(urlRequest: urlRequest) { result in
            completion(result)
        }
    }
    
    /// Fetch multiple library playlists using their identifiers, 25 at max at a time
    /// - Parameters:
    ///   - playlistIDs: An array of catalogIDs for targeted catalog playlists. The maximum fetch limit is 25.
    ///   - completion: .success([LibraryPlaylist]) or .failure(Error)
    public func fetchMultipleLibraryPlaylists(storefront: String, playlistIDs: [String], completion: @escaping (Swift.Result<[LibraryPlaylist], Error>) -> Void) {
        
        var urlRequest: URLRequest
        
        do {
            urlRequest = try requestGenerator.createGetMultipleLibraryPlaylistsRequest(playlistIDs: playlistIDs)
        } catch {
            completion(.failure(error))
            return
        }
        
        requestByAlamofireJSON(urlRequest: urlRequest) { result in
            var libraryPlaylistsResult: Swift.Result<[LibraryPlaylist], Error>
            
            switch result {
            case .success(let responseJson):    // successfully get response from server
                // JSON array of LibraryPlaylists, each element is of JSON type containing one LibraryPlaylist data
                let libraryPlaylistsDataArray: [JSON] = responseJson["data"].array!
                
                var libraryPlaylistsArray: [LibraryPlaylist] = []
                
                // parse each LibraryPlaylist from each JSON
                libraryPlaylistsDataArray.forEach { libraryPlaylistData in
                    let libraryPlaylist = LibraryPlaylist(playlistData: libraryPlaylistData)
                    libraryPlaylistsArray.append(libraryPlaylist!)
                }
                
                // set result to be returned
                libraryPlaylistsResult = .success(libraryPlaylistsArray)
                
            case .failure(let err): // failed to get response
                libraryPlaylistsResult = .failure(err)
            }
            
            completion(libraryPlaylistsResult)
        }
    }
    
    /// Fetch all library playlists at once, 100 at max at a time
    /// - Parameters:
    ///   - completion: .success([LibraryPlaylist], FetchingStatus) or .failure(Error)
    public func fetchAllLibraryPlaylists(completion: @escaping (Swift.Result<([LibraryPlaylist], FetchingStatus), Error>) -> Void) {
        
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
                        case .completed:    // Fetching is not yet completed, following requests needed
                            
                            // Update offset and fetching status for next request
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
                        default:    // Other cases are logically impossible to occur
                            print("Current case is unexpected.")
                            
                            // Complete with error
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
                    // Increment retry count
                    retryCount += 1
                    // Retry(as offset kept unchanged) fetching of current segment
                    continueFetching()
                }
                
            // Fetch has been marked completed
            default:
                break
                
            }
        }

        /// Function that fetches a segment of all library playlists
        /// - Parameters:
        ///   - limit: Maximum count of resources to be expected in response.
        ///   - offset: The offset of starting resource to be expected in response.
        ///   - completion: .success(([LibraryPlaylist], newOffset: String, segmentStatus: FetchingStatus)) or .failure(Error)
        func fetchSegmentalLibraryPlaylists(limit: String, offset: String, completion: @escaping (Swift.Result<([LibraryPlaylist], newOffset: String, segmentStatus: FetchingStatus), Error>) -> Void) {
            
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
                    
                    // Parse each libraryPlaylist from each JSON in segmentalLibraryPlaylistsDataArray
                    segmentalLibraryPlaylistsDataArray.forEach { libraryPlaylistData in
                        if let libraryPlaylist = LibraryPlaylist(playlistData: libraryPlaylistData) {
                            // Append newly parsed libraryPlaylist to [LibraryPlaylist] array
                            segmentalLibraryPlaylistsArray.append(libraryPlaylist)
                        } else {
                            // Individual LibraryPlaylist parsing failed, prompt JSON data in console
                            print(libraryPlaylistData)
                        }
                        
                    }
                    
                    // Detect existence of field "next"
                    if responseJson["next"].exists() {
                        // Try to parse offset from field "next"
                        let offsetParsingResult = Self.offsetMatches(for: "(\\d{2,})", in: responseJson["next"].string ?? "")
                        
                        switch offsetParsingResult {
                        case .success(let offsetParsed):
                            // Update offset variablefrom outer func
                            newOffset = offsetParsed
                        case .failure(let err):
                            // Field "next" exists but failed to parse offset value
                            // Complete with error
                            completion(.failure(err))
                        }
                        
                        // Update status, indicating current segment has been fetched and parsed
                        segmentStatus = .completed
                        completion(.success((segmentalLibraryPlaylistsArray, newOffset: newOffset, segmentStatus: segmentStatus)))
                        
                    } else {    // Field "next" does not exist, current segment is expected to be ultimate
                        // Update status, indicating last segment has been fetched
                        segmentStatus = .ending
                        completion(.success((segmentalLibraryPlaylistsArray, newOffset: newOffset, segmentStatus: segmentStatus)))
                    }
                    
                case .failure(let err): // failed to get response
                    completion(.failure(err))
                }
                
            }
            
        }

        // Start sequential(progressive) calling
        continueFetching()

    }
    
    /// Create a new library playlist, there is no catalog playlist to be created, hence the function name is shortened from original. Nil parameters are handled.
    /// - Parameters:
    ///   - name: The name of playlist to be created.
    ///   - description: The description of the playlist to be created.
    ///   - songsIDs: An array of identifiers of songs in the new playlist.
    ///   - completion: .success(StatusCode) or .failure(Error)
    public func createAPlaylist(name: String?, description: String?, songsIDs: [String]?, completion: @escaping (Swift.Result<String, Error>) -> Void) {
        let plName = name ?? "New Playlist"
        let plDescription = description ?? ""
        let plSongsIDs = songsIDs ?? []
        
        let urlRequest = requestGenerator.createCreateANewLibraryPlaylistRequest(name: plName, description: plDescription, songsIDs: plSongsIDs)
        
        requestByAlamofireString(urlRequest: urlRequest) { result in
            completion(result)
        }
    }
    
    /// Add songs to a playlist owned by the user, using their identifiers
    /// - Parameters:
    ///   - playlistID: The unique identifier for the playlist.
    ///   - songsIDs: An array of identifiers of songs to be added to playlist.
    ///   - completion: .success(StatusCode) or .failure(Error)
    public func addTracksToAPlaylist(playlistID: String, songsIDs: [String], completion: @escaping (Swift.Result<String, Error>) -> Void) {
        let urlRequest = requestGenerator.createAddTracksToAPlaylistRequest(playlistID: playlistID, songsIDs: songsIDs)
        
        requestByAlamofireString(urlRequest: urlRequest) { result in
            completion(result)
        }
    }
    
    // MARK: - Stations
    /// Fetch a catalog station using its identifier
    /// - Parameters:
    ///   - storefront: An identifier (ISO 3166 alpha-2 country codes) of the storefront you want to perform this request in.
    ///   - stationID: The unique identifier for the station.
    ///   - completion: .success(CatalogStation) or .failure(Error)
    public func fetchACatalogStation(storefront: String, stationID: String, completion: @escaping (Swift.Result<CatalogStation, Error>) -> Void) {
        let urlRequest = requestGenerator.createGetACatalogStationRequest(storefront: storefront, stationID: stationID)
        
        requestByAlamofireJSON(urlRequest: urlRequest) { result in
            var catalogStationResult: Swift.Result<CatalogStation, Error>
            
            switch result {
            case .success(let responseJson):
                let catalogStationData: JSON = responseJson["data"].array![0]
                let catalogStation = CatalogStation(stationData: catalogStationData)
                catalogStationResult = .success(catalogStation!)
            case .failure(let err):
                catalogStationResult = .failure(err)
            }
            
            completion(catalogStationResult)
        }
    }
    
    /// Fetch multiple catalog stations using their identifiers, 100 at max at a time
    /// - Parameters:
    ///   - storefront: An identifier (ISO 3166 alpha-2 country codes) of the storefront you want to perform this request in.
    ///   - stationIDs: An array of catalogIDs for targeted catalog stations. The maximum fetch limit is 100.
    ///   - completion: .success(JSON) or .failure(Error)
    public func fetchMultipleCatalogStations(storefront: String, stationIDs: [String], completion: @escaping (Swift.Result<[CatalogStation], Error>) -> Void) {
        
        var urlRequest: URLRequest
        
        do {
            urlRequest = try requestGenerator.createGetMultipleCatalogStationsRequest(storefront: storefront, stationIDs: stationIDs)
        } catch {
            completion(.failure(error))
            return
        }
        
        requestByAlamofireJSON(urlRequest: urlRequest) { result in
            var catalogStationsResult: Swift.Result<[CatalogStation], Error>
            
            switch result {
            case .success(let responseJson):    // successfully get response from server
                // JSON array of CatalogStations, each element is of JSON type containing one CatalogStation data
                let catalogStationsDataArray: [JSON] = responseJson["data"].array!
                
                var catalogStationsArray: [CatalogStation] = []
                
                // parse each CatalogStation from each JSON
                catalogStationsDataArray.forEach { catalogStationData in
                    let catalogStation = CatalogStation(stationData: catalogStationData)
                    catalogStationsArray.append(catalogStation!)
                }
                
                // set result to be returned
                catalogStationsResult = .success(catalogStationsArray)
                
            case .failure(let err): // failed to get response
                catalogStationsResult = .failure(err)
            }
            
            completion(catalogStationsResult)
        }
    }
    
    
    // TODO: - More
    
    /// Private function for searching offest index from response ["next"]
    ///
    /// - Parameters:
    ///   - regex: regular expression feature
    ///   - text: string value from ["next"]
    /// - Returns: offset index in String
    private static func offsetMatches(for regex: String, in text: String) -> Swift.Result<String, Error> {
        
        let result: Swift.Result<String, Error>
        
        do {
            let regex = try NSRegularExpression(pattern: regex)
            let results = regex.matches(in: text,
                                        range: NSRange(text.startIndex..., in: text))
            let finalResult = results.map {
                String(text[Range($0.range, in: text)!])
            }
            
            if let digits = finalResult.last {
                // matching succeeded
                result = .success(digits)
            } else {
                // matching failed, response likely corrupted
                result = .failure(HummingKitResponseError.responseCorrupted)
            }
            return result
            
        } catch {
            // regex initialization failed, return with error
            result = .failure(error)
            return result
        }
    }
    
    /// Private function for decoding response status returned from server
    ///
    /// - Parameter response: response from server
    /// - Returns: status(true if succeeded), error(contains Error if failed), result(JSON response from server)
    private static func decodeResponseStatus(_ response: DataResponse<Any>) -> (success: Bool, error: Error?, responseJSON: JSON?) {
        
        if let error = response.result.error as? AFError {
            if let status = response.response?.statusCode {
                let statusCode = handleResponseAFError(statusCode: status, error: error)
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
