//
//  PropertyTests.swift
//  REA_UI_DevelopmentTests
//
//  Created by *** on 7/16/18.
//  Copyright © 2018 8184. All rights reserved.
//

import XCTest
@testable import REA_UI_Development

class PropertyTests: XCTestCase {
    let testString = "test"
    
    /**
     test whether Property has a property "price" and its datatype is String
     */
    func testInit_ShouldTakePrice() {
        let property = Property(price: testString, agency: nil, id: nil, mainImage: nil)
        XCTAssertEqual(property.price, testString)
    }
    
    /**
     test whether Property has a property "agency" and its datatype is Agency
     */
    func testInit_ShouldTakeAgency() {
        let agency = Agency(brandingColors: nil, logo: testString)
        let property = Property(price: nil, agency: agency, id: nil, mainImage: nil)
        XCTAssertEqual(property.agency?.logo, testString)
    }
    
    /**
     test whether Property has a property "id" and its datatype is String
     */
    func testInit_ShouldTakeId() {
        let property = Property(price: nil, agency: nil, id: testString, mainImage: nil)
        XCTAssertEqual(property.id, testString)
    }
    
    /**
     test whether Property has a property "mainImage" and its datatype is String
     */
    func testInit_ShouldTakeMainImage() {
        let property = Property(price: nil, agency: nil, id: nil, mainImage: testString)
        XCTAssertEqual(property.mainImage, testString)
    }
}
