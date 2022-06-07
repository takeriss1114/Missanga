//
//  ProfileViewController.swift
//  MyProduct
//
//  Created by 赤池春輝 on 2020/09/05.
//  Copyright © 2020 com.beneif. All rights reserved.
//

import UIKit
import NCMB
import NYXImagesKit

class ProfileViewController: UIViewController, UITableViewDataSource, UIImagePickerControllerDelegate, UINavigationControllerDelegate, ProfileTableViewCellDelegate {
    
    func didTapEditButton(tableViewCell: UITableViewCell, button: UIButton) {
        let groupACL = NCMBACL()
        let user = NCMBUser()
        let currentUser = NCMBUser.current()
        //会員本人（currentUser）の権限
        //for: userは、自分（currentUser）に対してacl情報を書き換える
        groupACL.setReadAccess(true, for: currentUser)
        groupACL.setWriteAccess(true, for: currentUser)
        //全てのユーザの権限
        //setPublicReadAccessをtrueにすれば他人の情報を取得可能！
        //基本的にsetPublicWriteAccessをtrueにすると、他人でもユーザ消したり、情報変更できてしまうから注意
        groupACL.setPublicReadAccess(true)
        groupACL.setPublicWriteAccess(false)
        //userクラスにこれまで設定してきたACL情報をセット
        user.acl = groupACL
        //userデータ(設定したacl情報)を保存する
        user.save(nil)
        self.performSegue(withIdentifier: "toEdit", sender: nil)
    }
    
    func didTapChangeImageButton(tableViewCell: UITableViewCell, button: UIButton) {
        let actionController = UIAlertController(title: "画像の選択", message: "選択してください", preferredStyle: .actionSheet)
        let cameraAction = UIAlertAction(title: "カメラ", style: .default) {
            (action) in
            //もしカメラが使えるなら
            if UIImagePickerController.isSourceTypeAvailable(.camera) == true {
                //カメラ起動
                let picker = UIImagePickerController()
                picker.sourceType = .camera
                picker.delegate = self
                self.present(picker, animated: true, completion: nil)
            } else {
                print("この端末ではカメラが使えません")
            }
        }
        let albumAction = UIAlertAction(title: "フォトライブラリ", style: .default) { (action) in
            //フォトライブラリが使えるなら
            if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) == true {
                //フォトライブラリ起動
                let picker = UIImagePickerController()
                picker.sourceType = .photoLibrary
                picker.delegate = self
                self.present(picker, animated: true, completion: nil)
            } else {
                print("この端末ではフォトライブラリが使えません")
            }
        }
        let cancelAction = UIAlertAction(title: "キャンセル", style: .default) { (action) in
            actionController.dismiss(animated: true, completion: nil)
        }
        actionController.addAction(cameraAction)
        actionController.addAction(albumAction)
        actionController.addAction(cancelAction)
        self.present(actionController, animated: true, completion: nil)
    }
    
    func didTapLogoutButton(tableViewCell: UITableViewCell, button: UIButton) {
        let storyboard = UIStoryboard(name: "LogIn", bundle: Bundle.main)
        let rootViewController = storyboard.instantiateViewController(withIdentifier: "RootNavigationController")
        UIApplication.shared.keyWindow?.rootViewController = rootViewController
        
        let ud = UserDefaults.standard
        ud.set(false, forKey: "isLogin")
        ud.synchronize()
    }
    
    @IBOutlet var profileTableView: UITableView!
    
    var userImageView: UIImageView!
    
    var nameLabel: UILabel?
    var ageLabel: UILabel?
    var areaLabel: UILabel?
    var contactLabel: UILabel?
    var occupationLabel: UILabel?
    var heightLabel: UILabel?
    var bodyLabel: UILabel?
    var sakeLabel: UILabel?
    var tobaccoLabel: UILabel?
    var piasLabel: UILabel?
    var personalLabel: UILabel?
    var hobbyLabel: UILabel?
    var artLabrl: UILabel?
    var commentTextView: UITextView?

    override func viewDidLoad() {
        super.viewDidLoad()
 
        profileTableView.rowHeight = 1300
        
        profileTableView.dataSource = self
        
        profileTableView.tableFooterView = UIView()
        
        let nib = UINib(nibName: "ProfileTableViewCell", bundle: Bundle.main)
        profileTableView.register(nib, forCellReuseIdentifier: "profileCell")
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        if let user = NCMBUser.current() {
            nameLabel?.text = user.object(forKey: "name") as? String
            ageLabel?.text = user.object(forKey: "age") as? String
            areaLabel?.text = user.object(forKey: "area") as? String
            contactLabel?.text = user.object(forKey: "contact") as? String
            occupationLabel?.text = user.object(forKey: "occupation") as? String
            heightLabel?.text = user.object(forKey: "height") as? String
            bodyLabel?.text = user.object(forKey: "body") as? String
            sakeLabel?.text = user.object(forKey: "sake") as? String
            tobaccoLabel?.text = user.object(forKey: "tobacco") as? String
            piasLabel?.text = user.object(forKey: "pias") as? String
            personalLabel?.text = user.object(forKey: "personal") as? String
            hobbyLabel?.text = user.object(forKey: "hobby") as? String
            artLabrl?.text = user.object(forKey: "art") as? String
            commentTextView?.text = user.object(forKey: "comment") as? String
        } else {
            let storyboard = UIStoryboard(name: "LogIn", bundle: Bundle.main)
            let rootViewController = storyboard.instantiateViewController(withIdentifier: "RootLogInController")
            UIApplication.shared.keyWindow?.rootViewController = rootViewController
        }
    }
 
 
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "profileCell") as! ProfileTableViewCell
        
        cell.delegate = self
        
        userImageView = cell.userImageView
        
        nameLabel = cell.nameLabel
        ageLabel = cell.ageLabel
        areaLabel = cell.areaLabel
        contactLabel = cell.contactLabel
        occupationLabel = cell.occupationLabel
        heightLabel = cell.heightLabel
        bodyLabel = cell.bodyLabel
        sakeLabel = cell.sakeLabel
        tobaccoLabel = cell.tobaccoLabel
        piasLabel = cell.piasLabel
        personalLabel = cell.personalLabel
        hobbyLabel = cell.hobbyLabel
        artLabrl = cell.artLabel
        commentTextView = cell.commentTextView

        return cell
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        //取ってきた写真を入れる
        let selectedImage = info[.originalImage] as! UIImage
        
        //画像のリサイズ
        let resizedImage = selectedImage.scale(byFactor: 0.3)
        
        picker.dismiss(animated: true, completion: nil)
        
        //画像データのアップロード
        let imageData = UIImage.pngData(resizedImage!)
        //let imageFile = NCMBFile.file(with: imageData()) as! NCMBFile
        //ユーザの名前でアップロード
        let imageFile = NCMBFile.file(withName: NCMBUser.current()?.objectId, data: imageData()) as! NCMBFile
        imageFile.saveInBackground({ (error) in
            if error != nil {
                print(error)
            } else {
                    self.userImageView.image = resizedImage
            }
        }) { (progress) in
            print(progress)
        }
    
    }
 
}


