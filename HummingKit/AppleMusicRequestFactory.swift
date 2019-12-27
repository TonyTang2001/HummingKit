//
//  AppleMusicRequestFactory.swift
//  HummingKit
//
//  Created by 唐子轩 on 2019/9/3.
//  Copyright © 2019 TonyTang. All rights reserved.
//

import Foundation
import SwiftyJSON

public struct AppleMusicRequestFactory {
    
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
    var developerToken: String
    
    /// User Token fetched by device when app runs for the first time, required for authentication
    var userToken: String
    
    init(developerToken: String, userToken: String) {
        self.developerToken = developerToken
        self.userToken = userToken
    }
    
    /// Function for generating "Get A Catalog Song" URL request
    ///
    /// - Parameters:
    ///   - songID: catalogID for the targeted catalog song
    /// - Returns: the URL request for fetching the catalog song by using its identifier
    public func createGetCatalogSongRequest(storefront: String, songID: String) -> URLRequest {
        
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = appleMusicAPIBaseURLString
        urlComponents.path = catalogPathURLString + storefront + catalogSongPathURLString + "/" + songID
        
        var urlRequest = URLRequest(url: urlComponents.url!)
        urlRequest.httpMethod = "GET"
        urlRequest.addValue("Bearer \(developerToken)", forHTTPHeaderField: "Authorization")
        urlRequest.addValue(userToken, forHTTPHeaderField: "Music-User-Token")
        
        return urlRequest
    }
    
