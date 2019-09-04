//
//  AppleMusicRequestFactory.swift
//  HummingKit
//
//  Created by 唐子轩 on 2019/9/3.
//  Copyright © 2019 TonyTang. All rights reserved.
//

import Foundation
import SwiftyJSON

struct AppleMusicRequestFactory {
    
    /// The base URL for all Apple Music API network calls.
    static let appleMusicAPIBaseURLString = "api.music.apple.com"
    
    /// The Apple Music API endpoint for requesting a list of recently played items.
    static let recentlyPlayedPathURLString = "/v1/me/recent/played"
    
    /// The Apple Music API endpoint for requesting a the storefront of the currently logged in iTunes Store account.
    static let userStorefrontPathURLString = "/v1/me/storefront"
    
    static let userLibraryAddition = "/v1/me/library"
    
    /// The Apple Music API endpoint for fetching a song by using its identifier.
    static let catalogPathURLString = "/v1/catalog/"
    static let catalogSongPathURLStringPart2 = "/songs/"
    
    static let catalogMultipleSongsPathURLStringPart2 = "/songs"
    
    static let userLibrarySongs = "/v1/me/library/songs"
    static let userLibraryPlaylists = "/v1/me/library/playlists"
    
    /// Function for generating "Get A Catalog Song" URL request
    ///
    /// - Parameters:
    ///   - developerToken: the Apple Music Developer Token required for authentication, fetched by developer from Apple Music server
    ///   - userToken: the Apple Music User Token required for authentication, fetched by user's device when the app runs for the first time
    ///   - storefront: the expected Apple Music storefront for request to happen, usually the same as user's Apple Music account storefront
    ///   - songID: catalogID for the targeted catalog song
    /// - Returns: the URL request for fetching the catalog song by using its identifier
    public static func createGetCatalogSongRequest(developerToken: String, userToken: String, storefront: String, songID: String) -> URLRequest {
        
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = AppleMusicRequestFactory.appleMusicAPIBaseURLString
        urlComponents.path = AppleMusicRequestFactory.catalogPathURLString + storefront + AppleMusicRequestFactory.catalogSongPathURLStringPart2 + songID
        
        var urlRequest = URLRequest(url: urlComponents.url!)
        urlRequest.httpMethod = "GET"
        urlRequest.addValue("Bearer \(developerToken)", forHTTPHeaderField: "Authorization")
        urlRequest.addValue(userToken, forHTTPHeaderField: "Music-User-Token")
        
        return urlRequest
    }
    
    /// Function for generating "Get Multiple Catalog Songs" URL request
    ///
    /// - Parameters:
    ///   - developerToken: the Apple Music Developer Token required for authentication, fetched by developer from Apple Music server
    ///   - userToken: the Apple Music User Token required for authentication, fetched by user's device when the app runs for the first time
    ///   - storefront: the expected Apple Music storefront for request to happen, usually the same as user's Apple Music account storefront
    ///   - songIDs: an array of catalogIDs for targeted catalog songs
    /// - Returns: the URL request for fetching multiple catalog songs by using their identifiers
    public static func createGetMultipleCatalogSongsRequest(developerToken: String, userToken: String, storefront: String, songIDs: [String]) -> URLRequest {
        
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = AppleMusicRequestFactory.appleMusicAPIBaseURLString
        
        var songIDChunk = songIDs[0]
        for i in 1..<songIDs.count {
            songIDChunk += ","
            songIDChunk += songIDs[i]
        }
        
        urlComponents.path = AppleMusicRequestFactory.catalogPathURLString + storefront + AppleMusicRequestFactory.catalogMultipleSongsPathURLStringPart2
        urlComponents.queryItems = [ URLQueryItem(name: "ids", value: songIDChunk) ]
        
        var urlRequest = URLRequest(url: urlComponents.url!)
        urlRequest.httpMethod = "GET"
        urlRequest.addValue("Bearer \(developerToken)", forHTTPHeaderField: "Authorization")
        urlRequest.addValue(userToken, forHTTPHeaderField: "Music-User-Token")
        
        return urlRequest
    }
    
