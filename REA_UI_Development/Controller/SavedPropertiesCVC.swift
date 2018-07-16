//
//  SavedPropertiesCVC.swift
//  REA_UI_Development
//
//  Created by *** on 7/15/18.
//  Copyright © 2018 8184. All rights reserved.
//

import UIKit

private let reuseIdentifier = "PropertyCell"

class SavedPropertiesCVC: UICollectionViewController {

    var dataFromServer: DataFormat?

    // MARK: UICollectionViewDataSource
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataFromServer?.saved.count ?? 0
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
        return cell
    }

    // MARK: UICollectionViewDelegate
    override func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        let propertyCell = cell as! PropertyCell
        propertyCell.dataFromServer = dataFromServer
        propertyCell.property = dataFromServer?.saved[indexPath.item]
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height / 3)
    }
}
