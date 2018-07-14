//
//  ResultsCell.swift
//  REA_UI_Development
//
//  Created by *** on 7/14/18.
//  Copyright © 2018 8184. All rights reserved.
//

import UIKit

class ResultsCell: UICollectionViewCell {
    @IBOutlet weak var logoBackground: UIView!
    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var mainImage: UIImageView!
    @IBOutlet weak var priceLabel: UILabel!
    var property: Property? {
        didSet {
            //set image to nil first to remove reused cell setting
            logoImage.image = nil
            mainImage.image = nil
            
            if let hexString = property?.agency?.brandingColors?.primary {
                logoBackground.backgroundColor = UIColor(hex: hexString)
            }
            if let logoImageURL = property?.agency?.logo {
                logoImage.imageFromServerURL(urlString: logoImageURL)
            }
            if let mainImageURL = property?.mainImage {
                mainImage.imageFromServerURL(urlString: mainImageURL)
            }
            if let price = property?.price {
                priceLabel.text = price
            }
        }
    }
}
