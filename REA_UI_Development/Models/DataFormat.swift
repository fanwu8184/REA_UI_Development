//
//  DataFormat.swift
//  REA_UI_Development
//
//  Created by *** on 7/14/18.
//  Copyright © 2018 8184. All rights reserved.
//

import Foundation

struct DataFormat: Decodable {
    let results: [Property]?
    let saved: [Property]?
}
