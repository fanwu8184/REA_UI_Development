//
//  ViewController.swift
//  REA_UI_Development
//
//  Created by *** on 7/14/18.
//  Copyright © 2018 8184. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let dbService = DataService()
        dbService.loadData { (dataFormat, error) in
            if let err = error {
                print (err)
                return
            } else {
                guard let dataF = dataFormat else { return }
                print(dataF)
            }
        }
    }
}

