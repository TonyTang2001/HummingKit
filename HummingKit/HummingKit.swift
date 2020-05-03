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
    
    private var developerToken: String
    private var userToken: String
    private let requestGenerator: HummingKitRequestFactory
    
    init(developerToken: String, userToken: String) {
        self.developerToken = developerToken
        self.userToken = userToken
        requestGenerator = HummingKitRequestFactory(developerToken: developerToken, userToken: userToken)
    }
    
    public typealias completionStringChunk = (_ success: Bool, _ error: Error?, _ result: String?) -> Void
    public typealias completionJSONChunk = (_ success: Bool, _ error: Error?, _ result: JSON?) -> Void
    
    
    /// Private function that modularize Alamofire url requesting and responses
    /// - Parameters:
    ///   - urlRequest: URL request that needs to be conducted by Alamofire
    ///   - completion: Swift.Result type handles json response, .success(JSON) or .failure(Error)
    private func requestByAlamofire(urlRequest: URLRequest, completion: @escaping (Swift.Result<JSON, Error>) -> Void) {
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
    private func requestByAlamofire(urlRequest: URLRequest, completion: @escaping (Swift.Result<String, Error>) -> Void) {
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
                
//                let data = Self.decodeResponseStatus(response)
                
//                if data.success {
//                    result = .success("")
//                } else {
//                    guard let err = data.error else { return }
//                    result = .failure(err)
//                }
                completion(result)
        }
    }
    
    // MARK: - Storefonts
    /// Fetch user's Apple Music account storefront information
    /// - Parameter completion: .success(JSON) or .failure(Error)
    public func fetchUserStorefront(completion: @escaping (Swift.Result<JSON, Error>) -> Void) {
        let urlRequest = requestGenerator.createGetUserStorefrontRequest()
        
        requestByAlamofire(urlRequest: urlRequest) { result in
            completion(result)
        }
    }
    
    /// Fetch a storefront from Apple Music server using its identifier
    /// - Parameters:
    ///   - storefrontID: The identifier (an ISO 3166 alpha-2 country code) for the storefront you want to fetch.
    ///   - completion: .success(JSON) or .failure(Error)
    public func fetchAStorefront(storefrontID: String, completion: @escaping (Swift.Result<JSON, Error>) -> Void) {
        let urlRequest = requestGenerator.createGetAStorefrontRequest(storefrontID: storefrontID)
        
        requestByAlamofire(urlRequest: urlRequest) { result in
            completion(result)
        }
    }
    
    /// Fetch a number of storefronts by their identifiers at the same time
    /// - Parameters:
    ///   - storefrontIDs: An array of the identifiers (ISO 3166 alpha-2 country codes) for the storefronts you want to fetch.
    ///   - completion: .success(JSON) or .failure(Error)
    public func fetchMultipleStorefronts(storefrontIDs: [String], completion: @escaping (Swift.Result<JSON, Error>) -> Void) {
        let urlRequest = requestGenerator.createGetMultipleStorefrontsRequest(storefrontIDs: storefrontIDs)
        
        requestByAlamofire(urlRequest: urlRequest) { result in
            completion(result)
        }
    }
    
    /// Fetch all storefronts available at the same time
    /// - Parameter completion: .success(JSON) or .failure(Error)
    public func fetchAllStorefronts(completion: @escaping (Swift.Result<JSON, Error>) -> Void) {
        let urlRequest = requestGenerator.createGetAllStorefrontsRequest()
        
        requestByAlamofire(urlRequest: urlRequest) { result in
            completion(result)
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
        
        requestByAlamofire(urlRequest: urlRequest) { result in
            completion(result)
        }
    }
    
    // MARK: - Albums
    /// Fetch a catalog album using its identifier
    /// - Parameters:
    ///   - storefront: An identifier (ISO 3166 alpha-2 country codes) of the storefront you want to perform this request in.
    ///   - albumID: The unique identifier for the album.
    ///   - completion: .success(JSON) or .failure(Error)
    public func fetchACatalogAlbum(storefront: String, albumID: String, completion: @escaping (Swift.Result<JSON, Error>) -> Void) {
        let urlRequest = requestGenerator.createGetACatalogAlbumRequest(storefront: storefront, albumID: albumID)
        
        requestByAlamofire(urlRequest: urlRequest) { result in
            completion(result)
        }
    }
    
    /// Fetch multiple catalog albums using their identifiers
    /// - Parameters:
    ///   - storefront: An identifier (ISO 3166 alpha-2 country codes) of the storefront you want to perform this request in.
    ///   - albumIDs: The unique identifiers for the albums. The maximum fetch limit is 100.
    ///   - completion: .success(JSON) or .failure(Error)
    public func fetchMultipleCatalogAlbums(storefront: String, albumIDs: [String], completion: @escaping (Swift.Result<JSON, Error>) -> Void) {
        guard let urlRequest =
            try? requestGenerator.createGetMultipleCatalogAlbumsRequest(storefront: storefront, albumIDs: albumIDs)
            else {
            return
        }
        
        requestByAlamofire(urlRequest: urlRequest) { result in
            completion(result)
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
        
        requestByAlamofire(urlRequest: urlRequest) { result in
            completion(result)
        }
    }
    
    /// Fetch a library album using its identifier
    /// - Parameters:
    ///   - albumID: The unique identifier for the album.
    ///   - completion: .success(JSON) or .failure(Error)
    public func fetchALibraryAlbum(storefront: String, albumID: String, completion: @escaping (Swift.Result<JSON, Error>) -> Void) {
        let urlRequest = requestGenerator.createGetALibraryAlbumRequest(albumID: albumID)
        
        requestByAlamofire(urlRequest: urlRequest) { result in
            completion(result)
        }
    }
    
    /// Fetch the relationship of a library album using its identifier and relationship name
    /// - Parameters:
    ///   - albumID: The unique identifier for the album.
    ///   - relationship: The name of the relationship you want to fetch for this resource.
    ///   - completion: .success(JSON) or .failure(Error)
    public func fetchALibraryAlbumRelationship(albumID: String, relationship: String, completion: @escaping (Swift.Result<JSON, Error>) -> Void) {
        let urlRequest = requestGenerator.createGetALibraryAlbumRelationshipRequest(albumID: albumID, relationship: relationship)
        
        requestByAlamofire(urlRequest: urlRequest) { result in
            completion(result)
        }
    }
    
    /// Fetch multiple library albums using their identifiers
    /// - Parameters:
    ///   - albumIDs: The unique identifiers for the albums. The maximum fetch limit is 100.
    ///   - completion: .success(JSON) or .failure(Error)
    public func fetchMultipleLibraryAlbums(albumIDs: [String], completion: @escaping (Swift.Result<JSON, Error>) -> Void) {
        guard let urlRequest =
            try? requestGenerator.createGetMultipleLibraryAlbumsRequest(albumIDs: albumIDs)
            else {
                return
        }
        
        requestByAlamofire(urlRequest: urlRequest) { result in
            completion(result)
        }
    }
    
    /// Fetch all library albums at once
    /// - Parameters:
    ///   - completion: .success(JSON) or .failure(Error)
    public func fetchAllLibraryAlbums(completion: @escaping (Swift.Result<JSON, Error>) -> Void) {
        guard let urlRequest =
            try? requestGenerator.createGetAllLibraryAlbumsRequest()
            else {
                return
        }
        
        requestByAlamofire(urlRequest: urlRequest) { result in
            completion(result)
        }
    }
    
    // MARK: - Artists
    /// Fetch a catalog artist using their identifier
    /// - Parameters:
    ///   - storefront: An identifier (ISO 3166 alpha-2 country codes) of the storefront you want to perform this request in.
    ///   - artistID: The unique identifier for the artist.
    ///   - completion: .success(JSON) or .failure(Error)
    public func fetchACatalogArtist(storefront: String, artistID: String, completion: @escaping (Swift.Result<JSON, Error>) -> Void) {
        let urlRequest = requestGenerator.createGetACatalogArtistRequest(storefront: storefront, artistID: artistID)
        
        requestByAlamofire(urlRequest: urlRequest) { result in
            completion(result)
        }
    }
    
    /// Fetch multiple catalog artists using their identifiers
    /// - Parameters:
    ///   - storefront: An identifier (ISO 3166 alpha-2 country codes) of the storefront you want to perform this request in.
    ///   - artistIDs: The unique identifiers for the artists. The maximum fetch limit is 25.
    ///   - completion: .success(JSON) or .failure(Error)
    public func fetchMultipleCatalogArtists(storefront: String, artistIDs: [String], completion: @escaping (Swift.Result<JSON, Error>) -> Void) {
        let urlRequest = requestGenerator.createGetMultipleCatalogArtistsRequest(storefront: storefront, artistIDs: artistIDs)
        
        requestByAlamofire(urlRequest: urlRequest) { result in
            completion(result)
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
        
        requestByAlamofire(urlRequest: urlRequest) { result in
            completion(result)
        }
    }
    
    /// Fetch a library artist using their identifier
    /// - Parameters:
    ///   - artistID: The unique identifier for the artist.
    ///   - completion: .success(JSON) or .failure(Error)
    public func fetchALibraryArtist(artistID: String, completion: @escaping (Swift.Result<JSON, Error>) -> Void) {
        let urlRequest = requestGenerator.createGetALibraryArtistRequest(artistID: artistID)
        
        requestByAlamofire(urlRequest: urlRequest) { result in
            completion(result)
        }
    }
    
    /// Fetch all library artists at once
    /// - Parameters:
    ///   - completion: .success(JSON) or .failure(Error)
    public func fetchAllLibraryArtists(completion: @escaping (Swift.Result<JSON, Error>) -> Void) {
        let urlRequest = requestGenerator.createGetAllLibraryArtistsRequest()
        
        requestByAlamofire(urlRequest: urlRequest) { result in
            completion(result)
        }
    }
    
    /// Fetch multiple library artists using their identifiers
    /// - Parameters:
    ///   - artistIDs: The unique identifiers for the albums. The maximum fetch limit is 25.
    ///   - completion: .success(JSON) or .failure(Error)
    public func fetchMultipleLibraryArtists(artistIDs: [String], completion: @escaping (Swift.Result<JSON, Error>) -> Void) {
        let urlRequest = requestGenerator.createGetMultipleLibraryArtistsRequest(artistIDs: artistIDs)
        
        requestByAlamofire(urlRequest: urlRequest) { result in
            completion(result)
        }
    }
    
    /// Fetch relationship of a library artist using their identifier and relationship name
    /// - Parameters:
    ///   - artistID: The unique identifier for the artist.
    ///   - relationship: The name of the relationship you want to fetch for this resource.
    ///   - completion: .success(JSON) or .failure(Error)
    public func fetchALibraryArtistRelationship(artistID: String, relationship: String, completion: @escaping (Swift.Result<JSON, Error>) -> Void) {
        let urlRequest = requestGenerator.createGetALibraryArtistRelationshipRequest(artistID: artistID, relationship: relationship)
        
        requestByAlamofire(urlRequest: urlRequest) { result in
            completion(result)
        }
    }
    
    // MARK: - Songs
    /// Fetch a catalog song using its identifier
    /// - Parameters:
    ///   - storefront: An identifier (ISO 3166 alpha-2 country codes) of the storefront you want to perform this request in.
    ///   - songID: The unique identifier for the song.
    ///   - completion: .success(JSON) or .failure(Error)
    public func fetchACatalogSong(storefront: String, songID: String, completion: @escaping (Swift.Result<JSON, Error>) -> Void) {
        let urlRequest = requestGenerator.createGetACatalogSongRequest(storefront: storefront, songID: songID)
        
        requestByAlamofire(urlRequest: urlRequest) { result in
            completion(result)
        }
    }
    
    /// Fetch multiple catalog songs using their identifiers
    /// - Parameters:
    ///   - storefront: An identifier (ISO 3166 alpha-2 country codes) of the storefront you want to perform this request in.
    ///   - songIDs: An array of catalogIDs for targeted catalog songs. The maximum fetch limit is 300.
    ///   - completion: .success(JSON) or .failure(Error)
    public func fetchMultipleCatalogSongs(storefront: String, songIDs: [String], completion: @escaping (Swift.Result<JSON, Error>) -> Void) {
        let urlRequest = requestGenerator.createGetMultipleCatalogSongsRequest(storefront: storefront, songIDs: songIDs)
        
        requestByAlamofire(urlRequest: urlRequest) { result in
            completion(result)
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
        
        requestByAlamofire(urlRequest: urlRequest) { result in
            completion(result)
        }
    }
    
    /// Fetch a library song using its identifier
    /// - Parameters:
    ///   - songID: The unique identifier for the song.
    ///   - completion: .success(JSON) or .failure(Error)
    public func fetchALibrarySong(storefront: String, songID: String, completion: @escaping (Swift.Result<JSON, Error>) -> Void) {
        let urlRequest = requestGenerator.createGetALibrarySongRequest(songID: songID)
        
        requestByAlamofire(urlRequest: urlRequest) { result in
            completion(result)
        }
    }
    
    /// Fetch multiple library songs using their identifiers
    /// - Parameters:
    ///   - songIDs: An array of catalogIDs for targeted catalog songs. The maximum fetch limit is 300.
    ///   - completion: .success(JSON) or .failure(Error)
    public func fetchMultipleLibrarySongs(songIDs: [String], completion: @escaping (Swift.Result<JSON, Error>) -> Void) {
        let urlRequest = requestGenerator.createGetMultipleLibrarySongsRequest(songIDs: songIDs)
        
        requestByAlamofire(urlRequest: urlRequest) { result in
            completion(result)
        }
    }
    
    /// Fetch all library songs at once
    /// - Parameters:
    ///   - completion: .success(JSON) or .failure(Error)
    public func fetchAllLibrarySongs(storefront: String, songID: String, completion: @escaping (Swift.Result<JSON, Error>) -> Void) {
        let urlRequest = requestGenerator.createGetAllLibrarySongsRequest()
        
        requestByAlamofire(urlRequest: urlRequest) { result in
            completion(result)
        }
    }
    
    /// Fetch relationship of a library song using its identifier and relationship name
    /// - Parameters:
    ///   - songID: The unique identifier for the song.
    ///   - completion: .success(JSON) or .failure(Error)
    public func fetchALibrarySongRelationship(songID: String, relationship: String, completion: @escaping (Swift.Result<JSON, Error>) -> Void) {
        let urlRequest = requestGenerator.createGetALibrarySongRelationshipRequest(songID: songID, relationship: relationship)
        
        requestByAlamofire(urlRequest: urlRequest) { result in
            completion(result)
        }
    }
    
    // MARK: - Music Videos(MV)
    /// Fetch a catalog music video using its identifier
    /// - Parameters:
    ///   - storefront: An identifier (ISO 3166 alpha-2 country codes) of the storefront you want to perform this request in.
    ///   - mvID: The unique identifier for the mv.
    ///   - completion: .success(JSON) or .failure(Error)
    public func fetchACatalogMV(storefront: String, mvID: String, completion: @escaping (Swift.Result<JSON, Error>) -> Void) {
        let urlRequest = requestGenerator.createGetACatalogMVRequest(storefront: storefront, mvID: mvID)
        
        requestByAlamofire(urlRequest: urlRequest) { result in
            completion(result)
        }
    }
    
    /// Fetch relationship of a catalog music video using its identifier and relationship name
    /// - Parameters:
    ///   - storefront: An identifier (ISO 3166 alpha-2 country codes) of the storefront you want to perform this request in.
    ///   - mvID: The unique identifier for the mv.
    ///   - completion: .success(JSON) or .failure(Error)
    public func fetchACatalogMVRelationship(storefront: String, mvID: String, relationship: String, completion: @escaping (Swift.Result<JSON, Error>) -> Void) {
        let urlRequest = requestGenerator.createGetACatalogMVRelationshipRequest(storefront: storefront, mvID: mvID, relationship: relationship)
        
        requestByAlamofire(urlRequest: urlRequest) { result in
            completion(result)
        }
    }
    
    /// Fetch multiple catalog music videos using their identifiers
    /// - Parameters:
    ///   - storefront: An identifier (ISO 3166 alpha-2 country codes) of the storefront you want to perform this request in.
    ///   - mvIDs: An array of catalogIDs for targeted catalog mvs. The maximum fetch limit is 100.
    ///   - completion: .success(JSON) or .failure(Error)
    public func fetchMultipleCatalogMVs(storefront: String, mvIDs: [String], completion: @escaping (Swift.Result<JSON, Error>) -> Void) {
        let urlRequest = requestGenerator.createGetMultipleCatalogMVsRequest(storefront: storefront, mvIDs: mvIDs)
        
        requestByAlamofire(urlRequest: urlRequest) { result in
            completion(result)
        }
    }
    
    
    // TODO: Get Multiple Catalog MVs by ISRC
    
    
    /// Fetch a library music video using its identifier
    /// - Parameters:
    ///   - mvID: The unique identifier for the mv.
    ///   - completion: .success(JSON) or .failure(Error)
    public func fetchALibraryMV(mvID: String, completion: @escaping (Swift.Result<JSON, Error>) -> Void) {
        let urlRequest = requestGenerator.createGetALibraryMVRequest(mvID: mvID)
        
        requestByAlamofire(urlRequest: urlRequest) { result in
            completion(result)
        }
    }
    
    /// Fetch relationship of a library music video using its identifier and relationship name
    /// - Parameters:
    ///   - mvID: The unique identifier for the mv.
    ///   - relationship: The name of the relationship you want to fetch for this resource.
    ///   - completion: .success(JSON) or .failure(Error)
    public func fetchALibraryMVRelationship(mvID: String, relationship: String, completion: @escaping (Swift.Result<JSON, Error>) -> Void) {
        let urlRequest = requestGenerator.createGetALibraryMVRelationshipRequest(mvID: mvID, relationship: relationship)
        
        requestByAlamofire(urlRequest: urlRequest) { result in
            completion(result)
        }
    }
    
    /// Fetch multiple library music videos using their identifiers
    /// - Parameters:
    ///   - mvIDs: An array of catalogIDs for targeted library mvs. The maximum fetch limit is 100.
    ///   - completion: .success(JSON) or .failure(Error)
    public func fetchMultipleLibraryMVs(mvIDs: [String], completion: @escaping (Swift.Result<JSON, Error>) -> Void) {
        let urlRequest = requestGenerator.createGetMultipleLibraryMVsRequest(mvIDs: mvIDs)
        
        requestByAlamofire(urlRequest: urlRequest) { result in
            completion(result)
        }
    }
    
    /// Fetch all library music videos at once, 100 at max at a time
    /// - Parameters:
    ///   - completion: .success(JSON) or .failure(Error)
    public func fetchAllLibraryMVs(completion: @escaping (Swift.Result<JSON, Error>) -> Void) {
        let urlRequest = requestGenerator.createGetAllLibraryMVsRequest()
        
        requestByAlamofire(urlRequest: urlRequest) { result in
            completion(result)
        }
    }
    
    // MARK: - Playlist
    /// Fetch a catalog playlist using its identifier
    /// - Parameters:
    ///   - storefront: An identifier (ISO 3166 alpha-2 country codes) of the storefront you want to perform this request in.
    ///   - playlistID: The unique identifier for the playlist.
    ///   - completion: .success(JSON) or .failure(Error)
    public func fetchACatalogPlaylist(storefront: String, playlistID: String, completion: @escaping (Swift.Result<JSON, Error>) -> Void) {
        let urlRequest = requestGenerator.createGetACatalogPlaylistRequest(storefront: storefront, playlistID: playlistID)
        
        requestByAlamofire(urlRequest: urlRequest) { result in
            completion(result)
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
        
        requestByAlamofire(urlRequest: urlRequest) { result in
            completion(result)
        }
    }
    
    /// Fetch multiple catalog playlists using their identifiers, 25 at max at a time
    /// - Parameters:
    ///   - storefront: An identifier (ISO 3166 alpha-2 country codes) of the storefront you want to perform this request in.
    ///   - playlistIDs: An array of catalogIDs for targeted catalog playlists. The maximum fetch limit is 25.
    ///   - completion: .success(JSON) or .failure(Error)
    public func fetchMultipleCatalogPlaylists(storefront: String, playlistIDs: [String], completion: @escaping (Swift.Result<JSON, Error>) -> Void) {
        let urlRequest = requestGenerator.createGetMultipleCatalogPlaylistsRequest(storefront: storefront, playlistIDs: playlistIDs)
        
        requestByAlamofire(urlRequest: urlRequest) { result in
            completion(result)
        }
    }
    
    /// Fetch a library playlist using its identifier
    /// - Parameters:
    ///   - playlistID: The unique identifier for the playlist.
    ///   - completion: .success(JSON) or .failure(Error)
    public func fetchALibraryPlaylist(playlistID: String, completion: @escaping (Swift.Result<JSON, Error>) -> Void) {
        let urlRequest = requestGenerator.createGetALibraryPlaylistRequest(playlistID: playlistID)
        
        requestByAlamofire(urlRequest: urlRequest) { result in
            completion(result)
        }
    }
    
    /// Fetch relationship of a library playlist using its identifier and relationship name
    /// - Parameters:
    ///   - playlistID: The unique identifier for the playlist.
    ///   - relationship: The name of the relationship you want to fetch for this resource.
    ///   - completion: .success(JSON) or .failure(Error)
    public func fetchALibraryPlaylistRelationship(playlistID: String, relationship: String, completion: @escaping (Swift.Result<JSON, Error>) -> Void) {
        let urlRequest = requestGenerator.createGetALibraryPlaylistRelationshipRequest(playlistID: playlistID, relationship: relationship)
        
        requestByAlamofire(urlRequest: urlRequest) { result in
            completion(result)
        }
    }
    
    /// Fetch multiple library playlists using their identifiers, 25 at max at a time
    /// - Parameters:
    ///   - playlistIDs: An array of catalogIDs for targeted catalog playlists. The maximum fetch limit is 25.
    ///   - completion: .success(JSON) or .failure(Error)
    public func fetchMultipleLibraryPlaylists(storefront: String, playlistIDs: [String], completion: @escaping (Swift.Result<JSON, Error>) -> Void) {
        let urlRequest = requestGenerator.createGetMultipleLibraryPlaylistsRequest(playlistIDs: playlistIDs)
        
        requestByAlamofire(urlRequest: urlRequest) { result in
            completion(result)
        }
    }
    
    /// Fetch all library playlists at once, 100 at max at a time
    /// - Parameters:
    ///   - completion: .success(JSON) or .failure(Error)
    public func fetchAllLibraryPlaylists(completion: @escaping (Swift.Result<JSON, Error>) -> Void) {
        let urlRequest = requestGenerator.createGetAllLibraryPlaylistsRequest()
        
        requestByAlamofire(urlRequest: urlRequest) { result in
            completion(result)
        }
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
        
        requestByAlamofire(urlRequest: urlRequest) { result in
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
        
        requestByAlamofire(urlRequest: urlRequest) { result in
            completion(result)
        }
    }
    
    // MARK: - Stations
    /// Fetch a catalog station using its identifier
    /// - Parameters:
    ///   - storefront: An identifier (ISO 3166 alpha-2 country codes) of the storefront you want to perform this request in.
    ///   - stationID: The unique identifier for the station.
    ///   - completion: .success(JSON) or .failure(Error)
    public func fetchACatalogStation(storefront: String, stationID: String, completion: @escaping (Swift.Result<JSON, Error>) -> Void) {
        let urlRequest = requestGenerator.createGetACatalogStationRequest(storefront: storefront, stationID: stationID)
        
        requestByAlamofire(urlRequest: urlRequest) { result in
            completion(result)
        }
    }
    
    /// Fetch multiple catalog stations using their identifiers, 100 at max at a time
    /// - Parameters:
    ///   - storefront: An identifier (ISO 3166 alpha-2 country codes) of the storefront you want to perform this request in.
    ///   - stationIDs: An array of catalogIDs for targeted catalog stations. The maximum fetch limit is 100.
    ///   - completion: .success(JSON) or .failure(Error)
    public func fetchMultipleCatalogStations(storefront: String, stationIDs: [String], completion: @escaping (Swift.Result<JSON, Error>) -> Void) {
        let urlRequest = requestGenerator.createGetMultipleCatalogStationsRequest(storefront: storefront, stationIDs: stationIDs)
        
        requestByAlamofire(urlRequest: urlRequest) { result in
            completion(result)
        }
    }
    
    // TODO: - More
    
    
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
