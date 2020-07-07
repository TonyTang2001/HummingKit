//
//  DataModel.swift
//  HummingKit
//
//  Created by Tony Tang on 3/7/20.
//  Copyright © 2020 TonyTang. All rights reserved.
//

import Foundation
import SwiftyJSON

public typealias DeveloperToken = String
public typealias UserToken = String

public typealias SongID = String
public typealias ArtistID = String
public typealias Relationship = String
public typealias StorefrontID = String
public typealias AlbumID = String

public enum FetchingStatus {
    case preparingForStart
    case continuing
    case finished
    case finishedWithError
}

// MARK: - Storefronts
public struct Storefront: Hashable, Codable, Identifiable {
    public static func == (lhs: Storefront, rhs: Storefront) -> Bool {
        if lhs.id == rhs.id {
            return true
        } else {
            return false
        }
    }
    
    public let id:   String
    public let href: String
    public let type: String
    public let attributes: Attributes
}

public extension Storefront {
    struct Attributes: Hashable, Codable {
        public let name:                   String
        public let defaultLanguageTag:     String
        public let supportedLanguageTags: [String]
        
        public init?(_ attributesData: JSON) {
            guard let name = attributesData["name"].string,
                  let defaultLanguageTag = attributesData["defaultLanguageTag"].string,
                  let supportedLanguageTagsJSONArray = attributesData["supportedLanguageTags"].array
            else { return nil }
            
            var supportedLanguageTags: [String] = []
            supportedLanguageTagsJSONArray.forEach { upportedLanguageTagJSON in
                if let upportedLanguageTag = upportedLanguageTagJSON.string {
                    supportedLanguageTags.append(upportedLanguageTag)
                }
            }
            
            self.name = name
            self.defaultLanguageTag = defaultLanguageTag
            self.supportedLanguageTags = supportedLanguageTags
        }
    }
    
    init?(storefrontData: JSON) {
        guard let id = storefrontData["id"].string, let href = storefrontData["href"].string, let type = storefrontData["type"].string
            else { return nil }
        guard let attributes = Attributes(storefrontData["attributes"])
            else { return nil }
        
        self.id = id
        self.href = href
        self.type = type
        self.attributes = attributes
    }
}


// MARK: - Song
// MARK: CatalogSong
public struct CatalogSong: Hashable, Codable, Identifiable {
    public static func == (lhs: CatalogSong, rhs: CatalogSong) -> Bool {
        if lhs.id == rhs.id {
            return true
        } else {
            return false
        }
    }
    
    public let id:   String
    public let href: String
    public let type: String
//    public var artwork: Artwork? { return attributes.artwork }
    
    public let attributes: Attributes
    public let relationships: ResourceRelationship
}

public extension CatalogSong {
    struct Attributes: Hashable, Codable {
        public let albumName:        String
        public let artistName:       String
        public let artwork:          Artwork
        public let composerName:     String
        public let discNumber:       Int
        public let durationInMillis: Int
        public let genreNames:      [String]
        public let isrc:             String
        public let name:             String
        public let previews:        [Preview]
        public let releaseDate:      String
        public let trackNumber:      Int
        public let url:              String
        
