//
//  HummingKitRequestFactory.swift
//  HummingKit
//
//  Created by 唐子轩 on 2019/9/3.
//  Copyright © 2019 TonyTang. All rights reserved.
//

import Foundation
import SwiftyJSON

public class HummingKitRequestFactory {
    
    /// The base URL for all Apple Music API network calls.
    let appleMusicAPIBaseURLString = "api.music.apple.com"
    
    /// The Apple Music API endpoint for requesting a list of recently played items.
    let recentlyPlayedPathURLString = "/v1/me/recent/played"
    
    /// The Apple Music API endpoint for requesting a the storefront of the currently logged in iTunes Store account.
    let userStorefrontPathURLString = "/v1/me/storefront"
    
    /// The Apple Music API endpoint for requesting user library related resources.
    let userLibraryPathURLString = "/v1/me/library"
    
    /// The Apple Music API endpoint for requesting catalog resources.
    let catalogPathURLString = "/v1/catalog/"
    
    let catalogSongPathURLString = "/songs"
    let catalogPlaylistPathURLString = "/playlists"
    
    /// Developer Token provided by the developer who use this package, required for authentication
    var developerToken: DeveloperToken
    
    /// User Token fetched by device when app runs for the first time, required for authentication
    var userToken: UserToken
    
    /// Initilazation of HummingKitRequestFactory object.
    /// - Parameters:
    ///   - developerToken: Developer Token provided by the developer who use this package, required for authentication.
    ///   - userToken: User Token fetched by device when app runs for the first time, required for authentication
    public init(developerToken: DeveloperToken, userToken: UserToken) {
        self.developerToken = developerToken
        self.userToken = userToken
    }
    
    private func createBaseURLComponents() -> URLComponents {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = appleMusicAPIBaseURLString
        return urlComponents
    }
    
    private func addDeveloperTokenToRequest(request: inout URLRequest) {
        request.addValue("Bearer \(developerToken)", forHTTPHeaderField: "Authorization")
    }
    
    private func addDeveloperAndUserTokensToRequest(request: inout URLRequest) {
        request.addValue("Bearer \(developerToken)", forHTTPHeaderField: "Authorization")
        request.addValue(userToken, forHTTPHeaderField: "Music-User-Token")
    }
    
    
    // MARK: - Storefronts and Localization
    // MARK: Get a User's Storefront
    /// Generates "Fetch a User's Storefront" URL request
    public func createGetUserStorefrontRequest() -> URLRequest {
        
        var urlComponents = createBaseURLComponents()
        urlComponents.path = userStorefrontPathURLString
        
        var urlRequest = URLRequest(url: urlComponents.url!)
        urlRequest.httpMethod = "GET"
        addDeveloperAndUserTokensToRequest(request: &urlRequest)
        
        return urlRequest
    }
    
    // MARK: Get a Storefront
    /// Generates "Fetch a single storefront by using its identifier" URL request
    /// - Parameter storefrontID: The identifier (an ISO 3166 alpha-2 country code) for the storefront you want to fetch.
    public func createGetAStorefrontRequest(storefrontID: String) -> URLRequest {
        
        var urlComponents = createBaseURLComponents()
        urlComponents.path = "/v1/storefronts/\(storefrontID)"
        
        var urlRequest = URLRequest(url: urlComponents.url!)
        urlRequest.httpMethod = "GET"
        addDeveloperTokenToRequest(request: &urlRequest)
        
        return urlRequest
    }
    
    // MARK: Get Multiple Storefronts
    /// Generates "Fetch one or more storefronts by using their identifiers" URL request
    /// - Parameter storefrontIDs: An array of the identifiers (ISO 3166 alpha-2 country codes) for the storefronts you want to fetch.
    public func createGetMultipleStorefrontsRequest(storefrontIDs: [String]) -> URLRequest {
        
        var urlComponents = createBaseURLComponents()
        urlComponents.path = "/v1/storefronts"
        
        let storefrontIDsChunk = storefrontIDs.joined(separator: ",")
        urlComponents.queryItems = [ URLQueryItem(name: "ids", value: storefrontIDsChunk) ]
        
        var urlRequest = URLRequest(url: urlComponents.url!)
        urlRequest.httpMethod = "GET"
        addDeveloperTokenToRequest(request: &urlRequest)
        
        return urlRequest
    }
    
    // MARK: Get All Storefronts
    /// Generates "Fetch all the storefronts in alphabetical order" URL request
    public func createGetAllStorefrontsRequest() -> URLRequest {
        
        var urlComponents = createBaseURLComponents()
        urlComponents.path = "/v1/storefronts"
        
        var urlRequest = URLRequest(url: urlComponents.url!)
        urlRequest.httpMethod = "GET"
        addDeveloperTokenToRequest(request: &urlRequest)
        
        return urlRequest
    }
    
    // MARK: - Add Resources
    // MARK: Add a Resource to a Library
    /// Generates "Add a catalog resource to a user’s iCloud Music Library" URL request
    /// - Parameters:
    ///   - playlistsIDs: an array of unique catalog identifiers for targeted playlists
    ///   - albumsIDs: an array of unique catalog identifiers for targeted albums
    ///   - songsIDs: an array of unique catalog identifiers for targeted songs
    ///   - musicVideosIDs: an array of unique catalog identifiers for targeted music videos
    /// - Returns: the URL request for adding catalog resources to a user’s iCloud Music Library
    public func createAddResourcesToLibraryRequest(playlistsIDs: [String], albumsIDs: [String], songsIDs: [String], musicVideosIDs: [String]) -> URLRequest {
        
        var urlComponents = createBaseURLComponents()
        urlComponents.path = userLibraryPathURLString
        
        // stack songsIDs together
        var urlQuerySongsItems: [URLQueryItem] = []
        for index in 0..<songsIDs.count {
            urlQuerySongsItems.append(URLQueryItem(name: "ids[songs]", value: songsIDs[index]))
        }
        
        // stack albumsIDs together
        var urlQueryAlbumsItems: [URLQueryItem] = []
        for index in 0..<albumsIDs.count {
            urlQueryAlbumsItems.append(URLQueryItem(name: "ids[albums]", value: albumsIDs[index]))
        }
        
        // stack playlistsIDs together
        var urlQueryPlaylistsItems: [URLQueryItem] = []
        for index in 0..<playlistsIDs.count {
            urlQueryPlaylistsItems.append(URLQueryItem(name: "ids[playlists]", value: playlistsIDs[index]))
        }
        
        // stack musicVideosIDs together
        var urlQueryMVsItems: [URLQueryItem] = []
        for index in 0..<musicVideosIDs.count {
            urlQueryMVsItems.append(URLQueryItem(name: "ids[music-videos]", value: musicVideosIDs[index]))
        }
        
        // combine all IDs: songsIDs, albumsIDs, playlistsIDs, musicVideosIDs
        let urlQueryItemsFinal = urlQuerySongsItems + urlQueryAlbumsItems + urlQueryPlaylistsItems + urlQueryMVsItems
        
        // add all IDs into url
        urlComponents.queryItems = urlQueryItemsFinal
        
        var urlRequest = URLRequest(url: urlComponents.url!)
        urlRequest = URLRequest(url: urlComponents.url!)
        urlRequest.httpMethod = "POST"
        addDeveloperAndUserTokensToRequest(request: &urlRequest)
        
        return urlRequest
    }
    
