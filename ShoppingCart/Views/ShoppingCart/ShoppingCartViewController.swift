//
//  ShoppingCartViewController.swift
//  ShoppingCart
//
//  Created by Nilesh Jarad on 15/09/16.
//  Copyright © 2016 Nilesh Jarad. All rights reserved.
//

import UIKit

class ShoppingCartViewController: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, ShoppingCartView {
    
    @IBOutlet weak var collectionViewShoppingCart: UICollectionView!
    var shoppingCartPresenter : ShoppingCartPresenter!
    var shoppingCartItems : [ShoppingCartModel] = []
    var cellIdentifier : String = "shoppingCarItem"
    var segueIdentifierForDetailPage : String = "showDetailPage"
    
    var selectedItemModel : ShoppingCartModel!
    
    var screenWidth : CGFloat!
    var screenHeight : CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        shoppingCartPresenter = ShoppingCartPresenter()
        shoppingCartPresenter.attachView(self)
        shoppingCartPresenter.startInitialization()
    }
    
//    override func preferredStatusBarStyle() -> UIStatusBarStyle {
//        return .LightContent
//    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
     ShoppingCartView Delegate methods
     */
    func intializeViewAndDelegate(){
        
        self.automaticallyAdjustsScrollViewInsets = false
//        self.navigationController.navigationBar.barStyle = UIBarStyle.Black;
        
        screenWidth = UIScreen.mainScreen().bounds.size.width
        screenHeight = UIScreen.mainScreen().bounds.size.height
        
        shoppingCartPresenter.prepareCartList()
    }
    
    func renderCartItems(shoppingCartItems : [ShoppingCartModel]){
        
        self.shoppingCartItems = shoppingCartItems
        
        self.collectionViewShoppingCart.reloadData()
    }
    
    /*
     UICollectionViewDataSource Delegate methods
     */
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return shoppingCartItems.count
    }
    
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize{
        return CGSize(width: (screenWidth-8) / 2, height: 300)
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(cellIdentifier, forIndexPath: indexPath) as! ShoopingCartCollectionViewCell
        
        cell.setItemData(shoppingCartItems[indexPath.row])
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(6, 2, 2, 2)
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        self.selectedItemModel = shoppingCartItems[indexPath.row]
        self.performSegueWithIdentifier(segueIdentifierForDetailPage, sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
//        if (segue.identifier == "ShowDeal") {
            if let viewController: ItemDetailsViewController = segue.destinationViewController as? ItemDetailsViewController {
                viewController.itemDetailsModel = selectedItemModel
            }
    }
}