        public init?(_ attributesData: JSON) {
            guard let albumName = attributesData["albumName"].string,
                  let artistName = attributesData["artistName"].string,
                  let artwork = Artwork(attributesData["artwork"]),
                  let composerName = attributesData["composerName"].string,
                  let discNumber = attributesData["discNumber"].int,
                  let durationInMillis = attributesData["durationInMillis"].int,
                  let genreNamesJSONArray = attributesData["genreNames"].array,
                  let isrc = attributesData["isrc"].string,
                  let name = attributesData["name"].string,
                  let previewsJSONArray = attributesData["previews"].array,
                  let releaseDate = attributesData["releaseDate"].string,
                  let trackNumber = attributesData["trackNumber"].int,
                  let url = attributesData["url"].string
            else { return nil }
            
            // convert genreNamesJSON array to genreNames array containing String
            var genreNames: [String] = []
            genreNamesJSONArray.forEach { genreNameJSON in
                if let genreName = genreNameJSON.string {
                    genreNames.append(genreName)
                }
            }
            
            // convert previewsJSON array to previews array containing Preview objects
            var previews: [Preview] = []
            previewsJSONArray.forEach { previewJSON in
                if let preview = Preview(previewJSON) {
                    previews.append(preview)
                }
            }
            
            self.albumName = albumName
            self.artistName = artistName
            self.artwork = artwork
            self.composerName = composerName
            self.discNumber = discNumber
            self.durationInMillis = durationInMillis
            self.genreNames = genreNames
            self.isrc = isrc
            self.name = name
            self.previews = previews
            self.releaseDate = releaseDate
            self.trackNumber = trackNumber
            self.url = url
        }
    }
    
    init?(songData: JSON) {
        guard let id = songData["id"].string, let href = songData["href"].string, let type = songData["type"].string
            else { return nil }
        guard let attributes = Attributes(songData["attributes"])
            else { return nil }
        
        self.id = id
        self.href = href
        self.type = type
        self.attributes = attributes
        
        self.relationships = ResourceRelationship(songData["relationships"])
    }
}

// MARK: LibrarySong
public struct LibrarySong: Hashable, Codable, Identifiable {
    public static func == (lhs: LibrarySong, rhs: LibrarySong) -> Bool {
        if lhs.id == rhs.id {
            return true
        } else {
            return false
        }
    }
    
    public let id:   String
    public let href: String
    public let type: String
    
    public let attributes: Attributes
}

public extension LibrarySong {
    struct Attributes: Hashable, Codable {
        public let albumName:   String
        public let artistName:  String
        public let artwork:     Artwork
        public let name:        String
        public let trackNumber: Int
        
        public init?(_ attributesData: JSON) {
            guard let albumName = attributesData["albumName"].string,
                  let artistName = attributesData["artistName"].string,
                  let artwork = Artwork(attributesData["artwork"]),
                  let name = attributesData["name"].string,
                  let trackNumber = attributesData["trackNumber"].int
            else { return nil }
            
            self.albumName = albumName
            self.artistName = artistName
            self.artwork = artwork
            self.name = name
            self.trackNumber = trackNumber
        }
    }
    
    init?(songData: JSON) {
        guard let id = songData["id"].string, let href = songData["href"].string, let type = songData["type"].string
            else { return nil }
        guard let attributes = Attributes(songData["attributes"])
            else { return nil }
        
        self.id = id
        self.href = href
        self.type = type
        self.attributes = attributes
    }
}


// MARK: - Album
// MARK: CatalogAlbum
public struct CatalogAlbum: Hashable, Codable, Identifiable {
    public let id:   String
    public let href: String
    public let type: String
    
    public let attributes:    Attributes
    public let relationships: ResourceRelationship
}

public extension CatalogAlbum {
    struct Attributes: Hashable, Codable {
        public let artistName:          String
        public let artwork:             Artwork
        public let copyright:           String
        public let editorialNotes:      EditorialNotes
        public let genreNames:         [String]
        public let isComplete:          Bool
        public let isMasteredForItunes: Bool
        public let isSingle:            Bool
        public let name:                String
        public let recordLabel:         String
        public let releaseDate:         String
        public let trackCount:          Int
        public let url:                 String
        