    // MARK: - Albums
    // MARK: Get a Catalog Album
    /// Generates "Fetch an album by using its identifier" URL request
    /// - Parameters:
    ///   - storefront: An identifier (ISO 3166 alpha-2 country codes) of the storefront you want to perform this request in.
    ///   - albumID: The unique identifier for the album.
    public func createGetACatalogAlbumRequest(storefront: String, albumID: String) -> URLRequest {
        var urlComponents = createBaseURLComponents()
        urlComponents.path = "/v1/catalog/\(storefront)/albums/\(albumID)"
        
        var urlRequest = URLRequest(url: urlComponents.url!)
        urlRequest.httpMethod = "GET"
        addDeveloperTokenToRequest(request: &urlRequest)
        
        return urlRequest
    }
    
    // MARK: Get Multiple Catalog Albums
    /// Generates "Fetch one or more albums by using their identifiers" URL request
    /// - Parameters:
    ///   - storefront: An identifier (ISO 3166 alpha-2 country codes) of the storefront you want to perform this request in.
    ///   - albumIDs: The unique identifiers for the albums. The maximum fetch limit is 100.
    public func createGetMultipleCatalogAlbumsRequest(storefront: String, albumIDs: [String]) throws -> URLRequest {
        // check if exceeds max fetch limit
        if albumIDs.count > 100 {
            throw HummingKitRequestComposingError.exceedMaxFetchLimit(maxLimit: 100)
        }
        
        var urlComponents = createBaseURLComponents()
        urlComponents.path = "/v1/catalog/\(storefront)/albums"
        
        let albumIDsChunk = albumIDs.joined(separator: ",")
        urlComponents.queryItems = [ URLQueryItem(name: "ids", value: albumIDsChunk) ]
        
        var urlRequest = URLRequest(url: urlComponents.url!)
        urlRequest.httpMethod = "GET"
        addDeveloperTokenToRequest(request: &urlRequest)
        
        return urlRequest
    }
    
    // MARK: Get a Catalog Album's Relationship Directly by Name
    /// Generates "Fetch an album's relationship by using its identifier" URL request
    /// - Parameters:
    ///   - storefront: An identifier (ISO 3166 alpha-2 country codes) of the storefront you want to perform this request in.
    ///   - albumID: The unique identifier for the album.
    ///   - relationship: The name of the relationship you want to fetch for this resource.
    public func createGetACatalogAlbumRelationshipRequest(storefront: String, albumID: String, relationship: String) -> URLRequest {
        var urlComponents = createBaseURLComponents()
        urlComponents.path = "/v1/catalog/\(storefront)/albums/\(albumID)/\(relationship)"
        
        var urlRequest = URLRequest(url: urlComponents.url!)
        urlRequest.httpMethod = "GET"
        addDeveloperTokenToRequest(request: &urlRequest)
        
        return urlRequest
    }
    
    // MARK: Get a Library Album
    /// Generates "Fetch a library album by using its identifier" URL request
    /// - Parameter albumID: The unique identifier for the album.
    public func createGetALibraryAlbumRequest(albumID: String) -> URLRequest {
        var urlComponents = createBaseURLComponents()
        urlComponents.path = "/v1/me/library/albums/\(albumID)"
        
        var urlRequest = URLRequest(url: urlComponents.url!)
        urlRequest.httpMethod = "GET"
        addDeveloperAndUserTokensToRequest(request: &urlRequest)
        
        return urlRequest
    }
    
    // MARK: Get a Library Album's Relationship Directly by Name
    /// Generates "Fetch an album's relationship by using its identifier" URL request
    /// - Parameters:
    ///   - albumID: The unique identifier for the album.
    ///   - relationship: The name of the relationship you want to fetch for this resource.
    public func createGetALibraryAlbumRelationshipRequest(albumID: String, relationship: String) -> URLRequest {
        var urlComponents = createBaseURLComponents()
        urlComponents.path = "/v1/me/library/albums/\(albumID)/\(relationship)"
        
        var urlRequest = URLRequest(url: urlComponents.url!)
        urlRequest.httpMethod = "GET"
        addDeveloperAndUserTokensToRequest(request: &urlRequest)
        
        return urlRequest
    }
    
    // MARK: Get Multiple Library Albums
    /// Generates "Fetch one or more library albums by using their identifiers" URL request
    /// - Parameter albumIDs: The unique identifiers for the albums. The maximum fetch limit is 100.
    public func createGetMultipleLibraryAlbumsRequest(albumIDs: [String]) throws -> URLRequest {
        // check if exceeds max fetch limit
        if albumIDs.count > 100 {
            throw HummingKitRequestComposingError.exceedMaxFetchLimit(maxLimit: 100)
        }
        
        var urlComponents = createBaseURLComponents()
        urlComponents.path = "/v1/me/library/albums"
        
        let albumIDsChunk = albumIDs.joined(separator: ",")
        urlComponents.queryItems = [ URLQueryItem(name: "ids", value: albumIDsChunk) ]
        
        var urlRequest = URLRequest(url: urlComponents.url!)
        urlRequest.httpMethod = "GET"
        addDeveloperAndUserTokensToRequest(request: &urlRequest)
        
        return urlRequest
    }
    
