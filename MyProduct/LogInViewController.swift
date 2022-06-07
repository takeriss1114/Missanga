//
//  LogInViewController.swift
//  MyProduct
//
//  Created by 赤池春輝 on 2020/09/04.
//  Copyright © 2020 com.beneif. All rights reserved.
//

import UIKit
import NCMB

class LogInViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var roundButton: UIButton!
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailTextField.delegate = self
        passwordTextField.delegate = self
        
        roundButton.layer.cornerRadius = 45.0
        
        errorLabel.text = ""
        
        passwordTextField.isSecureTextEntry = true
    }
    
    @IBAction func back() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func signIn() {
 
        if (emailTextField.text?.count)! > 0 && (passwordTextField.text?.count)! > 0{
            NCMBUser.logInWithMailAddress(inBackground: emailTextField.text!, password: passwordTextField.text!) { (user, error) in
                if error != nil {
                    self.errorLabel.text = "メールアドレスかパスワードが間違っています"
                } else {
                    let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
                    let rootViewController = storyboard.instantiateViewController(withIdentifier: "RootTabBarController")
                    UIApplication.shared.keyWindow?.rootViewController = rootViewController
                    
                    let ud = UserDefaults.standard
                    ud.set(true, forKey: "isLogin")
                    ud.synchronize()
                }
            }
        }
    }
    
}
