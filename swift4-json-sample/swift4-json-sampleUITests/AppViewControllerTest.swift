//
//  AppViewControllerTest.swift
//  swift4-json-sampleUITests
//
//  Created by Ranjith Karuvadiyil on 15/02/19.
//  Copyright © 2019 mistybits. All rights reserved.
//

import XCTest
@testable import swift4_json_sample

class AppViewControllerTest: XCTestCase {

    var viewController: AppViewController!
    private var rootWindow: UIWindow!
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
        
        rootWindow = UIWindow(frame: UIScreen.main.bounds)
        rootWindow.isHidden = false
        rootWindow.rootViewController = viewController
//        _ = viewController.view
        viewController.viewWillAppear(false)
        viewController.viewDidAppear(false)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        rootWindow = UIWindow(frame: UIScreen.main.bounds)
        rootWindow.isHidden = false
        rootWindow.rootViewController = viewController
        _ = viewController.view

        viewController.viewWillDisappear(false)
        viewController.viewDidDisappear(false)
        rootWindow.rootViewController = nil
        rootWindow.isHidden = true
        self.rootWindow = nil
        super .tearDown()
    }
    
  
}
