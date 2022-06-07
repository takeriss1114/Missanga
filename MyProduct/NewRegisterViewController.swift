//
//  NewRegisterViewController.swift
//  MyProduct
//
//  Created by 赤池春輝 on 2020/09/04.
//  Copyright © 2020 com.beneif. All rights reserved.
//

import UIKit
import NCMB

class NewRegisterViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var roundButton: UIButton!
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var confirmTextField: UITextField!
    @IBOutlet var errorLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        roundButton.layer.cornerRadius = 45.0
        
        emailTextField.delegate = self
        confirmTextField.delegate = self
        
        errorLabel.text = ""
    }
    
    @IBAction func back() {
        self.dismiss(animated: true, completion: nil)
    }
    /*
    @IBAction func jump() {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let rootViewController = storyboard.instantiateViewController(withIdentifier: "RootTabBarController")
        UIApplication.shared.keyWindow?.rootViewController = rootViewController
    }
 */
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
 //メールアドレスログイン
    @IBAction func signUp() {
        if  emailTextField.text == confirmTextField.text && (emailTextField.text?.count)! > 0{
            NCMBUser.requestAuthenticationMail(emailTextField.text, error: nil)
            self.performSegue(withIdentifier: "toTemporary", sender: nil)
        } else {
            errorLabel.text = "メールアドレスが正しくありません"
        }
        
    }

}
