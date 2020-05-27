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

    func testCatalogSong() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        let catalogSong = CatalogSong(songData: catalogSongJSON)
        XCTAssertEqual(catalogSong?.id, "900032829", "Unexpected Catalog Song id")
        XCTAssertEqual(catalogSong?.href, "/v1/catalog/us/songs/900032829", "Unexpected Catalog Song href")
        XCTAssertEqual(catalogSong?.type, "songs", "Unexpected Catalog Song type")
        
        
    }

//    func testPerformanceExample() throws {
//        // This is an example of a performance test case.
//        self.measure {
//            // Put the code you want to measure the time of here.
//        }
//    }

}