    // MARK: Get All Library Albums
    /// Generates "Fetch all the library albums in alphabetical order" URL request
    /// - Parameters:
    ///   - limit: The maximum limit count of library albums to be expected in response, default to 25, maximum at 100.
    ///   - offset: The offset for resources of current request (Pagination),  default to 0.
    /// - Throws: HummingKitRequestComposingError.invalidArgument if arguments contain cahracters other than digits, or .exceedMaxFetchLimit if limit is set to above 100.
    /// - Returns: The "Fetch all the library albums in alphabetical order" URL request.
    public func createGetAllLibraryAlbumsRequest(limit: String = "25", offset: String = "0") throws -> URLRequest {
        
        // check if arguments are valid
        if !(limit.isInt && offset.isInt) {
            throw HummingKitRequestComposingError.invalidArgument
        } else {
            guard let limitInt = Int(limit), let offsetInt = Int(offset)
                else {
                    // cannot convert limit and offset to Int
                    throw HummingKitRequestComposingError.unknownInternalError
            }
            
            // check if argument values are valid
            if limitInt <= 0 || offsetInt < 0 {
                throw HummingKitRequestComposingError.invalidArgument
            }
            
            // check if exceeds max fetch limit
            if limitInt > 100 {
                throw HummingKitRequestComposingError.exceedMaxFetchLimit(maxLimit: 100)
            }
            
        }
        
        var urlComponents = createBaseURLComponents()
        urlComponents.path = "/v1/me/library/albums"
        // concatenate query parameters
        urlComponents.queryItems = [ URLQueryItem(name: "limit", value: limit), URLQueryItem(name: "offset", value: offset) ]
        
        var urlRequest = URLRequest(url: urlComponents.url!)
        urlRequest.httpMethod = "GET"
        addDeveloperAndUserTokensToRequest(request: &urlRequest)
        
        return urlRequest
    }
    
    // MARK: - Artists
    // MARK: Get a Catalog Artist
    /// Generates "Fetch an artist by using the artist's identifier" URL request
    /// - Parameters:
    ///   - storefront: An identifier (ISO 3166 alpha-2 country codes) of the storefront you want to perform this request in.
    ///   - artistID: The unique identifier for the artist.
    public func createGetACatalogArtistRequest(storefront: String, artistID: String) -> URLRequest {
        var urlComponents = createBaseURLComponents()
        urlComponents.path = "/v1/catalog/\(storefront)/artists/\(artistID)"
        
        var urlRequest = URLRequest(url: urlComponents.url!)
        urlRequest.httpMethod = "GET"
        addDeveloperTokenToRequest(request: &urlRequest)
        
        return urlRequest
    }
    
    // MARK: Get Multiple Catalog Artists
    /// Generates "Fetch one or more artists by using their identifiers" URL request
    /// - Parameters:
    ///   - storefront: An identifier (ISO 3166 alpha-2 country codes) of the storefront you want to perform this request in.
    ///   - artistIDs: The unique identifiers for the artists. The maximum fetch limit is 25.
    public func createGetMultipleCatalogArtistsRequest(storefront: String, artistIDs: [String]) throws -> URLRequest {
        // check if exceeds max fetch limit
        if artistIDs.count > 25 {
            throw HummingKitRequestComposingError.exceedMaxFetchLimit(maxLimit: 25)
        }
        
        var urlComponents = createBaseURLComponents()
        urlComponents.path = "/v1/catalog/\(storefront)/artists"
        
        let artistIDsChunk = artistIDs.joined(separator: ",")
        urlComponents.queryItems = [ URLQueryItem(name: "ids", value: artistIDsChunk) ]
        
        var urlRequest = URLRequest(url: urlComponents.url!)
        urlRequest.httpMethod = "GET"
        addDeveloperTokenToRequest(request: &urlRequest)
        
        return urlRequest
    }
    
    // MARK: Get a Catalog Artist's Relationship Directly by Name
    /// Generates "Fetch an artist's relationship by using the artist's identifier" URL request
    /// - Parameters:
    ///   - storefront: An identifier (ISO 3166 alpha-2 country codes) of the storefront you want to perform this request in.
    ///   - artistID: The unique identifier for the artist.
    ///   - relationship: The name of the relationship you want to fetch for this resource.
    public func createGetACatalogArtistRelationshipRequest(storefront: String, artistID: String, relationship: String) -> URLRequest {
        var urlComponents = createBaseURLComponents()
        urlComponents.path = "/v1/catalog/\(storefront)/artists/\(artistID)/\(relationship)"
        
        var urlRequest = URLRequest(url: urlComponents.url!)
        urlRequest.httpMethod = "GET"
        addDeveloperTokenToRequest(request: &urlRequest)
        
        return urlRequest
    }
    
    // MARK: Get a Library Artist
    /// Generates "Fetch a library artist by using its identifier" URL request
    /// - Parameter artistID: The unique identifier for the artist.
    public func createGetALibraryArtistRequest(artistID: String) -> URLRequest {
        var urlComponents = createBaseURLComponents()
        urlComponents.path = "/v1/me/library/artists/\(artistID)"
        
        var urlRequest = URLRequest(url: urlComponents.url!)
        urlRequest.httpMethod = "GET"
        addDeveloperAndUserTokensToRequest(request: &urlRequest)
        
        return urlRequest
    }
    
