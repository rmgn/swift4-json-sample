//
//  ViewModelTest.swift
//  swift4-json-sampleTests
//
//  Created by Ranjith Karuvadiyil on 15/02/19.
//  Copyright © 2019 mistybits. All rights reserved.
//

import XCTest
@testable import swift4_json_sample

class ViewModelTest: XCTestCase {
    
    var sut: ExerciseViewModel!
    var mockAPIService: MockApiService!

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        mockAPIService = MockApiService()
        sut = ExerciseViewModel(viewDelegate: mockAPIService )
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
        mockAPIService = nil
        super.tearDown()

    }
    
     func testfechRow() {
        mockAPIService.completeSwifter = [Swifter]()
    sut.bootstrap()
        XCTAssert(mockAPIService!.isFetchSwifterCalled)

    }

    

}
class MockApiService: ExerciseProtocol {
    var completeSwifter: [Swifter] = [Swifter]()
    var apiManagerObj = APIManager()
    var isFetchSwifterCalled = true


    func loadDatas(){
        isFetchSwifterCalled = true
    }
 
}
