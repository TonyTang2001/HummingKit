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
    
    let devToken: String = "eyJ0eXAiOiJKV1QiLCJhbGciOiJFUzI1NiIsImtpZCI6IkxUR0cyUFJXSEYifQ.eyJpc3MiOiIzSzRQVDlSSjk4IiwiaWF0IjoxNTk1NzIzMjA4LjA5NDczNTEsImV4cCI6MTYxMTUwMDIwOC4wOTQ3MzUxfQ._PWogz958344A0hhIls7JZ5pDPJjxW0E8q236XPg-PSWOs0yJxyheifEJlRs-Ybu6nuW1Dymq-Z-CGs56_uO6g"
    var usrToken: String = "ArnXjMTZ8nKNPOocmqmKvi2jTKa/afaH81XZ3lj7ajQWbIUQgb5tp7YqPdKBM/UcHIITWxaIAw17fJf5mOFcDm4Ixba9LTem6QDYM2Ztk4ikqFn0W0HeBJDqY0YrI7IOsr9cPSsuhgs5FnulbFPQV/XcolsjUogf6ExbikY4k6p8CxH2yYQPHFNR49aHlI+3vQZGJIwCdp4m+BH2o0rlXpvwwfnnSJwTRrov01Vt9zicOchdjA=="
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
                print(album.attributes.name)
                catalogAlbumFetchingExpectation.fulfill()
            case .failure(let err):
                print(err)
            }
            
        }
        
        waitForExpectations(timeout: 8, handler: nil)

    }
    
    func testFetchAllLibrarySongs() {
        let catalogAlbumFetchingExpectation = self.expectation(description: "Fetch a catalog album.")
        
        humming?.fetchAllLibrarySongs { result in
            switch result {
            case .success((let songs, let status)):
                XCTAssertEqual(songs.count > 100, true)
                XCTAssertEqual(status, FetchingStatus.completed)
                catalogAlbumFetchingExpectation.fulfill()
            case .failure(let err):
                print(err)
            }
        }
        
        waitForExpectations(timeout: 10, handler: nil)
    }

//    func testPerformanceExample() throws {
//        // This is an example of a performance test case.
//        self.measure {
//            // Put the code you want to measure the time of here.
//        }
//    }

}
