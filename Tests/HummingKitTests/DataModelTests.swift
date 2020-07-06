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
    
    let devToken: String = "eyJ0eXAiOiJKV1QiLCJhbGciOiJFUzI1NiIsImtpZCI6IjQyRFEzTVc4WDgifQ.eyJpc3MiOiIzSzRQVDlSSjk4IiwiaWF0IjoxNTkyNzAyNTg4LjMwNzkyMSwiZXhwIjoxNjA4NDc5NTg4LjMwNzkyMX0.DbbRfWDaZcjPb6wC8MOh0hYUn8G300-66eqx6AVek7POCH4Dc5863XOxFN1X911e3q2dubBjX4JnNaXn9tjZoA"
    var usrToken: String = "Atqm5eRShbXfa4q8X9zO5xrBGWT/GiTVwaSWPJuSl1m6X3jYuZmL0K4gMlbJp4oxKXQ1Ax8rFitqWo0h8LFvNzJWYhsTtxfmB2fNd47mlBg3pkTk9kcNS9YzBYpDvxGVKjlwVUTUYUAzfZbWYR3XGdWDTggfhmlTAzhgW9nMtByHH1NClStikIZI2DJNrPF+lH59rcb+iJJewYDE9YK4pKfhq5nBVD3ra3HviVwpVe87U8vwUA=="
    var humming: HummingKit?
    

    override func setUpWithError() throws {
        
//        let usrTokenFetchingExpectation = self.expectation(description: "Apple Music userToken fetching")
//
//        HummingKitAuthentication.fetchUserToken(developerToken: devToken) { result in
//            switch result {
//            case .success(let token):
//                self.usrToken = token
//                self.humming = HummingKit(developerToken: self.devToken, userToken: self.usrToken)
//                usrTokenFetchingExpectation.fulfill()
//            case .failure(_):
//                usrTokenFetchingExpectation.fulfill()
//                break
//            }
//        }
//
//        XCTAssertNotEqual(usrToken, "", "Apple Music userToken is not set. Please check code and internet connection.")
//
//        waitForExpectations(timeout: 8, handler: nil)
        
        self.humming = HummingKit(developerToken: self.devToken, userToken: self.usrToken)
        
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

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
    
    func testLibrarySongInitialization() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        let librarySong = LibrarySong(songData: librarySongJSON)
        XCTAssertEqual(librarySong?.id, "i.vMXdDW1TKQWRAd", "Unexpected Library Song id")
        XCTAssertEqual(librarySong?.href, "/v1/me/library/songs/i.vMXdDW1TKQWRAd", "Unexpected Library Song href")
        XCTAssertEqual(librarySong?.type, "library-songs", "Unexpected Library Song type")
        XCTAssertEqual(librarySong?.attributes.albumName, "Mozart: 7 Minuets, K. 61b", "Unexpected Library Song albumName")
        XCTAssertEqual(librarySong?.attributes.artistName, "Wiener Mozart Ensemble & Willi Boskovsky", "Unexpected Library Song artistName")
        XCTAssertEqual(librarySong?.attributes.artwork.url, "https://example.mzstatic.com/image/thumb/Features/6c/83/03/dj.npsbmsfx.jpeg/{w}x{h}bb.jpeg", "Unexpected Library Song artwork url")
        XCTAssertEqual(librarySong?.attributes.name, "7 Minuets, K. 61b: No. 1 in G", "Unexpected Library Song name")
        XCTAssertEqual(librarySong?.attributes.trackNumber, 1, "Unexpected Library Song trackNumber")
        
    }

//    func testPerformanceExample() throws {
//        // This is an example of a performance test case.
//        self.measure {
//            // Put the code you want to measure the time of here.
//        }
//    }

}