    /// Function for generating "Get Multiple Catalog Playlists" URL request
    ///
    /// - Parameters:
    ///   - developerToken: the Apple Music Developer Token required for authentication, fetched by developer from Apple Music server
    ///   - userToken: the Apple Music User Token required for authentication, fetched by user's device when the app runs for the first time
    ///   - storefront: the expected Apple Music storefront for request to happen, usually the same as user's Apple Music account storefront
    ///   - playlistsIDs: an array of catalogIDs of targeted playlists
    /// - Returns: the URL request for fetching one or more playlists by using their identifiers
    public static func createGetCatalogPlaylistsRequest(developerToken: String, userToken: String, storefront: String, playlistsIDs: [String]) -> URLRequest {
        
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = AppleMusicRequestFactory.appleMusicAPIBaseURLString
        urlComponents.path = AppleMusicRequestFactory.catalogPathURLString + storefront + "/playlists/"
        
        var playlistsPart = playlistsIDs[0]
        for index in 1..<playlistsIDs.count {
            playlistsPart.append("," + playlistsIDs[index])
        }
        
        urlComponents.queryItems = [ URLQueryItem(name: "ids", value: playlistsPart) ]
        
        var urlRequest = URLRequest(url: urlComponents.url!)
        urlRequest = URLRequest(url: urlComponents.url!)
        urlRequest.httpMethod = "GET"
        urlRequest.addValue("Bearer \(developerToken)", forHTTPHeaderField: "Authorization")
        urlRequest.addValue(userToken, forHTTPHeaderField: "Music-User-Token")
        
        return urlRequest
    }
    
    // FIXME: - search limit & offset need to be handled
    /// Function for generating "Search for Catalog Resources" URL request
    ///
    /// - Parameters:
    ///   - developerToken: the Apple Music Developer Token required for authentication, fetched by developer from Apple Music server
    ///   - storefront: the expected Apple Music storefront for request to happen, usually the same as user's Apple Music account storefront
    ///   - term: the user entered text for search, " " -> "+" character replacement is handled
    /// - Returns: the URL request for searching catalog resources(by using a query) from Apple Music server
    public static func createSearchRequest(developerToken: String, storefront: String, term: String) -> URLRequest {
        
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = AppleMusicRequestFactory.appleMusicAPIBaseURLString
        urlComponents.path = "/v1/catalog/\(storefront)/search"
        
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
        urlRequest.addValue("Bearer \(developerToken)", forHTTPHeaderField: "Authorization")
        
        return urlRequest
    }
    
    /// Function for generating "Get a Storefront" URL request
    ///
    /// - Parameters:
    ///   - developerToken: the Apple Music Developer Token required for authentication, fetched by developer from Apple Music server
    ///   - storefront: the expected Apple Music storefront for request to happen, usually the same as user's Apple Music account storefront
    /// - Returns: the URL request for fetching a storefront by using its identifier)
    public static func createGetStorefrontRequest(developerToken: String, storefront: String) -> URLRequest {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = AppleMusicRequestFactory.appleMusicAPIBaseURLString
        urlComponents.path = "/v1/storefronts/\(storefront)"
        
        var urlRequest = URLRequest(url: urlComponents.url!)
        urlRequest.httpMethod = "GET"
        urlRequest.addValue("Bearer \(developerToken)", forHTTPHeaderField: "Authorization")
        
        return urlRequest
    }
    
    /// Function for generating "Get Recently Played Resources" URL request
    ///
    /// - Parameters:
    ///   - developerToken: the Apple Music Developer Token required for authentication, fetched by developer from Apple Music server
    ///   - userToken: the Apple Music User Token required for authentication, fetched by user's device when the app runs for the first time
    /// - Returns: the URL request for fetching the recently played resources for the user
    public static func createGetRecentlyPlayedRequest(developerToken: String, userToken: String) -> URLRequest {
        
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = AppleMusicRequestFactory.appleMusicAPIBaseURLString
        urlComponents.path = AppleMusicRequestFactory.recentlyPlayedPathURLString
        
        var urlRequest = URLRequest(url: urlComponents.url!)
        urlRequest.httpMethod = "GET"
        urlRequest.addValue("Bearer \(developerToken)", forHTTPHeaderField: "Authorization")
        urlRequest.addValue(userToken, forHTTPHeaderField: "Music-User-Token")
        
        return urlRequest
    }
    
