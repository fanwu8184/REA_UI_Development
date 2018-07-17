//
//  REA_UI_DevelopmentUITests.swift
//  REA_UI_DevelopmentUITests
//
//  Created by *** on 7/17/18.
//  Copyright © 2018 8184. All rights reserved.
//

import XCTest

class REA_UI_DevelopmentUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        XCUIApplication().launch()
    }
    
    /**
     test whether the numbers of cells in results view is correct
     */
    func testNumbersOfCellsInResultsView() {
        let collectionViewsQuery = XCUIApplication().collectionViews
        XCTAssertEqual(collectionViewsQuery.cells.count, 3)
    }
    
    /**
     test whether the numbers of cells in saved properties view is correct
     */
    func testNumbersOfCellsInSavedPropertiesView() {
        let app = XCUIApplication()
        app.navigationBars["Results"].buttons["Favorites"].tap()
        XCTAssertEqual(app.collectionViews.cells.count, 1)
    }
    
    /**
     test whether the numbers of cells in saved properties view is correct after adding properties
     */
    func testAddProperties() {
        let app = XCUIApplication()
        app.collectionViews.children(matching: .cell).element(boundBy: 0).buttons["Button"].tap()
        app.navigationBars["Results"].buttons["Favorites"].tap()
        app.otherElements.containing(.navigationBar, identifier:"Saved Properties").children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .collectionView).element.swipeUp()
        XCTAssertEqual(app.collectionViews.cells.count, 2)
    }
    
    /**
     test whether the numbers of cells in saved properties view is correct after removing properties
     */
    func testRemoveProperties() {
        let app = XCUIApplication()
        let favoritesButton = app.navigationBars["Results"].buttons["Favorites"]
        favoritesButton.tap()
        app.collectionViews/*@START_MENU_TOKEN@*/.buttons["Button"]/*[[".cells.buttons[\"Button\"]",".buttons[\"Button\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.navigationBars["Saved Properties"].buttons["Results"].tap()
        favoritesButton.tap()
        XCTAssertEqual(app.collectionViews.cells.count, 0)
    }
}
