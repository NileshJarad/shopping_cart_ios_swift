//
//  ItemDetailsViewController.swift
//  ShoppingCart
//
//  Created by Nilesh Jarad on 17/09/16.
//  Copyright © 2016 Nilesh Jarad. All rights reserved.
//

import UIKit

class ItemDetailsViewController: UIViewController ,ItemDetailsView {
    
    @IBOutlet weak var btnDiscountPer: UIButton!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var imgItem: UIImageView!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var lblDiscountedPrice: UILabel!
    @IBOutlet weak var lblRating: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    
    var itemDetailsModel : ShoppingCartModel!
    
    var itemDetailsPresenter : ItemDetailsPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        itemDetailsPresenter = ItemDetailsPresenter()
        itemDetailsPresenter.attachView(self)
        itemDetailsPresenter.setData(itemDetailsModel)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }
    
    
    func setDataFromPreviousContoller(shoppingCartModel : ShoppingCartModel){
        lblName.text = shoppingCartModel.name
        lblRating.text = "Rating : \(shoppingCartModel.rating)"
    
        let priceStr = "\(shoppingCartModel.price) Rs"
        
        if shoppingCartModel.discountPer == 0{
            btnDiscountPer.hidden = true
            lblDiscountedPrice.hidden = true
            lblDiscountedPrice.removeFromSuperview()
            lblPrice.text = priceStr
        }else {
            btnDiscountPer.setTitle("\(shoppingCartModel.discountPer)%", forState: .Normal)
            
            let attributeString: NSMutableAttributedString =  NSMutableAttributedString(string:priceStr )
            attributeString.addAttribute(NSStrikethroughStyleAttributeName, value: 2, range: NSMakeRange(0, attributeString.length))
            lblPrice.attributedText = attributeString
            lblDiscountedPrice.text = "\(shoppingCartModel.discountedPrice) Rs"
        }
        imgItem.image = UIImage(named: shoppingCartModel.imageName)
        lblDescription.text = shoppingCartModel.itemDescription
    }
    
}
