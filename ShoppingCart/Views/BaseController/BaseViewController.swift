//
//  BaseViewController.swift
//  ShoppingCart
//
//  Created by Nilesh Jarad on 20/09/16.
//  Copyright © 2016 Nilesh Jarad. All rights reserved.
//

import UIKit


class  BaseViewController: UIViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //
        //        let statusBarHeight = UIApplication.sharedApplication().statusBarFrame.size.height
        //
        //        let button = UIButton(type: .System) // let preferred over var here
        //        button.frame = CGRectMake(0, statusBarHeight, 100, 45)
        //        button.backgroundColor = UIColor.greenColor()
        //
        //        self.view.addSubview(button)
        
        // Do any additional setup after loading the view
        
    }
    
   
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    
    
    
    func printLog()-> Int{
        return 5
    }
    
    
    
    
    
    
    
}