    /// Function for generating "Get a User's Storefront" URL request
    ///
    /// - Parameters:
    ///   - developerToken: the Apple Music Developer Token required for authentication, fetched by developer from Apple Music server
    ///   - userToken: the Apple Music User Token required for authentication, fetched by user's device when the app runs for the first time
    /// - Returns: the URL request for fetching a user’s storefront
    public static func createGetUserStorefrontRequest(developerToken: String, userToken: String) -> URLRequest {
        
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = AppleMusicRequestFactory.appleMusicAPIBaseURLString
        urlComponents.path = AppleMusicRequestFactory.userStorefrontPathURLString
        
        var urlRequest = URLRequest(url: urlComponents.url!)
        urlRequest.httpMethod = "GET"
        urlRequest.addValue("Bearer \(developerToken)", forHTTPHeaderField: "Authorization")
        urlRequest.addValue(userToken, forHTTPHeaderField: "Music-User-Token")
        
        return urlRequest
    }
    
    /// Function for generating "Get All Library Songs" URL request, however⚠️, if songs.count > 100, this function needs to be called several times to completely fetch the whole library
    ///
    /// - Parameters:
    ///   - developerToken: the Apple Music Developer Token required for authentication, fetched by developer from Apple Music server
    ///   - userToken: the Apple Music User Token required for authentication, fetched by user's device when the app runs for the first time
    ///   - offset: the next page or group of objects to fetch (for progressive function calling)
    /// - Returns: the URL request for fetching all the library songs in alphabetical order
    public static func createGetUserLibrarySongsRequest(developerToken: String, userToken: String, offset: String? = "0") -> URLRequest {
        
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = AppleMusicRequestFactory.appleMusicAPIBaseURLString
        urlComponents.path = AppleMusicRequestFactory.userLibrarySongs
        // One-time fetch limitation is manually set to maximum (its default value is 25 and the maximum value is 100)
        urlComponents.queryItems = [ URLQueryItem(name: "limit", value: "100"), URLQueryItem(name: "offset", value: offset) ]
        
        var urlRequest = URLRequest(url: urlComponents.url!)
        urlRequest.httpMethod = "GET"
        urlRequest.addValue("Bearer \(developerToken)", forHTTPHeaderField: "Authorization")
        urlRequest.addValue(userToken, forHTTPHeaderField: "Music-User-Token")
        
        return urlRequest
    }
    
    // FIXME: - however⚠️, if playlists.count > 100 situation needs handling
    /// Function for generating "Get All Library Playlists" URL request
    ///
    /// - Parameters:
    ///   - developerToken: the Apple Music Developer Token required for authentication, fetched by developer from Apple Music server
    ///   - userToken: the Apple Music User Token required for authentication, fetched by user's device when the app runs for the first time
    /// - Returns: the URL request for fetching all the library playlists in alphabetical order
    public static func createGetUserLibraryPlaylistsRequest(developerToken: String, userToken: String) -> URLRequest {
        
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = AppleMusicRequestFactory.appleMusicAPIBaseURLString
        urlComponents.path = AppleMusicRequestFactory.userLibraryPlaylists
        
        var urlRequest = URLRequest(url: urlComponents.url!)
        urlRequest.httpMethod = "GET"
        urlRequest.addValue("Bearer \(developerToken)", forHTTPHeaderField: "Authorization")
        urlRequest.addValue(userToken, forHTTPHeaderField: "Music-User-Token")
        
        return urlRequest
    }
    
    // FIXME: - This function serves to replace createAddPlaylistsToLibraryRequest() & createAddSongsToLibraryRequest() but has NOT been tested yet, may malfuntion or fail to work.
    /// Function for generating "Add a Resource to a Library" URL request
    ///
    /// - Parameters:
    ///   - developerToken: the Apple Music Developer Token required for authentication, fetched by developer from Apple Music server
    ///   - userToken: the Apple Music User Token required for authentication, fetched by user's device when the app runs for the first time
    ///   - playlistsIDs: an array of unique catalog identifiers for targeted playlists
    ///   - albumsIDs: an array of unique catalog identifiers for targeted albums
    ///   - songsIDs: an array of unique catalog identifiers for targeted songs
    ///   - musicVideosIDs: an array of unique catalog identifiers for targeted music videos
    /// - Returns: the URL request for adding catalog resources to a user’s iCloud Music Library
    public static func createAddResourcesToLibraryRequest(developerToken: String, userToken: String, playlistsIDs: [String], albumsIDs: [String], songsIDs: [String], musicVideosIDs: [String]) -> URLRequest {
        
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = AppleMusicRequestFactory.appleMusicAPIBaseURLString
        urlComponents.path = AppleMusicRequestFactory.userLibraryAddition
        
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
        urlRequest.addValue("Bearer \(developerToken)", forHTTPHeaderField: "Authorization")
        urlRequest.addValue(userToken, forHTTPHeaderField: "Music-User-Token")
        
        return urlRequest
    }
    
