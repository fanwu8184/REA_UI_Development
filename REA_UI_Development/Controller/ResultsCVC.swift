//
//  ResultsCVC.swift
//  REA_UI_Development
//
//  Created by *** on 7/14/18.
//  Copyright © 2018 8184. All rights reserved.
//

import UIKit

private let reuseIdentifier = "PropertyCell"

class ResultsCVC: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var dataFromServer: DataFormat?
    let dbService = DataService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dbService.loadData { (dataFormat, error) in
            if let err = error {
                print (err)
                return
            } else {
                self.dataFromServer = dataFormat
                DispatchQueue.main.async { 
                    self.collectionView?.reloadData()
                }
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.collectionView?.reloadData()
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let savedPropertiesCVC = segue.destination as? SavedPropertiesCVC {
            savedPropertiesCVC.dataFromServer = dataFromServer
        }
    }

    // MARK: UICollectionViewDataSource
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataFromServer?.results.count ?? 0
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
        return cell
    }

    // MARK: UICollectionViewDelegate
    override func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        let propertyCell = cell as! PropertyCell
        propertyCell.dataFromServer = dataFromServer
        propertyCell.property = dataFromServer?.results[indexPath.item]
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height / 3)
    }
}