    // MARK: Get All Library Artists
    /// Generates "Fetch all the library artists in alphabetical order" URL request
    /// - Parameters:
    ///   - limit: The maximum limit count of library artists to be expected in response, default to 25, maximum at 100.
    ///   - offset: The offset for resources of current request (Pagination),  default to 0.
    /// - Throws: HummingKitRequestComposingError.invalidArgument if arguments contain cahracters other than digits, or .exceedMaxFetchLimit if limit is set to above 100.
    /// - Returns: The "Fetch all the library artists in alphabetical order" URL request
    public func createGetAllLibraryArtistsRequest(limit: String = "25", offset: String = "0") throws -> URLRequest {
        
        // check if arguments are valid
        if !(limit.isInt && offset.isInt) {
            throw HummingKitRequestComposingError.invalidArgument
        } else {
            guard let limitInt = Int(limit), let offsetInt = Int(offset)
                else {
                    // cannot convert limit and offset to Int
                    throw HummingKitRequestComposingError.unknownInternalError
            }
            
            // check if argument values are valid
            if limitInt <= 0 || offsetInt < 0 {
                throw HummingKitRequestComposingError.invalidArgument
            }
            
            // check if exceeds max fetch limit
            if limitInt > 100 {
                throw HummingKitRequestComposingError.exceedMaxFetchLimit(maxLimit: 100)
            }
            
        }
        
        var urlComponents = createBaseURLComponents()
        urlComponents.path = "/v1/me/library/artists"
        // concatenate query parameters
        urlComponents.queryItems = [ URLQueryItem(name: "limit", value: limit), URLQueryItem(name: "offset", value: offset) ]
        
        var urlRequest = URLRequest(url: urlComponents.url!)
        urlRequest.httpMethod = "GET"
        addDeveloperAndUserTokensToRequest(request: &urlRequest)
        
        return urlRequest
    }
    
    // MARK: Get Multiple Library Artists
    /// Generates "Fetch one or more library artists by using their identifiers" URL request
    /// - Parameter artistIDs: The unique identifiers for the albums. The maximum fetch limit is 25.
    public func createGetMultipleLibraryArtistsRequest(artistIDs: [String]) throws -> URLRequest {
        // check if exceeds max fetch limit
        if artistIDs.count > 25 {
            throw HummingKitRequestComposingError.exceedMaxFetchLimit(maxLimit: 25)
        }
        
        var urlComponents = createBaseURLComponents()
        urlComponents.path = "/v1/me/library/artists"
        
        let artistIDsChunk = artistIDs.joined(separator: ",")
        urlComponents.queryItems = [ URLQueryItem(name: "ids", value: artistIDsChunk) ]
        
        var urlRequest = URLRequest(url: urlComponents.url!)
        urlRequest.httpMethod = "GET"
        addDeveloperAndUserTokensToRequest(request: &urlRequest)
        
        return urlRequest
    }
    
    // MARK: Get a Library Artist's Relationship Directly by Name
    /// Generates "Fetch a library artist's relationship by using its identifier" URL request
    /// - Parameters:
    ///   - artistID: The unique identifier for the artist.
    ///   - relationship: The name of the relationship you want to fetch for this resource.
    public func createGetALibraryArtistRelationshipRequest(artistID: String, relationship: String) -> URLRequest {
        var urlComponents = createBaseURLComponents()
        urlComponents.path = "/v1/me/library/artists/\(artistID)/\(relationship)"
        
        var urlRequest = URLRequest(url: urlComponents.url!)
        urlRequest.httpMethod = "GET"
        addDeveloperAndUserTokensToRequest(request: &urlRequest)
        
        return urlRequest
    }
    
    // MARK: - Songs
    // MARK: Get a Catalog Song
    /// Generates "Fetch a song by using its identifier" URL request
    /// - Parameters:
    ///   - storefront: An identifier (ISO 3166 alpha-2 country codes) of the storefront you want to perform this request in.
    ///   - songID: The unique identifier for the song.
    public func createGetACatalogSongRequest(storefront: String, songID: String) -> URLRequest {
        
        var urlComponents = createBaseURLComponents()
        urlComponents.path = catalogPathURLString + storefront + catalogSongPathURLString + "/" + songID
        
        var urlRequest = URLRequest(url: urlComponents.url!)
        urlRequest.httpMethod = "GET"
        addDeveloperAndUserTokensToRequest(request: &urlRequest)
        
        return urlRequest
    }
    
    // MARK: Get Multiple Catalog Songs by ID
    /// Generates "Fetch one or more songs by using their identifiers" URL request
    /// - Parameters:
    ///   - storefront: An identifier (ISO 3166 alpha-2 country codes) of the storefront you want to perform this request in.
    ///   - songIDs: An array of catalogIDs for targeted catalog songs. The maximum fetch limit is 300.
    public func createGetMultipleCatalogSongsRequest(storefront: String, songIDs: [String]) throws -> URLRequest {
        // check if exceeds max fetch limit
        if songIDs.count > 300 {
            throw HummingKitRequestComposingError.exceedMaxFetchLimit(maxLimit: 300)
        }
        
        var urlComponents = createBaseURLComponents()
        
        let songIDsChunk = songIDs.joined(separator: ",")
        urlComponents.path = catalogPathURLString + storefront + catalogSongPathURLString
        urlComponents.queryItems = [ URLQueryItem(name: "ids", value: songIDsChunk) ]
        
        var urlRequest = URLRequest(url: urlComponents.url!)
        urlRequest.httpMethod = "GET"
        addDeveloperAndUserTokensToRequest(request: &urlRequest)
        
        return urlRequest
    }
    
    // MARK: Get Multiple Catalog Songs by ISRC
    // FIXME: Todo
    
    
    // MARK: Get a Catalog Song's Relationship Directly by Name
    /// Generates "Fetch an song's relationship by using the song's identifier" URL request
    /// - Parameters:
    ///   - storefront: An identifier (ISO 3166 alpha-2 country codes) of the storefront you want to perform this request in.
    ///   - songID: The unique identifier for the song.
    ///   - relationship: The name of the relationship you want to fetch for this resource.
    public func createGetACatalogSongRelationshipRequest(storefront: String, songID: String, relationship: String) -> URLRequest {
        var urlComponents = createBaseURLComponents()
        urlComponents.path = "/v1/catalog/\(storefront)/songs/\(songID)/\(relationship)"
        
        var urlRequest = URLRequest(url: urlComponents.url!)
        urlRequest.httpMethod = "GET"
        addDeveloperTokenToRequest(request: &urlRequest)
        
        return urlRequest
    }
    
    // MARK: Get a Library Song
    /// Generates "Fetch a library song by using its identifier" URL request
    /// - Parameter songID: The unique identifier for the song.
    public func createGetALibrarySongRequest(songID: String) -> URLRequest {
        var urlComponents = createBaseURLComponents()
        urlComponents.path = "/v1/me/library/songs/\(songID)"
        
        var urlRequest = URLRequest(url: urlComponents.url!)
        urlRequest.httpMethod = "GET"
        addDeveloperAndUserTokensToRequest(request: &urlRequest)
        
        return urlRequest
    }
    