        public init?(attributesData: JSON) {
            guard let artistName = attributesData["artistName"].string,
                  let artwork = Artwork(attributesData["artwork"]),
                  let copyright = attributesData["copyright"].string,
                  let editorialNotes = EditorialNotes(attributesData["editorialNotes"]),
                  let genreNamesJSONArray = attributesData["genreNames"].array,
                  let isComplete = attributesData["isComplete"].bool,
                  let isMasteredForItunes = attributesData["isMasteredForItunes"].bool,
                  let isSingle = attributesData["isSingle"].bool,
                  let name = attributesData["name"].string,
                  let recordLabel = attributesData["recordLabel"].string,
                  let releaseDate = attributesData["releaseDate"].string,
                  let trackCount = attributesData["trackCount"].int,
                  let url = attributesData["url"].string
            else { return nil }
            
            // convert genreNamesJSON array to genreNames array containing String
            var genreNames: [String] = []
            genreNamesJSONArray.forEach { genreNameJSON in
                if let genreName = genreNameJSON.string {
                    genreNames.append(genreName)
                }
            }
            
            self.artistName = artistName
            self.artwork = artwork
            self.copyright = copyright
            self.editorialNotes = editorialNotes
            self.genreNames = genreNames
            self.isComplete = isComplete
            self.isMasteredForItunes = isMasteredForItunes
            self.isSingle = isSingle
            self.name = name
            self.recordLabel = recordLabel
            self.releaseDate = releaseDate
            self.trackCount = trackCount
            self.url = url
        }
    }
    
    init?(albumData: JSON) {
        guard let id = albumData["id"].string, let href = albumData["href"].string, let type = albumData["type"].string
            else { return nil }
        guard let attributes = Attributes(attributesData: albumData["attributes"])
            else { return nil }
        
        self.id = id
        self.href = href
        self.type = type
        self.attributes = attributes
        
        self.relationships = ResourceRelationship(albumData["relationships"])
    }
}

// MARK: LibraryAlbum
public struct LibraryAlbum: Hashable, Codable, Identifiable {
    public let id:   String
    public let href: String
    public let type: String
    
    public let attributes: Attributes
    public let relationships: ResourceRelationship
}

public extension LibraryAlbum {
    struct Attributes: Hashable, Codable {
        public let artistName: String
        public let artwork:    Artwork
        public let name:       String
        public let trackCount: Int
        
        public init?(_ attributesData: JSON) {
            guard let artistName = attributesData["artistName"].string,
                  let artwork = Artwork(attributesData["artwork"]),
                  let name = attributesData["name"].string,
                  let trackCount = attributesData["trackCount"].int
            else { return nil }
            
            self.artistName = artistName
            self.artwork = artwork
            self.name = name
            self.trackCount = trackCount
        }
    }
    
    init?(albumData: JSON) {
        guard let id = albumData["id"].string, let href = albumData["href"].string, let type = albumData["type"].string
            else { return nil }
        guard let attributes = Attributes(albumData["attributes"])
            else { return nil }
        
        self.id = id
        self.href = href
        self.type = type
        self.attributes = attributes
        
        self.relationships = ResourceRelationship(albumData["relationships"])
    }
}


// MARK: - Artist
// MARK: CatalogArtist
public struct CatalogArtist: Hashable, Codable, Identifiable {
    public let id:   String
    public let href: String
    public let type: String
    
    public let attributes: Attributes
    public let relationships: ResourceRelationship
}

public extension CatalogArtist {
    struct Attributes: Hashable, Codable {
        public let genreNames: [String]
        public let name:        String
        public let url:         String
        
        public init?(_ attributesData: JSON) {
            guard let genreNamesJSONArray = attributesData["genreNames"].array,
                  let name = attributesData["name"].string,
                  let url = attributesData["url"].string
            else { return nil }
            
            // convert genreNamesJSON array to genreNames array containing String
            var genreNames: [String] = []
            genreNamesJSONArray.forEach { genreNameJSON in
                if let genreName = genreNameJSON.string {
                    genreNames.append(genreName)
                }
            }
            
            self.genreNames = genreNames
            self.name = name
            self.url = url
        }
    }
    
    init?(artistData: JSON) {
        guard let id = artistData["id"].string, let href = artistData["href"].string, let type = artistData["type"].string
            else { return nil }
        guard let attributes = Attributes(artistData["attributes"])
            else { return nil }
        
        self.id = id
        self.href = href
        self.type = type
        self.attributes = attributes
        
        self.relationships = ResourceRelationship(artistData["relationships"])
    }
}

