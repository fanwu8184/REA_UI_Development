//
//  ResultsCell.swift
//  REA_UI_Development
//
//  Created by *** on 7/14/18.
//  Copyright © 2018 8184. All rights reserved.
//

import UIKit
private let heightOfLogoBlock = UIScreen.main.bounds.height / 20
private let heightOfPriceBlock: CGFloat = UIScreen.main.bounds.height / 20

class PropertyCell: UICollectionViewCell {
    
    @IBOutlet weak var logoBlockView: UIView!
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var logoBlockViewHeight: NSLayoutConstraint!
    @IBOutlet weak var priceBlockViewHeight: NSLayoutConstraint!
    @IBOutlet weak var savePropertyButton: UIButton!
    let dbService = DataService()
    var dataFromServer: DataFormat?
    
    var property: Property? {
        didSet {
            logoBlockViewHeight.constant = heightOfLogoBlock
            priceBlockViewHeight.constant = heightOfPriceBlock
            
            if let hexString = property?.agency?.brandingColors?.primary {
                logoBlockView.backgroundColor = UIColor(hex: hexString)
            } else {
                logoBlockView.backgroundColor = UIColor.white
            }
            
            if let logoImageURL = property?.agency?.logo {
                logoImageView.imageFromServerURL(urlString: logoImageURL)
            } else {
                logoImageView.image = nil
            }
            
            if let mainImageURL = property?.mainImage {
                mainImageView.imageFromServerURL(urlString: mainImageURL)
            } else {
                mainImageView.image = nil
            }
            
            if let price = property?.price {
                priceLabel.text = price
            } else {
                priceLabel.text = ""
            }
            
            if dataFromServer?.containsProperty(property) ==  true {
                savePropertyButton.setImage(#imageLiteral(resourceName: "heartOn"), for: .normal)
            } else {
                savePropertyButton.setImage(#imageLiteral(resourceName: "heartOff"), for: .normal)
            }
        }
    }
    
    @IBAction func saveAndUnsave(_ sender: UIButton) {
        if sender.currentImage == #imageLiteral(resourceName: "heartOff") {
            sender.setImage(#imageLiteral(resourceName: "heartOn"), for: .normal)
            dataFromServer?.addProperty(property)
        } else {
            sender.setImage(#imageLiteral(resourceName: "heartOff"), for: .normal)
            dataFromServer?.removeProperty(property)
        }
        dbService.saveData()
    }
    
}