    // MARK: Get All Library Songs
    /// Generates "Fetch all the library songs in alphabetical order" URL request.
    /// - Parameters:
    ///   - limit: The maximum limit count of library songs to be expected in response, default to 25, maximum at 100.
    ///   - offset: The offset for resources of current request (Pagination),  default to 0.
    /// - Throws: HummingKitRequestComposingError.invalidArgument if arguments contain cahracters other than digits, or .exceedMaxFetchLimit if limit is set to above 100.
    /// - Returns: The "Fetch all the library songs in alphabetical order" URL request.
    public func createGetAllLibrarySongsRequest(limit: String = "25", offset: String = "0") throws -> URLRequest {
        // check if arguments are valid
        if !(limit.isInt && offset.isInt) {
            throw HummingKitRequestComposingError.invalidArgument
        } else {
            guard let limitInt = Int(limit), let offsetInt = Int(offset)
                else {
                    // cannot convert limit and offset to Int
                    throw HummingKitRequestComposingError.unknownInternalError
            }
            
            // check if argument values are valid
            if limitInt <= 0 || offsetInt < 0 {
                throw HummingKitRequestComposingError.invalidArgument
            }
            
            // check if exceeds max fetch limit
            if limitInt > 100 {
                throw HummingKitRequestComposingError.exceedMaxFetchLimit(maxLimit: 100)
            }
            
        }
        
        var urlComponents = createBaseURLComponents()
        urlComponents.path = userLibraryPathURLString + catalogSongPathURLString
        // concatenate query parameters
        urlComponents.queryItems = [ URLQueryItem(name: "limit", value: limit), URLQueryItem(name: "offset", value: offset) ]
        
        var urlRequest = URLRequest(url: urlComponents.url!)
        urlRequest.httpMethod = "GET"
        addDeveloperAndUserTokensToRequest(request: &urlRequest)
        
        return urlRequest
    }
    
    // MARK: Get Multiple Library Songs
    /// Generates "Fetch one or more library songs by using their identifiers" URL request
    /// - Parameter songIDs: An array of catalogIDs for targeted catalog songs. The maximum fetch limit is 300.
    public func createGetMultipleLibrarySongsRequest(songIDs: [String]) throws -> URLRequest {
        // check if exceeds max fetch limit
        if songIDs.count > 300 {
            throw HummingKitRequestComposingError.exceedMaxFetchLimit(maxLimit: 300)
        }
        
        var urlComponents = createBaseURLComponents()
        urlComponents.path = "/v1/me/library/songs"
        
        let songIDsChunk = songIDs.joined(separator: ",")
        urlComponents.queryItems = [ URLQueryItem(name: "ids", value: songIDsChunk) ]
        
        var urlRequest = URLRequest(url: urlComponents.url!)
        urlRequest.httpMethod = "GET"
        addDeveloperAndUserTokensToRequest(request: &urlRequest)
        
        return urlRequest
    }
    
    // MARK: Get a Library Song's Relationship Directly by Name
    /// Generates "Fetch a library song's relationship by using its identifier" URL request
    /// - Parameters:
    ///   - songID: The unique identifier for the song.
    ///   - relationship: The name of the relationship you want to fetch for this resource.
    public func createGetALibrarySongRelationshipRequest(songID: String, relationship: String) -> URLRequest {
        var urlComponents = createBaseURLComponents()
        urlComponents.path = "/v1/me/library/songs/\(songID)/\(relationship)"
        
        var urlRequest = URLRequest(url: urlComponents.url!)
        urlRequest.httpMethod = "GET"
        addDeveloperAndUserTokensToRequest(request: &urlRequest)
        
        return urlRequest
    }
    
    // MARK: - Music Videos(MV)
    // MARK: Get a Catalog MV
    /// Generates "Fetch a music video by using its identifier" URL request
    /// - Parameters:
    ///   - storefront: An identifier (ISO 3166 alpha-2 country codes) of the storefront you want to perform this request in.
    ///   - mvID: The unique identifier for the mv.
    public func createGetACatalogMVRequest(storefront: String, mvID: String) -> URLRequest {
        
        var urlComponents = createBaseURLComponents()
        urlComponents.path = "/v1/catalog/\(storefront)/music-videos/\(mvID)"
        
        var urlRequest = URLRequest(url: urlComponents.url!)
        urlRequest.httpMethod = "GET"
        addDeveloperAndUserTokensToRequest(request: &urlRequest)
        
        return urlRequest
    }
    
    // MARK: Get a Catalog MV's Relationship Directly by Name
    /// Generates "Fetch a music video's relationship by using its identifier" URL request
    /// - Parameters:
    ///   - storefront: An identifier (ISO 3166 alpha-2 country codes) of the storefront you want to perform this request in.
    ///   - mvID: The unique identifier for the mv.
    ///   - relationship: The name of the relationship you want to fetch for this resource.
    public func createGetACatalogMVRelationshipRequest(storefront: String, mvID: String, relationship: String) -> URLRequest {
        var urlComponents = createBaseURLComponents()
        urlComponents.path = "/v1/catalog/\(storefront)/music-videos/\(mvID)/\(relationship)"
        
        var urlRequest = URLRequest(url: urlComponents.url!)
        urlRequest.httpMethod = "GET"
        addDeveloperTokenToRequest(request: &urlRequest)
        
        return urlRequest
    }
    
    // MARK: Get Multiple Catalog MVs by ID
    /// Generates "Fetch one or more music videos by using their identifiers" URL request
    /// - Parameters:
    ///   - storefront: An identifier (ISO 3166 alpha-2 country codes) of the storefront you want to perform this request in.
    ///   - mvIDs: An array of catalogIDs for targeted catalog mvs. The maximum fetch limit is 100.
    public func createGetMultipleCatalogMVsRequest(storefront: String, mvIDs: [String]) throws -> URLRequest {
        // check if exceeds max fetch limit
        if mvIDs.count > 100 {
            throw HummingKitRequestComposingError.exceedMaxFetchLimit(maxLimit: 100)
        }
        
        var urlComponents = createBaseURLComponents()
        
        let mvIDsChunk = mvIDs.joined(separator: ",")
        urlComponents.path = "/v1/catalog/\(storefront)/music-videos"
        urlComponents.queryItems = [ URLQueryItem(name: "ids", value: mvIDsChunk) ]
        
        var urlRequest = URLRequest(url: urlComponents.url!)
        urlRequest.httpMethod = "GET"
        addDeveloperAndUserTokensToRequest(request: &urlRequest)
        
        return urlRequest
    }
    
