//
//  LoginPresenterTest.swift
//  ShoppingCart
//
//  Created by Nilesh Jarad on 15/09/16.
//  Copyright © 2016 Nilesh Jarad. All rights reserved.
//

import XCTest
@testable import ShoppingCart

class LoginPresenterTest: XCTestCase {
    var loginViewMocked : LoginViewMocked!
    var loginPresenter : LoginPresenter!
    override func setUp() {
        super.setUp()
        loginViewMocked  = LoginViewMocked()
        loginPresenter = LoginPresenter(loginView: loginViewMocked)
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testUserNamePasswordWrong() {
        
        loginPresenter.doValidation("N@J", pasword: "J@N")
        XCTAssertTrue(loginViewMocked.showErrorMessageCalled)
        
    }
    
    //
    func testUserNamePasswordCorrect() {
        loginPresenter.doValidation("N@J", pasword: "N@J")
        XCTAssertTrue(loginViewMocked.showSuccessMessageCalled)
        
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
    
    
    /*
     # Mocked View classes
     */
    class LoginViewMocked : LoginView{
        var showErrorMessageCalled :Bool = false
        var showSuccessMessageCalled :Bool = false
        func showErrorMessage(errorMessage: String){
            self.showErrorMessageCalled = true
        }
        func showSuccessMessage(success: String){
            self.showSuccessMessageCalled = true
        }
        func intializeViewAndDelegate(){
            
        }
    }
    
}
