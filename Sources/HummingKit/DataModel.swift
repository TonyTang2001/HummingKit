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

// MARK: - Song
// MARK: CatalogSong
public struct CatalogSong {
    let id: String
    let href: String
    let type: String
    
    let attributes: Attributes
    let relationships: JSON
}

public extension CatalogSong {
    struct Attributes {
        let albumName:         String
        let artistName:        String
        let artwork:           Artwork
        let composerName:      String
        let discNumber:        Int
        let durationInMillis:  Int
        let genreNames:        [String]
        let isrc:              String
        let name:              String
        let previews:          [Preview]
        let releaseDate:       String
        let trackNumber:       Int
        let url:               String
        
        init?(_ attributesData: JSON) {
            guard let albumName = attributesData["albumName"].string,
                  let artistName = attributesData["artistName"].string,
                  let artwork = Artwork(attributesData["artwork"]),
                  let composerName = attributesData["composerName"].string,
                  let discNumber = attributesData["discNumber"].int,
                  let durationInMillis = attributesData["durationInMillis"].int,
                  let genreNamesJSON = attributesData["genreNames"].array,
                  let isrc = attributesData["isrc"].string,
                  let name = attributesData["name"].string,
                  let previewsJSON = attributesData["previews"].array,
                  let releaseDate = attributesData["releaseDate"].string,
                  let trackNumber = attributesData["trackNumber"].int,
                  let url = attributesData["url"].string
            else { return nil }
            
            // convert genreNamesJSON array to genreNames array containing String
            var genreNames: [String] = []
            genreNamesJSON.forEach { genreNameJSON in
                if let genreName = genreNameJSON.string {
                    genreNames.append(genreName)
                }
            }
            
            // convert previewsJSON array to previews array containing Preview objects
            var previews: [Preview] = []
            previewsJSON.forEach { previewJSON in
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
        
        self.relationships = songData["relationships"]
    }
}

// MARK: LibrarySong
public struct LibrarySong {
    let id: String
    let href: String
    let type: String
    
    let attributes: Attributes
}

public extension LibrarySong {
    struct Attributes {
        let albumName: String
        let artistName: String
        let artwork: Artwork
        let name: String
        let trackNumber: Int
        
        init?(_ attributesData: JSON) {
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
public struct CatalogAlbum {
    let id: String
    let href: String
    let type: String
    
    let attributes: Attributes
    let relationships: JSON
}

public extension CatalogAlbum {
    struct Attributes {
        let artistName:          String
        let artwork:             Artwork
        let copyright:           String
        let editorialNotes:      EditorialNotes
        let genreNames:          [String]
        let isComplete:          Bool
        let isMasteredForItunes: Bool
        let isSingle:            Bool
        let name:                String
        let recordLabel:         String
        let releaseDate:         String
        let trackCount:          Int
        let url:                 String
        
        init?(attributesData: JSON) {
            guard let artistName = attributesData["artistName"].string,
                  let artwork = Artwork(attributesData["artwork"]),
                  let copyright = attributesData["copyright"].string,
                  let editorialNotes = EditorialNotes(attributesData["editorialNotes"]),
                  let genreNamesJSON = attributesData["genreNames"].array,
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
            genreNamesJSON.forEach { genreNameJSON in
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
        
        self.relationships = albumData["relationships"]
    }
}

// MARK: LibraryAlbum
public struct LibraryAlbum {
    let id: String
    let href: String
    let type: String
    
    let attributes: Attributes
    let relationships: JSON
}

public extension LibraryAlbum {
    struct Attributes {
        let artistName: String
        let artwork:    Artwork
        let name:       String
        let trackCount: Int
        
        init?(_ attributesData: JSON) {
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
        
        self.relationships = albumData["relationships"]
    }
}


// MARK: - Artist
// MARK: CatalogArtist
public struct CatalogArtist {
    let id: String
    let href: String
    let type: String
    
    let attributes: Attributes
    let relationships: JSON
}

public extension CatalogArtist {
    struct Attributes {
        let genreNames:        [String]
        let name:              String
        let url:               String
        
        init?(_ attributesData: JSON) {
            guard let genreNamesJSON = attributesData["genreNames"].array,
                  let name = attributesData["name"].string,
                  let url = attributesData["url"].string
            else { return nil }
            
            // convert genreNamesJSON array to genreNames array containing String
            var genreNames: [String] = []
            genreNamesJSON.forEach { genreNameJSON in
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
        
        self.relationships = artistData["relationships"]
    }
}

// MARK: LibraryArtist
public struct LibraryArtist {
    let id: String
    let href: String
    let type: String
    
    let attributes: Attributes
}

public extension LibraryArtist {
    struct Attributes {
        let name: String
        
        init?(_ attributesData: JSON) {
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



struct ResourceRelationship {
    
}

struct Resource {
    let id: String      // Persistent identifier of the resource.
    let href: String    // A URL subpath that fetches the resource as the primary object.
    let type: String    // The type of resource.
}

struct Artwork {
    let height: Int     // The maximum height available for the image.
    let width: Int      // The maximum width available for the image.
    let url: String     // The URL to request the image asset. The image filename must be preceded by {w}x{h}, as placeholders for the width and height values as described above (for example, {w}x{h}bb.jpeg).
    
    let bgColor: String    // The average background color of the image.
    let textColor1: String // The primary text color that may be used if the background color is displayed.
    let textColor2: String // The secondary text color that may be used if the background color is displayed.
    let textColor3: String // The tertiary text color that may be used if the background color is displayed.
    let textColor4: String // The final post-tertiary text color that may be used if the background color is displayed.
    
    public init?(_ artworkData: JSON) {
        guard let height = artworkData["height"].int, let width = artworkData["width"].int, let url = artworkData["url"].string
            else { return nil }
        
        guard let bgColor = artworkData["bgColor"].string, let textColor1 = artworkData["textColor1"].string, let textColor2 = artworkData["textColor2"].string, let textColor3 = artworkData["textColor3"].string, let textColor4 = artworkData["textColor4"].string
            else { return nil }
        
        self.height = height
        self.width = width
        self.url = url
        
        self.bgColor = bgColor
        self.textColor1 = textColor1
        self.textColor2 = textColor2
        self.textColor3 = textColor3
        self.textColor4 = textColor4
        
    }
}

struct Preview {
    let url: String         // The preview URL for the content.
    let artwork: Artwork?   // The preview artwork for the associated preview music video.
    
    init?(_ previewData: JSON) {
        guard let url = previewData["url"].string else { return nil }
        self.url = url
        
        self.artwork = Artwork(previewData["artwork"])
    }
}

/// An object that represents notes.
struct EditorialNotes {
    // Notes may include XML tags for formatting (<b> for bold, <i> for italic, or <br> for line break) and special characters (&amp; for &, &lt; for <, &gt; for >, &apos; for ‘, and &quot; for “).
    let short: String       // Notes shown when the content is prominently displayed.
    let standard: String    // Abbreviated notes shown inline or when the content is shown alongside other content.
    
    init?(_ editorialNotesData: JSON) {
        guard let short = editorialNotesData["short"].string, let standard = editorialNotesData["standard"].string
            else { return nil }
        
        self.short = short
        self.standard = standard
    }
}
