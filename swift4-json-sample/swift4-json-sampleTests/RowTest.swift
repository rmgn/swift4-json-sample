//
//  RowTest.swift
//  swift4-json-sampleTests
//
//  Created by Ranjith Karuvadiyil on 15/02/19.
//  Copyright © 2019 mistybits. All rights reserved.
//

import XCTest
@testable import swift4_json_sample

class RowTest: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testValidDecodingStandardType() {
        let json = """
        {
         "title":"Beavers",
        "description":"Beavers are second only to humans in their ability to manipulate and change their environment. They can measure up to 1.3 metres long. A group of beavers is called a colony",
        "imageHref":"http://upload.wikimedia.org/wikipedia/commons/thumb/6/6b/American_Beaver.jpg/220px-American_Beaver.jpg"


        }
        """.data(using: .utf8)!
        
        let rowObj = try! JSONDecoder().decode(Rows.self, from: json)
        
        XCTAssertEqual(rowObj.title, "Beavers")
        XCTAssertEqual(rowObj.description, "Beavers are second only to humans in their ability to manipulate and change their environment. They can measure up to 1.3 metres long. A group of beavers is called a colony")
        XCTAssertEqual(rowObj.imageHref, "http://upload.wikimedia.org/wikipedia/commons/thumb/6/6b/American_Beaver.jpg/220px-American_Beaver.jpg")

    }
    func testInvalidDecodingStandardType() {
        let json = """
        {
         "title":"Housing",
        "description":"Warmer than you might think",
        "imageHref":"http://icons.iconarchive.com/icons/iconshock/alaska/256/Igloo-icon.png"


        }
        """.data(using: .utf8)!
        
        let rowObj = try! JSONDecoder().decode(Rows.self, from: json)
        
        XCTAssertNotEqual(rowObj.title, "Beavers")
        XCTAssertNotEqual(rowObj.description, "Beavers are second only to humans in their ability to manipulate and change their environment. They can measure up to 1.3 metres long. A group of beavers is called a colony")
        XCTAssertNotEqual(rowObj.imageHref, "http://upload.wikimedia.org/wikipedia/commons/thumb/6/6b/American_Beaver.jpg/220px-American_Beaver.jpg")
        
    }

}


