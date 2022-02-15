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
//let backButton = app.buttons["Back"]
    //backButton.tap()
    func testCharCount() throws {
        
        let app = XCUIApplication()
        app.launch()
        app.tables.cells.firstMatch.tap()
        
        let detailText = app.staticTexts["DetailText"]
        XCTAssertEqual(detailText.label, "4/150")
        
        let detailTextEditor = app.textViews["DetailTextEditor"]
        detailTextEditor.tap()
        
        let keyH = app.keys["H"]
        keyH.tap()
        XCTAssertTrue(detailText.waitForExistence(timeout : 5))
        XCTAssertEqual(detailText.label, "5/150")
        
        let keyi = app.keys["i"]
        keyi.tap()
        
        XCTAssertEqual(detailText.label, "6/150")
        
        
    }
    
    func testMaxChar() throws {
        let app = XCUIApplication()
        app.launch()
        app.tables.cells.firstMatch.tap()
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
    
    func testSaveFunctionMaxChar() throws {
        let app = XCUIApplication()
        app.launch()
        let backButton = app.buttons["Inventory"]
        app.tables.cells.firstMatch.tap()
        let navigationButton = app.buttons["NavigationButton"]
        
        
        var i = 30
        backButton.tap()
        navigationButton.tap()
        while (i > 0) {
            app.steppers["MaxCountStepper"].buttons["Decrement"].tap()
            i = i - 1
        }
        
        navigationButton.tap()
        app.tables.cells.firstMatch.tap()
        let detailText = app.staticTexts["DetailText"]
        XCTAssertEqual(detailText.label, "4/10")
        
        app.terminate()
        app.launch()
        
        app.tables.cells.firstMatch.tap()
        XCTAssertEqual(detailText.label, "4/10")
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
        
        backButton.tap()
        navigationButton.tap()
        while (i > 0) {
            app.steppers["MaxCountStepper"].buttons["Increment"].tap()
            i = i - 1
        }
        navigationButton.tap()
        
        app.tables.cells.firstMatch.tap()
        XCTAssertEqual(detailText.label, "10/300")
        
        i = 15
        backButton.tap()
        navigationButton.tap()
        while (i != 0) {
            app.steppers["MaxCountStepper"].buttons["Decrement"].tap()
            i = i - 1
        }
        
    }
    
    func testToggle() throws {
        
        let app = XCUIApplication()
        app.launch()
        let backButton = app.buttons["Inventory"]
        app.tables.cells.firstMatch.tap()
        let favouriteToggle = app.switches["FavouriteToggle"]
        XCTAssertEqual(favouriteToggle.value as? String, "0") // for disabled use 0 instead of 1
        favouriteToggle.tap()
        XCTAssertEqual(favouriteToggle.value as? String, "1")
        backButton.tap()
        app.tables.cells.firstMatch.tap()
        XCTAssertEqual(favouriteToggle.value as? String, "1")
        backButton.tap()
        let secondEntry = app.tables.cells.element(boundBy: 1)
        secondEntry.tap()
        XCTAssertEqual(favouriteToggle.value as? String, "0")
        backButton.tap()
        app.tables.cells.firstMatch.tap()
        XCTAssertEqual(favouriteToggle.value as? String, "1")
        favouriteToggle.tap()
        XCTAssertEqual(favouriteToggle.value as? String, "0")    }
    
    func testAddition() throws {
        let app = XCUIApplication()
        app.launch()
        let addButton = app.buttons["PlusButton"]
        addButton.tap()
        app.tables.cells.firstMatch.tap()
        let backButton = app.buttons["Inventory"]
        backButton.tap()
    }
    
}
