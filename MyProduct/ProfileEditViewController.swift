//
//  ProfileEditViewController.swift
//  MyProduct
//
//  Created by 赤池春輝 on 2020/09/06.
//  Copyright © 2020 com.beneif. All rights reserved.
//

import UIKit
import NCMB

class ProfileEditViewController: UIViewController, UITableViewDataSource, UINavigationControllerDelegate, UITextFieldDelegate{
    
    @IBOutlet var editTableView: UITableView!
    
    var nameTextField: UITextField!
    var ageTextField: UITextField!
    var areaTextField: UITextField!
    var contactTextField: UITextField!
    var occupationTextField: UITextField!
    var heightTextField: UITextField!
    var bodyTextField: UITextField!
    var sakeTextField: UITextField!
    var tobaccoTextField: UITextField!
    var piasTextField: UITextField!
    var personalTextField: UITextField!
    var hobbyTextField: UITextField!
    var artTextField: UITextField!
    var sexTextField: UITextField!
    var sameTextField: UITextField!
    var commentTextView: UITextView!
    


    override func viewDidLoad() {
        super.viewDidLoad()

        editTableView.rowHeight = 1000
        
        editTableView.dataSource = self
        
        editTableView.tableFooterView = UIView()
        
        let nib = UINib(nibName: "ProfileEditTableViewCell", bundle: Bundle.main)
        editTableView.register(nib, forCellReuseIdentifier: "editCell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "editCell") as! ProfileEditTableViewCell

        nameTextField = cell.nameTextField
        ageTextField = cell.ageTextField
        areaTextField = cell.areaTextField
        contactTextField = cell.contactTextField
        occupationTextField = cell.occupationTextField
        heightTextField = cell.heightTextField
        bodyTextField = cell.bodyTextField
        sakeTextField = cell.sakeTextField
        tobaccoTextField = cell.tobaccoTextField
        piasTextField = cell.piasTextField
        personalTextField = cell.personalTextField
        hobbyTextField = cell.hobbyTextField
        artTextField = cell.artTextField
        sexTextField = cell.sexTextField
        sameTextField = cell.sameTextField
        commentTextView = cell.commentTextView
  
        return cell
    }
    
    @IBAction func cancel() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func OK() {
        if let user = NCMBUser.current() {
            user.setObject(nameTextField.text, forKey: "name")
            user.setObject(ageTextField.text, forKey: "age")
            user.setObject(areaTextField.text, forKey: "area")
            user.setObject(contactTextField.text, forKey: "contact")
            user.setObject(occupationTextField.text, forKey: "occupation")
            user.setObject(heightTextField.text, forKey: "height")
            user.setObject(bodyTextField.text, forKey: "body")
            user.setObject(sakeTextField.text, forKey: "sake")
            user.setObject(tobaccoTextField.text, forKey: "tobacco")
            user.setObject(piasTextField.text, forKey: "pias")
            user.setObject(personalTextField.text, forKey: "personal")
            user.setObject(hobbyTextField.text, forKey: "hobby")
            user.setObject(artTextField.text, forKey: "art")
            user.setObject(sexTextField.text, forKey: "sex")
            user.setObject(sameTextField.text, forKey: "same")
            user.setObject(commentTextView.text, forKey: "comment")
            user.saveInBackground({ (error) in
                if error != nil {
                    print(error)
                } else {
                    self.dismiss(animated: true, completion: nil)
                }
            })
        } else {
            let storyboard = UIStoryboard(name: "LogIn", bundle: Bundle.main)
            let rootViewController = storyboard.instantiateViewController(withIdentifier: "RootLogInController")
            UIApplication.shared.keyWindow?.rootViewController = rootViewController
        }
    }
}
