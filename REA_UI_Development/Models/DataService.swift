//
//  Data.swift
//  REA_UI_Development
//
//  Created by *** on 7/14/18.
//  Copyright © 2018 8184. All rights reserved.
//

import Foundation

//I have stored the Json data in a web
private let dataURLString = "https://api.myjson.com/bins/cmq8e"
private let urlError = "Invalid URL!"
private let webError = "Error Getting Website!"
private let noData = "No Available Data!"
private let jsonError = "Error Serializing Json!"

class DataService {
    
    /**
     load data from web server (here just a web url)
     - parameters:
     - callback: provide DataFormat(data) and String(Error message) when loading data is done
     */
    func loadData(completion: @escaping (DataFormat?, String?) -> Void) {
        guard let url = URL(string: dataURLString) else {
            completion(nil, urlError)
            return
        }
        
        //download data from url and decode the data
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            //might need to work with response
            
            guard error == nil else {
                completion(nil, webError)
                return
            }
            
            guard let jsonData = data else {
                completion(nil, noData)
                return
            }
            
            do {
                //decode data
                let BackendData = try JSONDecoder().decode(DataFormat.self, from: jsonData)
                completion(BackendData, nil)
            } catch {
                completion(nil, jsonError)
            }
        }.resume()
    }
    
    ///do something to save data into server
    func saveData() {
        //TODO
    }
}
