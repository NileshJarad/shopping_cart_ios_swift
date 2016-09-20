//
//  ItemDetailsPresenter.swift
//  ShoppingCart
//
//  Created by Nilesh Jarad on 17/09/16.
//  Copyright © 2016 Nilesh Jarad. All rights reserved.
//

import Foundation


protocol ItemDetailsView {
    func setDataFromPreviousContoller(shoppingCartModel : ShoppingCartModel)
    
}


class ItemDetailsPresenter {
    var itemDetailsView : ItemDetailsView!
    
    func attachView(itemDetailsView : ItemDetailsView) {
        self.itemDetailsView = itemDetailsView
    }
    
    
    func setData(shoppingCartModel : ShoppingCartModel)  {
        self.itemDetailsView.setDataFromPreviousContoller(shoppingCartModel)
    }
    
}
