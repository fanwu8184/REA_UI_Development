//
//  ResultsCVC.swift
//  REA_UI_Development
//
//  Created by *** on 7/14/18.
//  Copyright © 2018 8184. All rights reserved.
//

import UIKit

private let reuseIdentifier = "PropertyCell"
private let numberOfPropertyInScreen: CGFloat = 3  //define how many properties wanted to be shown in the screen

class ResultsCVC: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    private var dataFromServer: DataFormat?
    private let dbService = DataService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //load data from server
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
        
        //need to update the view so that it shows the results after actions done by users.
        self.collectionView?.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        //define the size of a view about property
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height / numberOfPropertyInScreen)
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
}
