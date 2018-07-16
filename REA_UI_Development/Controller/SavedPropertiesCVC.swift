//
//  SavedPropertiesCVC.swift
//  REA_UI_Development
//
//  Created by *** on 7/15/18.
//  Copyright © 2018 8184. All rights reserved.
//

import UIKit

private let reuseIdentifier = "PropertyCell"
private let numberOfPropertyInScreen: CGFloat = 3   //define how many properties wanted to be shown in the screen

class SavedPropertiesCVC: UICollectionViewController {

    private var dataFromServer: DataFormat?
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        //define the size of a view about property
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height / numberOfPropertyInScreen)
    }

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
}
