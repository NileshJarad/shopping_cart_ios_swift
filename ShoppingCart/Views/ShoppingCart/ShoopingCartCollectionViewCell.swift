//
//  ShoopingCartCollectionViewCell.swift
//  ShoppingCart
//
//  Created by Nilesh Jarad on 15/09/16.
//  Copyright © 2016 Nilesh Jarad. All rights reserved.
//

import UIKit

class ShoopingCartCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblRating: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var lblDiscountPrice: UILabel!
    @IBOutlet weak var lblDiscount: UILabel!
    @IBOutlet weak var imgBeer: UIImageView!
    
    
    func setItemData(shoppingCartModel: ShoppingCartModel) {
        lblName.text = shoppingCartModel.name
        lblRating.text = "Rating : \(shoppingCartModel.rating)"
        lblPrice.text = "\(shoppingCartModel.price) Rs"
        lblDiscountPrice.text = "\(shoppingCartModel.discountedPrice) Rs"
        
        imgBeer.image = UIImage(named: shoppingCartModel.imageName)
        
        
        let priceStr = "\(shoppingCartModel.price) Rs"
        
        if shoppingCartModel.discountPer == 0{
            lblDiscount.hidden = true
            lblDiscountPrice.hidden = true
            lblDiscountPrice.removeFromSuperview()
            lblPrice.text = priceStr
        }else {
            lblDiscount.text = "\(shoppingCartModel.discountPer) %"
            let attributeString: NSMutableAttributedString =  NSMutableAttributedString(string:priceStr )
            attributeString.addAttribute(NSStrikethroughStyleAttributeName, value: 2, range: NSMakeRange(0, attributeString.length))
            lblPrice.attributedText = attributeString
            lblDiscountPrice.text = "\(shoppingCartModel.discountedPrice) Rs"
        }

    }
}
