//
//  BrandingColorsTests.swift
//  REA_UI_DevelopmentTests
//
//  Created by *** on 7/16/18.
//  Copyright © 2018 8184. All rights reserved.
//

import XCTest
@testable import REA_UI_Development

class BrandingColorsTests: XCTestCase {
    
    /**
     test whether BrandingColors has a property "primary" and its datatype is String
     */
    func testInit_ShouldTakePrimary() {
        let testString = "test"
        let brandingColors = BrandingColors(primary: testString)
        XCTAssertEqual(brandingColors.primary, testString)
    }
}
