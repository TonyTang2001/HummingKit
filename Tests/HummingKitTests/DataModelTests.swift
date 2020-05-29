//
//  DataModelTests.swift
//  HummingKit
//
//  Created by Tony Tang on 5/27/20.
//

import XCTest
import SwiftyJSON
@testable import HummingKit


class DataModelTests: XCTestCase {

//    override func setUpWithError() throws {
//        // Put setup code here. This method is called before the invocation of each test method in the class.
//    }
//
//    override func tearDownWithError() throws {
//        // Put teardown code here. This method is called after the invocation of each test method in the class.
//    }

    func testCatalogSongInitialization() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        let catalogSong = CatalogSong(songData: catalogSongJSON)
        XCTAssertEqual(catalogSong?.id, "900032829", "Unexpected Catalog Song id")
        XCTAssertEqual(catalogSong?.href, "/v1/catalog/us/songs/900032829", "Unexpected Catalog Song href")
        XCTAssertEqual(catalogSong?.type, "songs", "Unexpected Catalog Song type")
        XCTAssertEqual(catalogSong?.attributes.albumName, "Something For the Pain", "Unexpected Catalog Song album name")
        XCTAssertEqual(catalogSong?.attributes.artistName, "Michael de Jong", "Unexpected Catalog Song artist name")
        XCTAssertEqual(catalogSong?.attributes.artwork.url, "https://example.mzstatic.com/image/thumb/Music3/v4/8d/5f/4e/8d5f4e8f-d677-ba24-15f0-f8035047a4cc/source/{w}x{h}bb.jpeg", "Unexpected Catalog Song artwork url")
        XCTAssertEqual(catalogSong?.attributes.composerName, "Michael de Jong", "Unexpected Catalog Song composer name")
        XCTAssertEqual(catalogSong?.attributes.discNumber, 1, "Unexpected Catalog Song disc number")
        XCTAssertEqual(catalogSong?.attributes.durationInMillis, 327693, "Unexpected Catalog Song duration")
        XCTAssertEqual(catalogSong?.attributes.genreNames, ["Singer/Songwriter", "Music", "Blues"], "Unexpected Catalog Song genre names")
        XCTAssertEqual(catalogSong?.attributes.isrc, "NLH851300057", "Unexpected Catalog Song isrc")
        XCTAssertEqual(catalogSong?.attributes.name, "Something For the Pain", "Unexpected Catalog Song name")
        XCTAssertEqual(catalogSong?.attributes.previews[0].url, "https://example.itunes.apple.com/apple-assets-us-std-000001/Music3/v4/0e/87/8d/0e878d76-734f-39b3-8904-00c1fa873088/mzaf_8986718721308175601.plus.aac.p.m4a", "Unexpected Catalog Song preview")
        XCTAssertEqual(catalogSong?.attributes.releaseDate, "2014-07-11", "Unexpected Catalog Song release date")
        XCTAssertEqual(catalogSong?.attributes.trackNumber, 7, "Unexpected Catalog Song track number")
        XCTAssertEqual(catalogSong?.attributes.url, "https://itunes.apple.com/us/album/something-for-the-pain/900032785?i=900032829", "Unexpected Catalog Song url")
        
    }

//    func testPerformanceExample() throws {
//        // This is an example of a performance test case.
//        self.measure {
//            // Put the code you want to measure the time of here.
//        }
//    }

}