    // TODO: Get Multiple Catalog MVs by ISRC
    
    // MARK: Get a Library MV
    /// Generates "Fetch a library music video by using its identifier" URL request
    /// - Parameter mvID: The unique identifier for the mv.
    public func createGetALibraryMVRequest(mvID: String) -> URLRequest {
        var urlComponents = createBaseURLComponents()
        urlComponents.path = "/v1/me/library/music-videos/\(mvID)"
        
        var urlRequest = URLRequest(url: urlComponents.url!)
        urlRequest.httpMethod = "GET"
        addDeveloperAndUserTokensToRequest(request: &urlRequest)
        
        return urlRequest
    }
    
    // MARK: Get a Library MV's Relationship Directly by Name
    /// Generates "Fetch a library music video's relationship by using its identifier" URL request
    /// - Parameters:
    ///   - mvID: The unique identifier for the mv.
    ///   - relationship: The name of the relationship you want to fetch for this resource.
    public func createGetALibraryMVRelationshipRequest(mvID: String, relationship: String) -> URLRequest {
        var urlComponents = createBaseURLComponents()
        urlComponents.path = "/v1/me/library/music-videos/\(mvID)/\(relationship)"
        
        var urlRequest = URLRequest(url: urlComponents.url!)
        urlRequest.httpMethod = "GET"
        addDeveloperAndUserTokensToRequest(request: &urlRequest)
        
        return urlRequest
    }
    
    // MARK: Get Multiple Library MVs
    /// Generates "Fetch one or more library music videos by using their identifiers" URL request
    /// - Parameter mvIDs: The unique identifiers for the mvs. The maximum fetch limit is 100.
    public func createGetMultipleLibraryMVsRequest(mvIDs: [String]) throws -> URLRequest {
        // check if exceeds max fetch limit
        if mvIDs.count > 100 {
            throw HummingKitRequestComposingError.exceedMaxFetchLimit(maxLimit: 100)
        }
        
        var urlComponents = createBaseURLComponents()
        urlComponents.path = "/v1/me/library/music-videos"
        
        let mvIDsChunk = mvIDs.joined(separator: ",")
        urlComponents.queryItems = [ URLQueryItem(name: "ids", value: mvIDsChunk) ]
        
        var urlRequest = URLRequest(url: urlComponents.url!)
        urlRequest.httpMethod = "GET"
        addDeveloperAndUserTokensToRequest(request: &urlRequest)
        
        return urlRequest
    }
    
    // MARK: Get All Library MVs
    /// Generates "Fetch all the library music videos in alphabetical order" URL request.
    /// - Parameters:
    ///   - limit: The maximum limit count of library music videos to be expected in response, default to 25, maximum at 100.
    ///   - offset: The offset for resources of current request (Pagination),  default to 0.
    /// - Throws: HummingKitRequestComposingError.invalidArgument if arguments contain cahracters other than digits, or .exceedMaxFetchLimit if limit is set to above 100.
    /// - Returns: The "Fetch all the library music videos in alphabetical order" URL request.
    public func createGetAllLibraryMVsRequest(limit: String = "25", offset: String = "0") throws -> URLRequest {
        
        // check if arguments are valid
        if !(limit.isInt && offset.isInt) {
            throw HummingKitRequestComposingError.invalidArgument
        } else {
            guard let limitInt = Int(limit), let offsetInt = Int(offset)
                else {
                    // cannot convert limit and offset to Int
                    throw HummingKitRequestComposingError.unknownInternalError
            }
            
            // check if argument values are valid
            if limitInt <= 0 || offsetInt < 0 {
                throw HummingKitRequestComposingError.invalidArgument
            }
            
            // check if exceeds max fetch limit
            if limitInt > 100 {
                throw HummingKitRequestComposingError.exceedMaxFetchLimit(maxLimit: 100)
            }
            
        }
        var urlComponents = createBaseURLComponents()
        urlComponents.path = "/v1/me/library/music-videos"
        // concatenate query parameters
        urlComponents.queryItems = [ URLQueryItem(name: "limit", value: limit), URLQueryItem(name: "offset", value: offset) ]
        
        var urlRequest = URLRequest(url: urlComponents.url!)
        urlRequest.httpMethod = "GET"
        addDeveloperAndUserTokensToRequest(request: &urlRequest)
        
        return urlRequest
    }
    
    // MARK: - Playlist
    // MARK: Get a Catalog Playlist
    /// Generates "Fetch a playlist by using its identifier" URL request
    /// - Parameters:
    ///   - storefront: An identifier (ISO 3166 alpha-2 country codes) of the storefront you want to perform this request in.
    ///   - playlistID: The unique identifier for the playlist.
    public func createGetACatalogPlaylistRequest(storefront: String, playlistID: String) -> URLRequest {
        
        var urlComponents = createBaseURLComponents()
        urlComponents.path = "/v1/catalog/\(storefront)/playlists/\(playlistID)"
        
        var urlRequest = URLRequest(url: urlComponents.url!)
        urlRequest.httpMethod = "GET"
        addDeveloperAndUserTokensToRequest(request: &urlRequest)
        
        return urlRequest
    }
    
    // MARK: Get a Catalog Playlist's Relationship Directly by Name
    /// Generates "Fetch a playlist's relationship by using its identifier" URL request
    /// - Parameters:
    ///   - storefront: An identifier (ISO 3166 alpha-2 country codes) of the storefront you want to perform this request in.
    ///   - playlistID: The unique identifier for the playlist.
    ///   - relationship: The name of the relationship you want to fetch for this resource.
    public func createGetACatalogPlaylistRelationshipRequest(storefront: String, playlistID: String, relationship: String) -> URLRequest {
        var urlComponents = createBaseURLComponents()
        urlComponents.path = "/v1/catalog/\(storefront)/playlists/\(playlistID)/\(relationship)"
        
        var urlRequest = URLRequest(url: urlComponents.url!)
        urlRequest.httpMethod = "GET"
        addDeveloperTokenToRequest(request: &urlRequest)
        
        return urlRequest
    }
    
