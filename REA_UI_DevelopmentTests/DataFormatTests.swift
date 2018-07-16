//
//  DataFormatTests.swift
//  REA_UI_DevelopmentTests
//
//  Created by Fan Wu on 7/16/18.
//  Copyright © 2018 8184. All rights reserved.
//

import XCTest
@testable import REA_UI_Development

class DataFormatTests: XCTestCase {
    
    let dataFormat = DataFormat()
    let testString = "test"
    let testString2 = "test2"
    var property: Property!
    var property2: Property!
    
    override func setUp() {
        super.setUp()
        property = Property(price: nil, agency: nil, id: testString, mainImage: nil)
        property2 = Property(price: nil, agency: nil, id: testString2, mainImage: nil)
    }
    
    /**
     test whether DataFormat has a empty array "results"
     */
    func testInit_ResultsArray() {
        XCTAssertEqual(dataFormat.results.count, 0)
    }
    
    /**
     test whether DataFormat has a empty array "saved"
     */
    func testInit_SavedArray() {
        XCTAssertEqual(dataFormat.saved.count, 0)
    }
    
    /**
     test whether "saved" array contains element of a property. It should return true if yes.
     */
    func testContainsProperty() {
        dataFormat.addProperty(property)
        XCTAssertTrue(dataFormat.containsProperty(property))
    }
    
    /**
     add a property to array "saved" and see if it is same as the last element of the array after the action
     */
    func testAddProperty() {
        dataFormat.addProperty(property)
        XCTAssertEqual(dataFormat.saved.last?.id, testString)
    }
    
    /**
     remove a property from "saved" array, and the array shouldn't contains the removed property anymore.
     */
    func testRemove() {
        dataFormat.addProperty(property)
        dataFormat.addProperty(property2)
        dataFormat.removeProperty(property)
        XCTAssertFalse(dataFormat.containsProperty(property))
    }
}
