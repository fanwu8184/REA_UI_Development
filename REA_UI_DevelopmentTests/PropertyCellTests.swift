//
//  PropertyCellTests.swift
//  REA_UI_DevelopmentTests
//
//  Created by *** on 7/17/18.
//  Copyright © 2018 8184. All rights reserved.
//

import XCTest
@testable import REA_UI_Development

class PropertyCellTests: XCTestCase {

    /**
     test whether the "savePropertyButton" work properly
     */
    func testSavedPropertyButton() {
        let propertyCell = PropertyCell()
        let savedPropertyButton = UIButton()
        savedPropertyButton.setImage(#imageLiteral(resourceName: "heartOff"), for: .normal)
        propertyCell.saveAndUnsave(savedPropertyButton)
        XCTAssertEqual(savedPropertyButton.currentImage, #imageLiteral(resourceName: "heartOn"))
    }
}