    // MARK: Get Multiple Catalog Playlists
    // FIXME: MaxLimit is 25
    /// Generates "Fetch one or more playlists by using their identifiers" URL request
    /// - Parameters:
    ///   - storefront: An identifier (ISO 3166 alpha-2 country codes) of the storefront you want to perform this request in.
    ///   - playlistIDs: An array of catalogIDs for targeted catalog playlists. The maximum fetch limit is 25.
    public func createGetMultipleCatalogPlaylistsRequest(storefront: String, playlistIDs: [String]) throws -> URLRequest {
        // check if exceeds max fetch limit
        if playlistIDs.count > 25 {
            throw HummingKitRequestComposingError.exceedMaxFetchLimit(maxLimit: 25)
        }
        
        var urlComponents = createBaseURLComponents()
        
        let playlistIDsChunk = playlistIDs.joined(separator: ",")
        urlComponents.path = "/v1/catalog/\(storefront)/playlists"
        urlComponents.queryItems = [ URLQueryItem(name: "ids", value: playlistIDsChunk) ]
        
        var urlRequest = URLRequest(url: urlComponents.url!)
        urlRequest.httpMethod = "GET"
        addDeveloperAndUserTokensToRequest(request: &urlRequest)
        
        return urlRequest
    }
    
    // MARK: Get a Library Playlist
    /// Generates "Fetch a library playlist by using its identifier" URL request
    /// - Parameter playlistID: The unique identifier for the playlist.
    public func createGetALibraryPlaylistRequest(playlistID: String) -> URLRequest {
        var urlComponents = createBaseURLComponents()
        urlComponents.path = "/v1/me/library/playlists/\(playlistID)"
        
        var urlRequest = URLRequest(url: urlComponents.url!)
        urlRequest.httpMethod = "GET"
        addDeveloperAndUserTokensToRequest(request: &urlRequest)
        
        return urlRequest
    }
    
    // MARK: Get a Library Playlist's Relationship Directly by Name
    /// Generates "Fetch a library playlist's relationship by using its identifier" URL request
    /// - Parameters:
    ///   - playlistID: The unique identifier for the playlist.
    ///   - relationship: The name of the relationship you want to fetch for this resource.
    public func createGetALibraryPlaylistRelationshipRequest(playlistID: String, relationship: String) -> URLRequest {
        var urlComponents = createBaseURLComponents()
        urlComponents.path = "/v1/me/library/music-videos/\(playlistID)/\(relationship)"
        
        var urlRequest = URLRequest(url: urlComponents.url!)
        urlRequest.httpMethod = "GET"
        addDeveloperAndUserTokensToRequest(request: &urlRequest)
        
        return urlRequest
    }
    
    // MARK: Get Multiple Library Playlists
    /// Generates "Fetch one or more library music videos by using their identifiers" URL request
    /// - Parameter playlistIDs: An array of catalogIDs for targeted catalog playlists. The maximum fetch limit is 25.
    public func createGetMultipleLibraryPlaylistsRequest(playlistIDs: [String]) throws -> URLRequest {
        // check if exceeds max fetch limit
        if playlistIDs.count > 25 {
            throw HummingKitRequestComposingError.exceedMaxFetchLimit(maxLimit: 25)
        }
        var urlComponents = createBaseURLComponents()
        urlComponents.path = "/v1/me/library/playlists"
        
        let playlistIDsChunk = playlistIDs.joined(separator: ",")
        urlComponents.queryItems = [ URLQueryItem(name: "ids", value: playlistIDsChunk) ]
        
        var urlRequest = URLRequest(url: urlComponents.url!)
        urlRequest.httpMethod = "GET"
        addDeveloperAndUserTokensToRequest(request: &urlRequest)
        
        return urlRequest
    }
    
    // MARK: Get All Library Playlists
    /// Generates "Fetch all the library playlists in alphabetical order" URL request.
    /// - Parameters:
    ///   - limit: The maximum limit count of library playlists to be expected in response, default to 25, maximum at 100.
    ///   - offset: The offset for resources of current request (Pagination),  default to 0.
    /// - Throws: HummingKitRequestComposingError.invalidArgument if arguments contain cahracters other than digits, or .exceedMaxFetchLimit if limit is set to above 100.
    /// - Returns: The "Fetch all the library playlists in alphabetical order" URL request.
    public func createGetAllLibraryPlaylistsRequest(limit: String = "25", offset: String = "0") throws -> URLRequest {
        
        // check if arguments are valid
        if !(limit.isInt && offset.isInt) {
            throw HummingKitRequestComposingError.invalidArgument
        } else {
            guard let limitInt = Int(limit), let offsetInt = Int(offset)
                else {
                    // cannot convert limit and offset to Int
                    throw HummingKitRequestComposingError.unknownInternalError
            }
            
            // check if argument values are valid
            if limitInt <= 0 || offsetInt < 0 {
                throw HummingKitRequestComposingError.invalidArgument
            }
            
            // check if exceeds max fetch limit
            if limitInt > 100 {
                throw HummingKitRequestComposingError.exceedMaxFetchLimit(maxLimit: 100)
            }
            
        }
        
        var urlComponents = createBaseURLComponents()
        urlComponents.path = userLibraryPathURLString + catalogPlaylistPathURLString
        // concatenate query parameters
        urlComponents.queryItems = [ URLQueryItem(name: "limit", value: limit), URLQueryItem(name: "offset", value: offset) ]
        
        var urlRequest = URLRequest(url: urlComponents.url!)
        urlRequest.httpMethod = "GET"
        addDeveloperAndUserTokensToRequest(request: &urlRequest)
        
        return urlRequest
    }
    
