//
//  APIManagerTest.swift
//  swift4-json-sampleTests
//
//  Created by Ranjith Karuvadiyil on 15/02/19.
//  Copyright © 2019 mistybits. All rights reserved.
//

import XCTest
@testable import swift4_json_sample

class APIManagerTest: XCTestCase {
    var apimanager: APIManager?
    var sessionUnderTest: URLSession!

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        apimanager = APIManager()
        sessionUnderTest = URLSession(configuration: URLSessionConfiguration.default)

    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        apimanager = nil
        super.tearDown()
    }
    
    func test_get_Dara_FromUrl() {
        // Given A apiservice
        let sut = self.apimanager
        let expect = XCTestExpectation(description: "callback")
        sut?.getDaraFromUrl(completion: { ( swifter, error) in
            expect.fulfill()
            XCTAssertEqual( swifter?.rows.count, 14)
            for row in (swifter?.rows)! {
                XCTAssertNotNil(row.title)
            }
        })
        wait(for: [expect], timeout: 3.1)
    }
   
    func testValidCallToServerGetsHTTPStatusCode200() {
        // given
        let url = URL(string: "https://dl.dropboxusercontent.com/s/2iodh4vg0eortkl/facts.json")
        // 1
        let promise = expectation(description: "Status code: 200")
        
        // when
        let dataTask = sessionUnderTest.dataTask(with: url!) { data, response, error in
            // then
            if let error = error {
                XCTFail("Error: \(error.localizedDescription)")
                return
            } else if let statusCode = (response as? HTTPURLResponse)?.statusCode {
                if statusCode == 200 {
                    // 2
                    promise.fulfill()
                } else {
                    XCTFail("Status code: \(statusCode)")
                }
            }
        }
        dataTask.resume()
        // 3
        waitForExpectations(timeout: 5, handler: nil)
    }
}