    /// Function for generating "Get Multiple Catalog Songs" URL request
    ///
    /// - Parameters:
    ///   - storefront: the expected Apple Music storefront for request to happen, usually the same as user's Apple Music account storefront
    ///   - songIDs: an array of catalogIDs for targeted catalog songs
    /// - Returns: the URL request for fetching multiple catalog songs by using their identifiers
    public func createGetMultipleCatalogSongsRequest(storefront: String, songIDs: [String]) -> URLRequest {
        
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = appleMusicAPIBaseURLString
        
        var songIDChunk = songIDs[0]
        for i in 1..<songIDs.count {
            songIDChunk += ","
            songIDChunk += songIDs[i]
        }
        
        urlComponents.path = catalogPathURLString + storefront + catalogSongPathURLString
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
    ///   - storefront: the expected Apple Music storefront for request to happen, usually the same as user's Apple Music account storefront
    ///   - playlistsIDs: an array of catalogIDs of targeted playlists
    /// - Returns: the URL request for fetching one or more playlists by using their identifiers
    public func createGetCatalogPlaylistsRequest(storefront: String, playlistsIDs: [String]) -> URLRequest {
        
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = appleMusicAPIBaseURLString
        urlComponents.path = catalogPathURLString + storefront + "/playlists/"
        
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
    ///   - storefront: the expected Apple Music storefront for request to happen, usually the same as user's Apple Music account storefront
    ///   - term: the user entered text for search, " " -> "+" character replacement is handled
    /// - Returns: the URL request for searching catalog resources(by using a query) from Apple Music server
    public func createSearchRequest(storefront: String, term: String) -> URLRequest {
        
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = appleMusicAPIBaseURLString
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
        urlRequest.addValue("Bearer \(developerToken)", forHTTPHeaderField: "Authorization")
        
        return urlRequest
    }
    
    /// Function for generating "Get a Storefront" URL request
    ///
    /// - Parameters:
    ///   - storefront: the expected Apple Music storefront for request to happen, usually the same as user's Apple Music account storefront
    /// - Returns: the URL request for fetching a storefront by using its identifier)
    public func createGetStorefrontRequest(storefront: String) -> URLRequest {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = appleMusicAPIBaseURLString
        urlComponents.path = "/v1/storefronts/\(storefront)"
        
        var urlRequest = URLRequest(url: urlComponents.url!)
        urlRequest.httpMethod = "GET"
        urlRequest.addValue("Bearer \(developerToken)", forHTTPHeaderField: "Authorization")
        
        return urlRequest
    }
    
    /// Function for generating "Get Recently Played Resources" URL request
    ///
    /// - Returns: the URL request for fetching the recently played resources for the user
    public func createGetRecentlyPlayedRequest() -> URLRequest {
        
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = appleMusicAPIBaseURLString
        urlComponents.path = recentlyPlayedPathURLString
        
        var urlRequest = URLRequest(url: urlComponents.url!)
        urlRequest.httpMethod = "GET"
        urlRequest.addValue("Bearer \(developerToken)", forHTTPHeaderField: "Authorization")
        urlRequest.addValue(userToken, forHTTPHeaderField: "Music-User-Token")
        
        return urlRequest
    }
    
    /// Function for generating "Get a User's Storefront" URL request
    ///
    /// - Returns: the URL request for fetching a user’s storefront
    public func createGetUserStorefrontRequest() -> URLRequest {
        
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = appleMusicAPIBaseURLString
        urlComponents.path = userStorefrontPathURLString
        
        var urlRequest = URLRequest(url: urlComponents.url!)
        urlRequest.httpMethod = "GET"
        urlRequest.addValue("Bearer \(developerToken)", forHTTPHeaderField: "Authorization")
        urlRequest.addValue(userToken, forHTTPHeaderField: "Music-User-Token")
        
        return urlRequest
    }
    
    /// Function for generating "Get All Library Songs" URL request, however, if songs.count > 100, this function needs to be called several times to completely fetch the whole library
    ///
    /// - Parameters:
    ///   - offset: the next page or group of objects to fetch (for progressive function calling)
    /// - Returns: the URL request for fetching all the library songs in alphabetical order
    public func createGetUserLibrarySongsRequest(offset: String? = "0") -> URLRequest {
        
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = appleMusicAPIBaseURLString
        urlComponents.path = userLibraryPathURLString + catalogSongPathURLString
        // One-time fetch limitation is manually set to maximum (its default value is 25 and the maximum value is 100)
        urlComponents.queryItems = [ URLQueryItem(name: "limit", value: "100"), URLQueryItem(name: "offset", value: offset) ]
        
        var urlRequest = URLRequest(url: urlComponents.url!)
        urlRequest.httpMethod = "GET"
        urlRequest.addValue("Bearer \(developerToken)", forHTTPHeaderField: "Authorization")
        urlRequest.addValue(userToken, forHTTPHeaderField: "Music-User-Token")
        
        return urlRequest
    }
    
    /// Function for generating "Get All Library Playlists" URL request, however, if playlists.count > 100, this function needs to be called several times to completely fetch the whole library
    ///
    /// - Parameters:
    ///   - offset: the next page or group of objects to fetch (for progressive function calling)
    /// - Returns: the URL request for fetching all the library playlists in alphabetical order
    public func createGetUserLibraryPlaylistsRequest(offset: String? = "0") -> URLRequest {
        
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = appleMusicAPIBaseURLString
        urlComponents.path = userLibraryPathURLString + catalogPlaylistPathURLString
        // One-time fetch limitation is manually set to maximum (its default value is 25 and the maximum value is 100)
        urlComponents.queryItems = [ URLQueryItem(name: "limit", value: "100"), URLQueryItem(name: "offset", value: offset) ]
        
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
    ///   - playlistsIDs: an array of unique catalog identifiers for targeted playlists
    ///   - albumsIDs: an array of unique catalog identifiers for targeted albums
    ///   - songsIDs: an array of unique catalog identifiers for targeted songs
    ///   - musicVideosIDs: an array of unique catalog identifiers for targeted music videos
    /// - Returns: the URL request for adding catalog resources to a user’s iCloud Music Library
    public func createAddResourcesToLibraryRequest(playlistsIDs: [String], albumsIDs: [String], songsIDs: [String], musicVideosIDs: [String]) -> URLRequest {
        
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = appleMusicAPIBaseURLString
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
        urlRequest.addValue("Bearer \(developerToken)", forHTTPHeaderField: "Authorization")
        urlRequest.addValue(userToken, forHTTPHeaderField: "Music-User-Token")
        
        return urlRequest
    }
    
    // FIXME: - Combination needed: createAddPlaylistsToLibraryRequest() & createAddSongsToLibraryRequest() are all belong to "Add a Resource to a Library"
    // https://developer.apple.com/documentation/applemusicapi/add_a_resource_to_a_library
    @available(*, deprecated, message: "Use createAddResourcesToLibraryRequest() function instead.")
    public func createAddPlaylistsToLibraryRequest(playlistsIDs: [String]) -> URLRequest {

        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = appleMusicAPIBaseURLString
        urlComponents.path = userLibraryPathURLString
        
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
    
    @available(*, deprecated, message: "Use createAddResourcesToLibraryRequest() function instead.")
    public func createAddSongsToLibraryRequest(songsIDs: [String]) -> URLRequest {
        
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = appleMusicAPIBaseURLString
        urlComponents.path = userLibraryPathURLString
        
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
    ///   - playlistID: the globalID of destination playlist to be added tracks to
    ///   - songIDs: an array of the catalogIDs of targeted songs
    /// - Returns: the URL request for adding new tracks to the end of a library playlist
    public func createAddSongsToPlaylistRequest(playlistID: String, songsIDs: [String]) -> URLRequest {
        
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = appleMusicAPIBaseURLString
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
        urlRequest.addValue("Bearer \(developerToken)", forHTTPHeaderField: "Authorization")
        urlRequest.addValue(userToken, forHTTPHeaderField: "Music-User-Token")
        
        return urlRequest
    }
    
    // FIXME: - This function has NOT been tested yet, may malfuntion or fail to work
    /// Function for generating "Create a New Library Playlist" URL request
    ///
    /// - Parameters:
    ///   - name: the name of playlist to be created
    ///   - description: the description of the playlist to be created
    ///   - songsIDs: an array of catalogIDs of songs need to be added to the to-be-created playlist
    /// - Returns: the URL request for creating a new playlist in user’s library
    public func createCreateNewPlaylistRequest(name: String, description: String, songsIDs: [String]) -> URLRequest {
        
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = appleMusicAPIBaseURLString
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
        urlRequest.addValue("Bearer \(developerToken)", forHTTPHeaderField: "Authorization")
        urlRequest.addValue(userToken, forHTTPHeaderField: "Music-User-Token")
        
        return urlRequest
    }
    
    
}
