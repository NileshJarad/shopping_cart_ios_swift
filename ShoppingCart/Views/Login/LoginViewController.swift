//
//  LoginViewController.swift
//  ShoppingCart
//
//  Created by Nilesh Jarad on 14/09/16.
//  Copyright © 2016 Nilesh Jarad. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, LoginView, UITextFieldDelegate {
    
    @IBOutlet weak var txtUserName: UITextField!
    @IBOutlet weak var txtUserPassword: UITextField!
    
    var loginPresenter : LoginPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        loginPresenter = LoginPresenter(loginView: self)
        loginPresenter.startInitialization()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /**
     Login View Delegate methods start
     */
    
    func intializeViewAndDelegate(){
        txtUserName.delegate = self
        txtUserPassword.delegate = self
    }
    
    func showErrorMessage(errorMessage: String){
        showMessage(errorMessage)
    }
    func showSuccessMessage(success: String){
//        showMessage(success)
        ToastView.makeToast(self.view!,
                               text: "Login Successful", duration: 2.0)
    }
    
    /**
     Login View Delegate methods Ends
     */

    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
    private func showMessage(msg :String){
//        let alertView = UIAlertView(title: "Information", message: msg, delegate: nil, cancelButtonTitle: "OK")
//        alertView.show()
        
        let alertController = UIAlertController(title: "", message: msg, preferredStyle: UIAlertControllerStyle.Alert)
//        let DestructiveAction = UIAlertAction(title: "Destructive", style: UIAlertActionStyle.Destructive) { (result : UIAlertAction) -> Void in
//            print("Destructive")
//        }
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default) { (result : UIAlertAction) -> Void in
            print("OK")
        }
//        alertController.addAction(DestructiveAction)
        alertController.addAction(okAction)
        self.presentViewController(alertController, animated: true, completion: nil)
        
    }
    
    @IBAction func onLoginTapped(sender: UIButton) {
        loginPresenter.doValidation(txtUserName.text!, pasword: txtUserPassword.text!)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        //delegate method
        textField.resignFirstResponder()
        
        if(textField == txtUserName){
            txtUserPassword.becomeFirstResponder()
        }
        
        return true
    }
    
}