// MARK: LibraryArtist
public struct LibraryArtist: Hashable, Codable, Identifiable {
    public let id:   String
    public let href: String
    public let type: String
    
    public let attributes: Attributes
}

public extension LibraryArtist {
    struct Attributes: Hashable, Codable {
        public let name: String
        
        public init?(_ attributesData: JSON) {
            guard let name = attributesData["name"].string else { return nil }
            self.name = name
        }
    }
    
    init?(artistData: JSON) {
        guard let id = artistData["id"].string, let href = artistData["href"].string, let type = artistData["type"].string
            else { return nil }
        guard let attributes = Attributes(artistData["attributes"])
            else { return nil }
        
        self.id = id
        self.href = href
        self.type = type
        self.attributes = attributes
    }
}


// MARK: - Playlist
// MARK: CatalogPlaylist
public struct CatalogPlaylist: Hashable, Codable, Identifiable {
    public let id:   String
    public let href: String
    public let type: String
    
    public let attributes: Attributes
    public let relationships: ResourceRelationship
}

public extension CatalogPlaylist {
    struct Attributes: Hashable, Codable {
        public let artwork:          Artwork
        public let curatorName:      String
        public let description:      EditorialNotes
        public let lastModifiedDate: String
        public let name:             String
        public let playlistType:     String
        public let url:              String
        
        init?(_ attributesData: JSON) {
            guard let artwork = Artwork(attributesData["artwork"]),
                  let curatorName = attributesData["curatorName"].string,
                  let description = EditorialNotes(attributesData["description"]),
                  let lastModifiedDate = attributesData["lastModifiedDate"].string,
                  let name = attributesData["name"].string,
                  let playlistType = attributesData["playlistType"].string,
                  let url = attributesData["url"].string
            else { return nil }
            
            self.artwork = artwork
            self.curatorName = curatorName
            self.description = description
            self.lastModifiedDate = lastModifiedDate
            self.name = name
            self.playlistType = playlistType
            self.url = url
        }
    }
    
    init?(playlistData: JSON) {
        guard let id = playlistData["id"].string, let href = playlistData["href"].string, let type = playlistData["type"].string
            else { return nil }
        guard let attributes = Attributes(playlistData["attributes"])
            else { return nil }
        
        self.id = id
        self.href = href
        self.type = type
        self.attributes = attributes
        
        self.relationships = ResourceRelationship(playlistData["relationships"])
    }
}

// MARK: LibraryPlaylist
public struct LibraryPlaylist: Hashable, Codable, Identifiable {
    public let id:   String
    public let href: String
    public let type: String
    
    public let attributes: Attributes
}

public extension LibraryPlaylist {
    struct Attributes: Hashable, Codable {
        public let canEdit:     Bool
        public let description: EditorialNotes
        public let name:        String
        
        public init?(_ attributesData: JSON) {
            guard let canEdit = attributesData["canEdit"].bool,
                  let description = EditorialNotes(attributesData["description"]),
                  let name = attributesData["name"].string
            else { return nil }
            
            self.canEdit = canEdit
            self.description = description
            self.name = name
        }
    }
    
    init?(playlistData: JSON) {
        guard let id = playlistData["id"].string, let href = playlistData["href"].string, let type = playlistData["type"].string
            else { return nil }
        guard let attributes = Attributes(playlistData["attributes"])
            else { return nil }
        
        self.id = id
        self.href = href
        self.type = type
        self.attributes = attributes
    }
}


// MARK: - Music Videos
// MARK: Catalog Music Videos
public struct CatalogMV: Hashable, Codable, Identifiable {
    public let id:   String
    public let href: String
    public let type: String
    
    public let attributes: Attributes
    public let relationships: ResourceRelationship
}

