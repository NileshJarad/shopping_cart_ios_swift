//
//  ShoppingCartPresenterTest.swift
//  ShoppingCart
//
//  Created by Nilesh Jarad on 15/09/16.
//  Copyright © 2016 Nilesh Jarad. All rights reserved.
//

import XCTest
@testable import ShoppingCart

class ShoppingCartPresenterTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testDiscountCalculation() {
        let shoppingCartPresenter  = ShoppingCartPresenter()
        XCTAssertEqual(75,shoppingCartPresenter.getDiscountedPrice(100,per: 25))
        
    }
    
    func testCartListCount(){
        let shoppingCartPresenter  = ShoppingCartPresenter()
        
        shoppingCartPresenter.addBeerToList("Bud Light", imageName: "Bud Light", rating: 5, price: 500, discountPer: 25)
        shoppingCartPresenter.addBeerToList("Heineken", imageName: "Heineken", rating: 5, price: 400, discountPer: 50)
        shoppingCartPresenter.addBeerToList("Budweiser", imageName: "Budweiser", rating: 5, price: 300, discountPer: 50)
        
        XCTAssertEqual(3, shoppingCartPresenter.shoppingCartList.count)
    }
    
    /*
     # Mocked classes
     */
    
}
