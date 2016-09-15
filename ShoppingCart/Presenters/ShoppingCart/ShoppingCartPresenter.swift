//
//  File.swift
//  ShoppingCart
//
//  Created by Nilesh Jarad on 15/09/16.
//  Copyright © 2016 Nilesh Jarad. All rights reserved.
//

import Foundation

protocol ShoppingCartView {
    func renderCartList(shoppingCartList : [ShoppingCartModel])
}


class ShoppingCartPresenter {
    var shoppingCartList : [ShoppingCartModel] = []
    
    var view : ShoppingCartView!
    
    func attachView(view : ShoppingCartView){
        self.view = view
    }
    
    func prepareCartList() {
        addBeerToList("Bud Light", imageName: "Bud Light", rating: 5, price: 500, discountPer: 25)
        addBeerToList("Heineken", imageName: "Heineken", rating: 5, price: 400, discountPer: 50)
        addBeerToList("Budweiser", imageName: "Budweiser", rating: 5, price: 300, discountPer: 50)
        
        view.renderCartList(shoppingCartList)
    }
    
    func addBeerToList(beerName : String ,imageName : String, rating : Float, price : Float, discountPer : Int) {
        let beer : ShoppingCartModel = ShoppingCartModel()
        beer.name = beerName
        beer.imageName = imageName
        beer.rating  = rating
        beer.price = price
        beer.discountPer  = discountPer
        beer.discountedPrice  = getDiscountedPrice(price,per: discountPer)
        shoppingCartList.append(beer)
    }
    
    func getDiscountedPrice(price : Float, per : Int) -> Float! {
        return price - (price * (Float(per)/100))
    }
    
}