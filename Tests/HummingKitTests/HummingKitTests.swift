//
//  HummingKitTests.swift
//  HummingKit
//
//  Created by Tony Tang on 5/3/20.
//

import XCTest
import SwiftyJSON
@testable import HummingKit


class HummingKitTests: XCTestCase {
    
    
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
    
    func testFetchACatalogAlbum() {
        
        let catalogAlbumFetchingExpectation = self.expectation(description: "Fetch a catalog album.")
        
        humming?.fetchACatalogAlbum(storefront: "us", albumID: "310730204") { result in
            switch result {
            case .success(let album):
                print(album)
                catalogAlbumFetchingExpectation.fulfill()
            case .failure(let err):
                print(err)
            }
            
        }
        
        waitForExpectations(timeout: 8, handler: nil)

    }
    
    func testFetchAllLibrarySongs() {
        let catalogAlbumFetchingExpectation = self.expectation(description: "Fetch a catalog album.")
        
        humming?.fetchAllLibrarySongs(storefront: "us") { result in
            switch result {
            case .success((let songs, let status)):
                XCTAssertEqual(songs.count > 100, true)
                catalogAlbumFetchingExpectation.fulfill()
            case .failure(let err):
                print(err)
            }
        }
        
        waitForExpectations(timeout: 18, handler: nil)
    }

//    func testPerformanceExample() throws {
//        // This is an example of a performance test case.
//        self.measure {
//            // Put the code you want to measure the time of here.
//        }
//    }

}
