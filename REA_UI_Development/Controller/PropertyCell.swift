//
//  ResultsCell.swift
//  REA_UI_Development
//
//  Created by *** on 7/14/18.
//  Copyright © 2018 8184. All rights reserved.
//

import UIKit

private let heightOfLogoBlock = UIScreen.main.bounds.height / 20    //define the height of the logo block
private let heightOfPriceBlock = UIScreen.main.bounds.height / 20  //define the height of the price block

class PropertyCell: UICollectionViewCell {
    
    @IBOutlet weak var logoBlockView: UIView!
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var logoBlockViewHeight: NSLayoutConstraint!
    @IBOutlet weak var priceBlockViewHeight: NSLayoutConstraint!
    @IBOutlet weak var savePropertyButton: UIButton!
    private let dbService = DataService()
    var dataFromServer: DataFormat?
    
    var property: Property? {
        didSet {
            //set the heights of logo block and price block
            logoBlockViewHeight.constant = heightOfLogoBlock
            priceBlockViewHeight.constant = heightOfPriceBlock
            
            //set the logo back ground color
            if let hexString = property?.agency?.brandingColors?.primary {
                logoBlockView.backgroundColor = UIColor(hex: hexString)
            } else {
                logoBlockView.backgroundColor = UIColor.white
            }
            
            //set logo image
            if let logoImageURL = property?.agency?.logo {
                logoImageView.imageFromServerURL(urlString: logoImageURL)
            } else {
                logoImageView.image = nil
            }
            
            //set main image
            if let mainImageURL = property?.mainImage {
                mainImageView.imageFromServerURL(urlString: mainImageURL)
            } else {
                mainImageView.image = nil
            }
            
            //set price
            if let price = property?.price {
                priceLabel.text = price
            } else {
                priceLabel.text = ""
            }
            
            //set favorite button image base on whether the property is in the "Saved Properties" list
            if dataFromServer?.containsProperty(property) ==  true {
                savePropertyButton.setImage(#imageLiteral(resourceName: "heartOn"), for: .normal)
            } else {
                savePropertyButton.setImage(#imageLiteral(resourceName: "heartOff"), for: .normal)
            }
        }
    }
    
    /**
     save or unsave the property into the "Saved Properties" list
     - parameters:
     - sender: the button itself
     */
    @IBAction func saveAndUnsave(_ sender: UIButton) {
        if sender.currentImage == #imageLiteral(resourceName: "heartOff") {
            //set it as favorite and add the property into "Saved Properties" list
            sender.setImage(#imageLiteral(resourceName: "heartOn"), for: .normal)
            dataFromServer?.addProperty(property)
        } else {
            //set it as unfavorite and remove the property from "Saved Properties" list
            sender.setImage(#imageLiteral(resourceName: "heartOff"), for: .normal)
            dataFromServer?.removeProperty(property)
        }
        
        //save the change into server
        dbService.saveData()
    }
    
}
