//
//  ProfileTableViewCell.swift
//  MyProduct
//
//  Created by 赤池春輝 on 2020/09/12.
//  Copyright © 2020 com.beneif. All rights reserved.
//

import UIKit
import NCMB
import NYXImagesKit

protocol ProfileTableViewCellDelegate {
    func didTapEditButton(tableViewCell: UITableViewCell, button: UIButton)
    func didTapChangeImageButton(tableViewCell: UITableViewCell, button: UIButton)
    func didTapLogoutButton(tableViewCell: UITableViewCell, button: UIButton)
}

class ProfileTableViewCell: UITableViewCell, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var delegate: ProfileTableViewCellDelegate?
    
    @IBOutlet var profileView: UIView!
    @IBOutlet var roundButton: UIButton!
    @IBOutlet var userImageView: UIImageView!
    
    @IBOutlet var toEditButton: UIButton!
    @IBOutlet var changeImageButton: UIButton!
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var ageLabel: UILabel!
    @IBOutlet var areaLabel: UILabel!
    @IBOutlet var contactLabel: UILabel!
    @IBOutlet var occupationLabel: UILabel!
    @IBOutlet var heightLabel: UILabel!
    @IBOutlet var bodyLabel: UILabel!
    @IBOutlet var sakeLabel: UILabel!
    @IBOutlet var tobaccoLabel: UILabel!
    @IBOutlet var piasLabel: UILabel!
    @IBOutlet var personalLabel: UILabel!
    @IBOutlet var artLabel: UILabel!
    @IBOutlet var hobbyLabel: UILabel!
    
    @IBOutlet var commentTextView: UITextView!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        profileView.layer.cornerRadius = 15.0
        roundButton.layer.cornerRadius = 30.0
        userImageView.layer.cornerRadius = 50.0
  
        if let user = NCMBUser.current() {
            let file = NCMBFile.file(withName: user.objectId, data: nil) as! NCMBFile
            file.getDataInBackground { (data, error) in
                if error != nil {
                    print(error)
                } else {
                    if data != nil {
                        let image = UIImage(data: data!)
                        self.userImageView.image = image
                    }
                }
            }
        
            nameLabel.text = user.object(forKey: "name") as? String
            ageLabel.text = user.object(forKey: "age") as? String
            areaLabel.text = user.object(forKey: "area") as? String
            contactLabel.text = user.object(forKey: "contact") as? String
            occupationLabel.text = user.object(forKey: "occupation") as? String
            heightLabel.text = user.object(forKey: "height") as? String
            bodyLabel.text = user.object(forKey: "body") as? String
            sakeLabel.text = user.object(forKey: "sake") as? String
            tobaccoLabel.text = user.object(forKey: "tobacco") as? String
            piasLabel.text = user.object(forKey: "pias") as? String
            personalLabel.text = user.object(forKey: "personal") as? String
            hobbyLabel.text = user.object(forKey: "hobby") as? String
            artLabel.text = user.object(forKey: "art") as? String
            commentTextView.text = user.object(forKey: "comment") as? String
 
        } else {
            let storyboard = UIStoryboard(name: "LogIn", bundle: Bundle.main)
            let rootViewController = storyboard.instantiateViewController(withIdentifier: "RootLogInController")
            UIApplication.shared.keyWindow?.rootViewController = rootViewController
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func edit(button: UIButton) {
        self.delegate?.didTapEditButton(tableViewCell: self, button: button)
    }
    
    @IBAction func changeImage(button: UIButton) {
        self.delegate?.didTapChangeImageButton(tableViewCell: self, button: button)
    }
    
    @IBAction func logout(button: UIButton) {
        self.delegate?.didTapLogoutButton(tableViewCell: self, button: button)
    }
}
