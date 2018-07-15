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

class ResultsCell: UICollectionViewCell {
    
    @IBOutlet weak var logoBlockView: UIView!
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var logoBlockViewHeight: NSLayoutConstraint!
    @IBOutlet weak var priceBlockViewHeight: NSLayoutConstraint!
    
    var property: Property? {
        didSet {
            //set image to nil first to remove reused cell setting
            logoImageView.image = nil
            mainImageView.image = nil
            
            logoBlockViewHeight.constant = heightOfLogoBlock
            priceBlockViewHeight.constant = heightOfPriceBlock
            
            if let hexString = property?.agency?.brandingColors?.primary {
                logoBlockView.backgroundColor = UIColor(hex: hexString)
            }
            if let logoImageURL = property?.agency?.logo {
                logoImageView.imageFromServerURL(urlString: logoImageURL)
            }
            if let mainImageURL = property?.mainImage {
                mainImageView.imageFromServerURL(urlString: mainImageURL)
            }
            if let price = property?.price {
                priceLabel.text = price
            }
        }
    }
    
    @IBAction func saveAndUnsave(_ sender: UIButton) {
        if sender.currentImage == #imageLiteral(resourceName: "heartOff") {
            sender.setImage(#imageLiteral(resourceName: "heartOn"), for: .normal)
        } else {
            sender.setImage(#imageLiteral(resourceName: "heartOff"), for: .normal)
        }
    }
    
}
