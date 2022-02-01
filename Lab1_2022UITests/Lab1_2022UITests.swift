//
//  Lab1_2022UITests.swift
//  Lab1_2022UITests
//
//  Created by ICS 224 on 2022-01-18.
//

import XCTest

class Lab1_2022UITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCharCount() throws {
        let app = XCUIApplication()
        app.launch()
        
        let detailText = app.staticTexts["DetailText"]
        XCTAssertEqual(detailText.label, "0/150")
        
        let detailTextEditor = app.textViews["DetailTextEditor"]
        detailTextEditor.tap()
        
        let keyH = app.keys["H"]
        keyH.tap()
        XCTAssertTrue(detailText.waitForExistence(timeout : 5))
        XCTAssertEqual(detailText.label, "1/150")
        
        let keyi = app.keys["i"]
        keyi.tap()
        
        XCTAssertEqual(detailText.label, "2/150")
        
        
    }
    
    func testTwo() throws {
        let app = XCUIApplication()
        app.launch()
        let detailTextEditor = app.textViews["DetailTextEditor"]
        let detailText = app.staticTexts["DetailText"]
        detailTextEditor.tap()
        var keyH = app.keys["H"]
        var i = 153
        while (i > 0) {
            
            keyH.tap()
            keyH = app.keys["h"]
            i = i - 1
        }
        
        XCTAssertEqual(detailText.label, "150/150")
    }
    
    func testThird() throws {
        let app = XCUIApplication()
        app.launch()
        let navigationButton = app.buttons["NavigationButton"]
        
        
        var i = 30
        navigationButton.tap()
        while (i > 0) {
            app.steppers["MaxCountStepper"].buttons["Decrement"].tap()
            i = i - 1
        }
        navigationButton.tap()
        let detailText = app.staticTexts["DetailText"]
        XCTAssertEqual(detailText.label, "0/10")
        
        app.terminate()
        app.launch()
        
        XCTAssertEqual(detailText.label, "0/10")
        var keyH = app.keys["H"]
        let detailTextEditor = app.textViews["DetailTextEditor"]
        detailTextEditor.tap()
        var j = 12
        while (j > 0) {
            keyH.tap()
            keyH = app.keys["h"]
            j = j - 1
        }
        
        XCTAssertEqual(detailText.label, "10/10")
        i = 31
        navigationButton.tap()
        while (i > 0) {
            app.steppers["MaxCountStepper"].buttons["Increment"].tap()
            i = i - 1
        }
        navigationButton.tap()
        XCTAssertEqual(detailText.label, "0/300")
        
        i = 15
        navigationButton.tap()
        while (i != 0) {
            app.steppers["MaxCountStepper"].buttons["Decrement"].tap()
            i = i - 1
        }
        
    }
}
