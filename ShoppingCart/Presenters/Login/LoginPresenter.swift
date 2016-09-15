//
//  LoginPresenter.swift
//  ShoppingCart
//
//  Created by Nilesh Jarad on 14/09/16.
//  Copyright © 2016 Nilesh Jarad. All rights reserved.
//

import Foundation


protocol LoginView {
    func showErrorMessage(errorMessage: String)
    func showSuccessMessage(success: String)
    func intializeViewAndDelegate()
}

class LoginPresenter{
    
    var loginView :LoginView
    
    init(loginView:LoginView){
        self.loginView = loginView;
        
    }
    
    func startInitialization() {
        self.loginView.intializeViewAndDelegate()
    }
    
    func doValidation(userName : String , pasword :String) {
        if userName != pasword {
            loginView.showErrorMessage("Your username or password is incorrect")
            return
        }
        loginView.showSuccessMessage("Login Successful")
    }
    
    
}