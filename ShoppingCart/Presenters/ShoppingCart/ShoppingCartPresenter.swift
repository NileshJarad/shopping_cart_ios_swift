//
//  File.swift
//  ShoppingCart
//
//  Created by Nilesh Jarad on 15/09/16.
//  Copyright © 2016 Nilesh Jarad. All rights reserved.
//

import Foundation

protocol ShoppingCartView {
    func intializeViewAndDelegate()
    func renderCartItems(shoppingCartList : [ShoppingCartModel])
}


class ShoppingCartPresenter {
    var shoppingCartList : [ShoppingCartModel] = []
    
    var view : ShoppingCartView!
    
    func attachView(view : ShoppingCartView){
        self.view = view
//        startInitialization()
    }
    
    
    func startInitialization()  {
        self.view.intializeViewAndDelegate()
    }
    
    func prepareCartList() {
        
        addBeerToList("Bud Light", imageName: "StubImage", rating: 5, price: 500, discountPer: 2)
        addBeerToList("Heineken", imageName: "StubImage", rating: 5, price: 400, discountPer: 1)
        addBeerToList("Budweiser", imageName: "StubImage", rating: 5, price: 250, discountPer: 5)
        addBeerToList("Asahi", imageName: "StubImage", rating: 5, price: 400, discountPer: 3)
        addBeerToList("Corona Extra", imageName: "StubImage", rating: 5, price: 330, discountPer: 1)
        addBeerToList("Tuborg", imageName: "StubImage", rating: 5, price: 170, discountPer: 2)
        addBeerToList("Carlsberg", imageName: "StubImage", rating: 5, price: 180, discountPer: 0)
        addBeerToList("hoggard", imageName: "StubImage", rating: 5, price: 400, discountPer: 3)
        
        view.renderCartItems(shoppingCartList)
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
        if per != 0{
            return price - (price * (Float(per)/100))
        }else{
            return price
        }
    }
    
}