public extension CatalogMV {
    struct Attributes: Hashable, Codable {
        public let albumName:   String
        public let artistName:  String
        public let artwork:     Artwork
        public let genreNames: [String]
        public let has4K:       Bool
        public let hasHDR:      Bool
        public let isrc:        String
        public let name:        String
        public let previews:   [Preview]
        public let releaseDate: String
        public let trackNumber: Int
        public let url:         String
        
        init?(_ attributesData: JSON) {
            guard let albumName = attributesData["albumName"].string,
                  let artistName = attributesData["artistName"].string,
                  let artwork = Artwork(attributesData["artwork"]),
                  let genreNamesJSONArray = attributesData["genreNames"].array,
                  let has4K = attributesData["has4K"].bool,
                  let hasHDR = attributesData["hasHDR"].bool,
                  let isrc = attributesData["isrc"].string,
                  let name = attributesData["name"].string,
                  let previewsJSONArray = attributesData["previews"].array,
                  let releaseDate = attributesData["releaseDate"].string,
                  let trackNumber = attributesData["trackNumber"].int,
                  let url = attributesData["url"].string
            else { return nil }
            
            // convert genreNamesJSON array to genreNames array containing String
            var genreNames: [String] = []
            genreNamesJSONArray.forEach { genreNameJSON in
                if let genreName = genreNameJSON.string {
                    genreNames.append(genreName)
                }
            }
            
            // convert previewsJSON array to previews array containing Preview objects
            var previews: [Preview] = []
            previewsJSONArray.forEach { previewJSON in
                if let preview = Preview(previewJSON) {
                    previews.append(preview)
                }
            }
            
            self.albumName = albumName
            self.artistName = artistName
            self.artwork = artwork
            self.genreNames = genreNames
            self.has4K = has4K
            self.hasHDR = hasHDR
            self.isrc = isrc
            self.name = name
            self.previews = previews
            self.releaseDate = releaseDate
            self.trackNumber = trackNumber
            self.url = url
        }
    }
    
    init?(mvData: JSON) {
        guard let id = mvData["id"].string, let href = mvData["href"].string, let type = mvData["type"].string
            else { return nil }
        guard let attributes = Attributes(mvData["attributes"])
            else { return nil }
        
        self.id = id
        self.href = href
        self.type = type
        self.attributes = attributes
        
        self.relationships = ResourceRelationship(mvData["relationships"])
    }
}

// MARK: Library Music Videos
public struct LibraryMV: Hashable, Codable, Identifiable {
    public let id:   String
    public let href: String
    public let type: String
    
    public let attributes: Attributes
}

public extension LibraryMV {
    struct Attributes: Hashable, Codable {
        public let albumName:     String
        public let artistName:    String
        public let artwork:       Artwork
        public let contentRating: String
        public let name:          String
        public let trackNumber:   Int
        
        public init?(_ attributesData: JSON) {
            guard let albumName = attributesData["albumName"].string,
                  let artistName = attributesData["artistName"].string,
                  let artwork = Artwork(attributesData["artwork"]),
                  let name = attributesData["name"].string,
                  let contentRating = attributesData["contentRating"].string,
                  let trackNumber = attributesData["trackNumber"].int
            else { return nil }
            
            self.albumName = albumName
            self.artistName = artistName
            self.artwork = artwork
            self.contentRating = contentRating
            self.name = name
            self.trackNumber = trackNumber
        }
    }
    
    init?(mvData: JSON) {
        guard let id = mvData["id"].string, let href = mvData["href"].string, let type = mvData["type"].string
            else { return nil }
        guard let attributes = Attributes(mvData["attributes"])
            else { return nil }
        
        self.id = id
        self.href = href
        self.type = type
        self.attributes = attributes
    }
}


// MARK: - Catalog Station
public struct CatalogStation: Hashable, Codable, Identifiable {
    public let id:   String
    public let href: String
    public let type: String
    
    public let attributes: Attributes
}

