//
//  Data.swift
//  REA_UI_Development
//
//  Created by *** on 7/14/18.
//  Copyright © 2018 8184. All rights reserved.
//

import Foundation

private let dataURLString = "https://api.myjson.com/bins/cmq8e"    //I have stored the JSON data in a web
private let urlError = "Invalid URL!"                //define url error message
private let webError = "Error Getting Website!"      //define web error message
private let noData = "No Available Data!"            //define no available data message
private let jsonError = "Error Serializing Json!"    //define decoding JSON error message

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
