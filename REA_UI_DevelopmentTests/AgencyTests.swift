//
//  AgencyTests.swift
//  REA_UI_DevelopmentTests
//
//  Created by Fan Wu on 7/16/18.
//  Copyright © 2018 8184. All rights reserved.
//

import XCTest
@testable import REA_UI_Development

class AgencyTests: XCTestCase {
    
    let testString = "test"
    
    /**
     test whether Agency has a property "brandingColors" and its datatype is BrandingColors
     */
    func testInit_ShouldTakeBrandingColors() {
        let brandingColors = BrandingColors(primary: testString)
        let agency = Agency(brandingColors: brandingColors, logo: nil)
        XCTAssertEqual(agency.brandingColors?.primary, testString)
    }
    
    /**
     test whether Agency has a property "logo" and its datatype is String
     */
    func testInit_shouldTakeLogo() {
        let agency = Agency(brandingColors: nil, logo: testString)
        XCTAssertEqual(agency.logo, testString)
    }
}