    // FIXME: - Combination needed: createAddPlaylistsToLibraryRequest() & createAddSongsToLibraryRequest() are all belong to "Add a Resource to a Library"
    // https://developer.apple.com/documentation/applemusicapi/add_a_resource_to_a_library
    public static func createAddPlaylistsToLibraryRequest(developerToken: String, userToken: String, playlistsIDs: [String]) -> URLRequest {

        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = AppleMusicRequestFactory.appleMusicAPIBaseURLString
        urlComponents.path = AppleMusicRequestFactory.userLibraryAddition
        
        // stack playlistsIDs together
        var urlQueryItems: [URLQueryItem] = []
        for index in 0..<playlistsIDs.count {
            urlQueryItems.append(URLQueryItem(name: "ids[playlists]", value: playlistsIDs[index]))
        }
        // add listed IDs into url
        urlComponents.queryItems = urlQueryItems
        
        var urlRequest = URLRequest(url: urlComponents.url!)
        urlRequest = URLRequest(url: urlComponents.url!)
        urlRequest.httpMethod = "POST"
        urlRequest.addValue("Bearer \(developerToken)", forHTTPHeaderField: "Authorization")
        urlRequest.addValue(userToken, forHTTPHeaderField: "Music-User-Token")
        
        return urlRequest
    }
    
    public static func createAddSongsToLibraryRequest(developerToken: String, userToken: String, songsIDs: [String]) -> URLRequest {
        
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = AppleMusicRequestFactory.appleMusicAPIBaseURLString
        urlComponents.path = AppleMusicRequestFactory.userLibraryAddition
        
        // stack IDs together
        var urlQueryItems: [URLQueryItem] = []
        for index in 0..<songsIDs.count {
            urlQueryItems.append(URLQueryItem(name: "ids[songs]", value: songsIDs[index]))
        }
        // add listed IDs into url
        urlComponents.queryItems = urlQueryItems
        
        var urlRequest = URLRequest(url: urlComponents.url!)
        urlRequest = URLRequest(url: urlComponents.url!)
        urlRequest.httpMethod = "POST"
        urlRequest.addValue("Bearer \(developerToken)", forHTTPHeaderField: "Authorization")
        urlRequest.addValue(userToken, forHTTPHeaderField: "Music-User-Token")
        
        return urlRequest
    }
    
    // FIXME: -  This function has NOT been tested yet, may malfuntion or fail to work
    /// Function for generating "Add Tracks to a Library Playlist" URL request
    ///
    /// - Parameters:
    ///   - developerToken: the Apple Music Developer Token required for authentication, fetched by developer from Apple Music server
    ///   - userToken: the Apple Music User Token required for authentication, fetched by user's device when the app runs for the first time
    ///   - playlistID: the globalID of destination playlist to be added tracks to
    ///   - songIDs: an array of the catalogIDs of targeted songs
    /// - Returns: the URL request for adding new tracks to the end of a library playlist
    public static func createAddSongsToPlaylistRequest(developerToken: String, userToken: String, playlistID: String, songsIDs: [String]) -> URLRequest {
        
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = AppleMusicRequestFactory.appleMusicAPIBaseURLString
        urlComponents.path = AppleMusicRequestFactory.userLibraryPlaylists + "/" + playlistID + "/tracks"
        
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
        urlRequest.addValue("Bearer \(developerToken)", forHTTPHeaderField: "Authorization")
        urlRequest.addValue(userToken, forHTTPHeaderField: "Music-User-Token")
        
        return urlRequest
    }
    
    
    
}
