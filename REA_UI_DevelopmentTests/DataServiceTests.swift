//
//  DataServiceTests.swift
//  REA_UI_DevelopmentTests
//
//  Created by Fan Wu on 7/16/18.
//  Copyright © 2018 8184. All rights reserved.
//

import XCTest
@testable import REA_UI_Development

class DataServiceTests: XCTestCase {
    
    /**
     test whether it is successful to load data from server
     */
    func testLoadData() {
        let dbService = DataService()
        dbService.loadData { (dataFormat, error) in
            XCTAssertGreaterThan(dataFormat?.results.count ?? 0, 0)
        }
    }
}
