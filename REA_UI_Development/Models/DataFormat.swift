//
//  DataFormat.swift
//  REA_UI_Development
//
//  Created by *** on 7/14/18.
//  Copyright © 2018 8184. All rights reserved.
//

import Foundation

class DataFormat: Decodable {
    var results = [Property]()
    var saved = [Property]()
    
    func containsProperty(_ property: Property?) -> Bool {
        return saved.contains{ $0.id == property?.id }
    }
    
    func addProperty(_ property: Property?) {
        guard let p = property else { return }
        saved.append(p)
    }
    
    func removeProperty(_ property: Property?) {
        guard let idx = (saved.index { $0.id == property?.id }) else { return }
        saved.remove(at: idx)
    }
}
