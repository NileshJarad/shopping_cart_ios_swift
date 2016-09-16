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
        lblPrice.text = "Price : \(shoppingCartModel.price)"
        lblDiscountPrice.text = "\(shoppingCartModel.discountedPrice)"
        lblDiscount.text = "\(shoppingCartModel.discountPer) %"
        imgBeer.image = UIImage(named: shoppingCartModel.imageName)
    }
}