    // MARK: Create a New Library Playlist
    /// Generates "Create a new playlist in a user’s library" URL request
    ///
    /// - Parameters:
    ///   - name: The name of playlist to be created.
    ///   - description: The description of the playlist to be created.
    ///   - songsIDs: An array of identifiers of songs in the new playlist.
    public func createCreateANewLibraryPlaylistRequest(name: String, description: String, songsIDs: [String]) -> URLRequest {
        var urlComponents = createBaseURLComponents()
        urlComponents.path = userLibraryPathURLString + catalogPlaylistPathURLString
        
        // prepare HTTP body
        let attributes: JSON = ["name": name, "description": description]
        var songsJson: [JSON] = []
        for index in 0..<songsIDs.count {
            let aSong: JSON = ["id": songsIDs[index], "type": "songs"]
            songsJson.append(aSong)
        }
        let songsDataJson: JSON = ["data": JSON(songsJson).object]
        let tracksJson: JSON = ["tracks": songsDataJson.object]
        let bodyJson: JSON = ["attributes": attributes.object, "relationships": tracksJson.object]
        let bodyJsonData = try? JSONSerialization.data(withJSONObject: bodyJson)
        
        var urlRequest = URLRequest(url: urlComponents.url!)
        urlRequest = URLRequest(url: urlComponents.url!)
        urlRequest.httpMethod = "POST"
        urlRequest.httpBody = bodyJsonData
        addDeveloperAndUserTokensToRequest(request: &urlRequest)
        
        return urlRequest
    }
    
    // FIXME: This function has NOT been tested yet
    /// Generates "Add Tracks to a Library Playlist" URL request
    ///
    /// - Parameters:
    ///   - playlistID: The unique identifier for the playlist.
    ///   - songIDs: An array of identifiers of songs to be added to playlist.
    public func createAddTracksToAPlaylistRequest(playlistID: String, songsIDs: [String]) -> URLRequest {
        
        var urlComponents = createBaseURLComponents()
        urlComponents.path = userLibraryPathURLString + catalogPlaylistPathURLString + "/" + playlistID + "/tracks"
        
        var songsJson: [JSON] = []
        for index in 0..<songsIDs.count {
            let aSong: JSON = ["id": songsIDs[index], "type": "songs"]
            songsJson.append(aSong)
        }
        
        let bodyJson: JSON = ["data": JSON(songsJson).object]
        let bodyJsonData = try? JSONSerialization.data(withJSONObject: bodyJson)
        
        var urlRequest = URLRequest(url: urlComponents.url!)
        urlRequest = URLRequest(url: urlComponents.url!)
        urlRequest.httpMethod = "POST"
        urlRequest.httpBody = bodyJsonData
        addDeveloperAndUserTokensToRequest(request: &urlRequest)
        
        return urlRequest
    }
    
    
    // MARK: - Stations
    // MARK: Get a Catalog Station
    /// Generates "Fetch a station by using its identifier" URL request
    /// - Parameters:
    ///   - storefront: An identifier (ISO 3166 alpha-2 country codes) of the storefront you want to perform this request in.
    ///   - stationID: The unique identifier for the station.
    public func createGetACatalogStationRequest(storefront: String, stationID: String) -> URLRequest {
        
        var urlComponents = createBaseURLComponents()
        urlComponents.path = "/v1/catalog/\(storefront)/stations/\(stationID)"
        
        var urlRequest = URLRequest(url: urlComponents.url!)
        urlRequest.httpMethod = "GET"
        addDeveloperAndUserTokensToRequest(request: &urlRequest)
        
        return urlRequest
    }
    
    // MARK: Get Multiple Catalog Stations
    // FIXME: MaxLimit is 100
    /// Generates "Fetch one or more stations by using their identifiers" URL request
    /// - Parameters:
    ///   - storefront: An identifier (ISO 3166 alpha-2 country codes) of the storefront you want to perform this request in.
    ///   - stationIDs: An array of catalogIDs for targeted catalog stations. The maximum fetch limit is 100.
    public func createGetMultipleCatalogStationsRequest(storefront: String, stationIDs: [String]) throws -> URLRequest {
        // check if exceeds max fetch limit
        if stationIDs.count > 100 {
            throw HummingKitRequestComposingError.exceedMaxFetchLimit(maxLimit: 100)
        }
        
        var urlComponents = createBaseURLComponents()
        
        let stationIDsChunk = stationIDs.joined(separator: ",")
        urlComponents.path = "/v1/catalog/\(storefront)/stations"
        urlComponents.queryItems = [ URLQueryItem(name: "ids", value: stationIDsChunk) ]
        
        var urlRequest = URLRequest(url: urlComponents.url!)
        urlRequest.httpMethod = "GET"
        addDeveloperAndUserTokensToRequest(request: &urlRequest)
        
        return urlRequest
    }
    
    
    
    
    // MARK: - Not Revised
    // FIXME: - search limit & offset need to be handled
    /// Function for generating "Search for Catalog Resources" URL request
    ///
    /// - Parameters:
    ///   - storefront: the expected Apple Music storefront for request to happen, usually the same as user's Apple Music account storefront
    ///   - term: the user entered text for search, " " -> "+" character replacement is handled
    /// - Returns: the URL request for searching catalog resources(by using a query) from Apple Music server
    public func createSearchRequest(storefront: String, term: String) -> URLRequest {
        
        var urlComponents = createBaseURLComponents()
        urlComponents.path = catalogPathURLString + "\(storefront)/search"
        
        let expectedTerms = term.replacingOccurrences(of: " ", with: "+")
        let urlParameters = ["term": expectedTerms,
                             "limit": "10",
                             "types": "songs,albums"]
        
        var queryItems = [URLQueryItem]()
        for (key, value) in urlParameters {
            queryItems.append(URLQueryItem(name: key, value: value))
        }
        
        urlComponents.queryItems = queryItems
        
        var urlRequest = URLRequest(url: urlComponents.url!)
        urlRequest.httpMethod = "GET"
        addDeveloperTokenToRequest(request: &urlRequest)
        
        return urlRequest
    }
    
    /// Function for generating "Get Recently Played Resources" URL request
    ///
    /// - Returns: the URL request for fetching the recently played resources for the user
    public func createGetRecentlyPlayedRequest() -> URLRequest {
        
        var urlComponents = createBaseURLComponents()
        urlComponents.path = recentlyPlayedPathURLString
        
        var urlRequest = URLRequest(url: urlComponents.url!)
        urlRequest.httpMethod = "GET"
        addDeveloperAndUserTokensToRequest(request: &urlRequest)
        
        return urlRequest
    }
    
}

extension String {
    var isInt: Bool {
        return Int(self) != nil
    }
}