public extension CatalogStation {
    struct Attributes: Hashable, Codable {
        public let artwork:        Artwork
        public let editorialNotes: EditorialNotes
        public let isLive:         Bool
        public let name:           String
        public let url:            String
        
        public init?(_ attributesData: JSON) {
            guard let artwork = Artwork(attributesData["artwork"]),
                  let editorialNotes = EditorialNotes(attributesData["editorialNotes"]),
                  let isLive = attributesData["isLive"].bool,
                  let name = attributesData["name"].string,
                  let url = attributesData["url"].string
            else { return nil }
            
            self.artwork = artwork
            self.editorialNotes = editorialNotes
            self.isLive = isLive
            self.name = name
            self.url = url
        }
    }
    
    init?(stationData: JSON) {
        guard let id = stationData["id"].string, let href = stationData["href"].string, let type = stationData["type"].string
            else { return nil }
        guard let attributes = Attributes(stationData["attributes"])
            else { return nil }
        
        self.id = id
        self.href = href
        self.type = type
        self.attributes = attributes
    }
}



public struct ResourceRelationship: Hashable, Codable {
    public let content: JSON
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(content.string)
    }
    
    public init(_ content: JSON) {
        self.content = content
    }
}

public struct Resource: Hashable, Codable, Identifiable {
    public let id:   String    // Persistent identifier of the resource.
    public let href: String    // A URL subpath that fetches the resource as the primary object.
    public let type: String    // The type of resource.
}

public struct Artwork: Hashable, Codable {
    public let height: Int     // The maximum height available for the image.
    public let width:  Int     // The maximum width available for the image.
    public let url:    String  // The URL to request the image asset. The image filename must be preceded by {w}x{h}, as placeholders for the width and height values as described above (for example, {w}x{h}bb.jpeg).
    
    public var bgColor:    String? // The average background color of the image.
    public var textColor1: String? // The primary text color that may be used if the background color is displayed.
    public var textColor2: String? // The secondary text color that may be used if the background color is displayed.
    public var textColor3: String? // The tertiary text color that may be used if the background color is displayed.
    public var textColor4: String? // The final post-tertiary text color that may be used if the background color is displayed.
    
    public init?(_ artworkData: JSON) {
        guard let height = artworkData["height"].int, let width = artworkData["width"].int, let url = artworkData["url"].string
            else { return nil }
        
        if let bgColor = artworkData["bgColor"].string, let textColor1 = artworkData["textColor1"].string, let textColor2 = artworkData["textColor2"].string, let textColor3 = artworkData["textColor3"].string, let textColor4 = artworkData["textColor4"].string {
            
            self.bgColor = bgColor
            self.textColor1 = textColor1
            self.textColor2 = textColor2
            self.textColor3 = textColor3
            self.textColor4 = textColor4
        }
        
        self.height = height
        self.width = width
        self.url = url
        
    }
}

public struct Preview: Hashable, Codable {
    public let url:     String     // The preview URL for the content.
    public var artwork: Artwork?   // The preview artwork for the associated preview music video.
    
    public init?(_ previewData: JSON) {
        guard let url = previewData["url"].string else { return nil }
        self.url = url
        
        self.artwork = Artwork(previewData["artwork"])
    }
}

/// An object that represents notes.
public struct EditorialNotes: Hashable, Codable {
    // Notes may include XML tags for formatting (<b> for bold, <i> for italic, or <br> for line break) and special characters (&amp; for &, &lt; for <, &gt; for >, &apos; for ‘, and &quot; for “).
    public var short:    String?   // Notes shown when the content is prominently displayed.
    public let standard: String    // Abbreviated notes shown inline or when the content is shown alongside other content.
    
    public init?(_ editorialNotesData: JSON) {
        guard let standard = editorialNotesData["standard"].string
            else { return nil }
        
        if let short = editorialNotesData["short"].string {
            self.short = short
        }
        
        self.standard = standard
    }
}
