//
//  ResultsCVC.swift
//  REA_UI_Development
//
//  Created by *** on 7/14/18.
//  Copyright © 2018 8184. All rights reserved.
//

import UIKit

private let reuseIdentifier = "ResultsCell"

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
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if let speakingBVC = segue.destination as? DIVC {
//            speakingBVC.data = data
//            speakingBVC.currentPage = sender as? IndexPath
//        }
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataFromServer?.results?.count ?? 0
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
        return cell
    }

    // MARK: UICollectionViewDelegate
    override func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        let resultsCell = cell as! ResultsCell
        resultsCell.property = dataFromServer?.results?[indexPath.item]
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height / 3)
    }

}
