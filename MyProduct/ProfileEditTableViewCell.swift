//
//  ProfileEditTableViewCell.swift
//  MyProduct
//
//  Created by 赤池春輝 on 2020/09/15.
//  Copyright © 2020 com.beneif. All rights reserved.
//

import UIKit
import NCMB

class ProfileEditTableViewCell: UITableViewCell, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
    
    @IBOutlet var editView: UIView!
    
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var ageTextField: UITextField!
    @IBOutlet var areaTextField: UITextField!
    @IBOutlet var contactTextField: UITextField!
    @IBOutlet var occupationTextField: UITextField!
    @IBOutlet var heightTextField: UITextField!
    @IBOutlet var bodyTextField: UITextField!
    @IBOutlet var sakeTextField: UITextField!
    @IBOutlet var tobaccoTextField: UITextField!
    @IBOutlet var piasTextField: UITextField!
    @IBOutlet var personalTextField: UITextField!
    @IBOutlet var hobbyTextField: UITextField!
    @IBOutlet var artTextField: UITextField!
    @IBOutlet var sexTextField: UITextField!
    @IBOutlet var sameTextField: UITextField!
    @IBOutlet var commentTextView: UITextView!
    

    var agePickerView: UIPickerView = UIPickerView()
    //let ageList = ["", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35"]
    let ageList = ["人文学部", "法学部", "経済学部", "商学部", "商学部第二部", "理学部", "工学部", "医学部", "薬学部", "スポーツ科学部", "その他の大学"]
    
    var areaPickerView: UIPickerView = UIPickerView()
    //let areaList = ["日本経済大学", "香蘭女子短期大学", "第一薬科大学", "筑紫女学園大学", "精華女子短期大学", "純真学園大学", "九州共立大学", "久留米工業大学", "純真短期大学", "西日本短期大学", "福岡女子短期大学", "九州女子大学", "九州大谷短期大学", "福岡女学院大学", "九州産業大学", "西日本工業大学", "聖マリア学院大学", "折尾愛真短期大学", "九州女子短期大学", "福岡看護大学", "福岡医療短期大学", "福岡大学", "西南学院大学", "福岡工業大学", "帝京大学", "中村学園大学", "中村学園大学短期大学部", "九州職業能力開発大学校", "国際医療福祉大学", "西南女学院大学", "九州国際大学", "九州栄養福祉大学", "東筑紫短期大学", "近畿大学九州短期大学", "久留米大学", "福岡工業大学短期大学部", "福岡こども短期大学", "久留米信愛短期大学", "福岡女学院大学短期大学部", "福岡国際医療福祉大学", "九州情報大学", "九州産業大学造形短期大学部", "九州工業大学", "九州大学", "北九州市立大学", "福岡県立大学", "九州歯科大学", "福岡女子大学", "福岡教育大学", "近畿大学", "保健医療経営大学", "産業医科大学", "西南女学院大学短期大学部", "サイバー大学", "福岡歯科大学", "福岡女学院看護大学", "日本赤十字九州国際看護大学", "放送大学", "その他の大学"]
    let areaList = ["1年生", "2年生", "3年生", "4年生", "5年生", "6年生", "修士課程1年", "修士課程2年", "博士課程1年", "博士課程2年", "博士課程3年"]
    
    var occupationPickerView: UIPickerView = UIPickerView()
    //let occupationList = ["", "会社員", "医師", "弁護士", "経営者", "公務員", "事務員", "大手商社", "公認会計士", "外資金融", "大手企業", "大手外資", "クリエイター", "IT関連", "パイロット", "客室乗務員", "芸能・モデル", "アパレル", "アナウンサー", "イベントコンパニオン", "受付", "秘書", "看護師", "保育士", "自由業", "学生", "その他"]
    let occupationList = ["","実家","一人暮らし"]
    
    var heightPickerView: UIPickerView = UIPickerView()
    let heightList = ["", "140cm", "141cm", "142cm", "143cm", "144cm", "145cm", "146cm", "147cm", "148cm", "149cm", "150cm", "151cm", "152cm", "153cm", "154cm", "155cm", "156cm", "157cm", "158cm", "159cm", "160cm", "161cm", "162cm", "163cm", "164cm", "165cm", "166cm", "167cm", "168cm", "169cm", "170cm", "171cm", "172cm", "173cm", "174cm", "175cm", "176cm", "177cm", "178cm", "179cm", "180cm", "181cm", "182cm", "183cm", "184cm", "185cm", "186cm", "187cm", "188cm", "189cm", "190cm",]
    
    var bodyPickerView: UIPickerView = UIPickerView()
    let bodyList = ["", "スリム", "やや細め", "普通", "グラマー", "ムキムキ", "ぽっちゃり"]
    
    var tobaccoPickerView: UIPickerView = UIPickerView()
    let tobaccoList = ["", "吸う", "吸わない"]
    
    var sakePickerView: UIPickerView = UIPickerView()
    let sakeList = ["", "よく飲む", "ときどき飲む", "飲まない"]
    
    var piasPickerView: UIPickerView = UIPickerView()
    let piasList = ["", "着ける", "着けない"]
    
    var personalPickerView: UIPickerView = UIPickerView()
    //let personalList = ["", "さみしがり", "いじっぱり", "やんちゃ", "ゆうかん", "ずぶとい", "わんぱく", "のうてんき", "のんき", "ひかえめ", "おっとり", "うっかりや", "れいせい", "おだやか", "おとなしい", "しんちょう", "なまいき", "おくびょう", "せっかち", "ようき", "むじゃき", "てれや", "がんばりや", "すなお", "きまぐれ"]
    let personalList = ["", "第一食堂", "第二食堂", "第三食堂", "第六食堂", "第七食堂", "スカイラウンジ", "陽だまり", "モスバーガー"]
    
    var sexPickerView: UIPickerView = UIPickerView()
    let sexList = ["男性", "女性"]
    
    var samePickerView: UIPickerView = UIPickerView()
    let sameList = ["する", "しない"]

    override func awakeFromNib() {
        super.awakeFromNib()
        
        nameTextField.delegate = self
        ageTextField.delegate = self
        areaTextField.delegate = self
        contactTextField.delegate = self
        occupationTextField.delegate = self
        heightTextField.delegate = self
        bodyTextField.delegate = self
        sakeTextField.delegate = self
        tobaccoTextField.delegate = self
        piasTextField.delegate = self
        personalTextField.delegate = self
        hobbyTextField.delegate = self
        artTextField.delegate = self
        sexTextField.delegate = self
        sameTextField.delegate = self
        
        if let user = NCMBUser.current() {
            nameTextField.text = user.object(forKey: "name") as? String
            ageTextField.text = user.object(forKey: "age") as? String
            areaTextField.text = user.object(forKey: "area") as? String
            contactTextField.text = user.object(forKey: "contact") as? String
            occupationTextField.text = user.object(forKey: "occupation") as? String
            heightTextField.text = user.object(forKey: "height") as? String
            bodyTextField.text = user.object(forKey: "body") as? String
            sakeTextField.text = user.object(forKey: "sake") as? String
            tobaccoTextField.text = user.object(forKey: "tobacco") as? String
            piasTextField.text = user.object(forKey: "pias") as? String
            personalTextField.text = user.object(forKey: "personal") as? String
            hobbyTextField.text = user.object(forKey: "hobby") as? String
            artTextField.text = user.object(forKey: "art") as? String
            sexTextField.text = user.object(forKey: "sex") as? String
            sameTextField.text = user.object(forKey: "same") as? String
            commentTextView.text = user.object(forKey: "comment") as? String
        } else {
            let storyboard = UIStoryboard(name: "LogIn", bundle: Bundle.main)
            let rootViewController = storyboard.instantiateViewController(withIdentifier: "RootLogInController")
            UIApplication.shared.keyWindow?.rootViewController = rootViewController
        }
        
        editView.layer.cornerRadius = 15.0
        
        //agepicker
        agePickerView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: agePickerView.bounds.size.height)
        agePickerView.tag = 1
        agePickerView.delegate   = self
        agePickerView.dataSource = self
        
        let vi1 = UIView(frame: agePickerView.bounds)
        vi1.backgroundColor = UIColor.white
        vi1.addSubview(agePickerView)
        
        ageTextField!.inputView = vi1
        
        let toolBar1 = UIToolbar()
        toolBar1.barStyle = UIBarStyle.default
        toolBar1.isTranslucent = true
        toolBar1.tintColor = UIColor.black
        let doneButton1   = UIBarButtonItem(title: "Done", style: UIBarButtonItem.Style.done, target: self, action: #selector(ProfileEditTableViewCell.donePressedAge))
        let spaceButton1  = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        toolBar1.setItems([spaceButton1, doneButton1], animated: false)
        toolBar1.isUserInteractionEnabled = true
        toolBar1.sizeToFit()
        ageTextField!.inputAccessoryView = toolBar1
        
        //areapicker
        areaPickerView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: agePickerView.bounds.size.height)
        areaPickerView.tag = 2
        areaPickerView.delegate   = self
        areaPickerView.dataSource = self
        
        let vi2 = UIView(frame: areaPickerView.bounds)
        vi2.backgroundColor = UIColor.white
        vi2.addSubview(areaPickerView)
        
        areaTextField!.inputView = vi2
        
        let toolBar2 = UIToolbar()
        toolBar2.barStyle = UIBarStyle.default
        toolBar2.isTranslucent = true
        toolBar2.tintColor = UIColor.black
        let doneButton2   = UIBarButtonItem(title: "Done", style: UIBarButtonItem.Style.done, target: self, action: #selector(ProfileEditTableViewCell.donePressedArea))
        let spaceButton2  = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        toolBar2.setItems([spaceButton2, doneButton2], animated: false)
        toolBar2.isUserInteractionEnabled = true
        toolBar2.sizeToFit()
        areaTextField!.inputAccessoryView = toolBar2
        
        //occupationpucker
        occupationPickerView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: occupationPickerView.bounds.size.height)
        occupationPickerView.tag = 3
        occupationPickerView.delegate   = self
        occupationPickerView.dataSource = self
        
        let vi3 = UIView(frame: occupationPickerView.bounds)
        vi3.backgroundColor = UIColor.white
        vi3.addSubview(occupationPickerView)
        
        occupationTextField!.inputView = vi3
        
        let toolBar3 = UIToolbar()
        toolBar3.barStyle = UIBarStyle.default
        toolBar3.isTranslucent = true
        toolBar3.tintColor = UIColor.black
        let doneButton3   = UIBarButtonItem(title: "Done", style: UIBarButtonItem.Style.done, target: self, action: #selector(ProfileEditTableViewCell.donePressedOccupation))
        let spaceButton3  = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        toolBar3.setItems([spaceButton3, doneButton3], animated: false)
        toolBar3.isUserInteractionEnabled = true
        toolBar3.sizeToFit()
        occupationTextField!.inputAccessoryView = toolBar3
        
        //heightpicker
        heightPickerView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: heightPickerView.bounds.size.height)
        heightPickerView.tag = 4
        heightPickerView.delegate   = self
        heightPickerView.dataSource = self
        
        let vi4 = UIView(frame: heightPickerView.bounds)
        vi4.backgroundColor = UIColor.white
        vi4.addSubview(heightPickerView)
        
        heightTextField!.inputView = vi4
        
        let toolBar4 = UIToolbar()
        toolBar4.barStyle = UIBarStyle.default
        toolBar4.isTranslucent = true
        toolBar4.tintColor = UIColor.black
        let doneButton4   = UIBarButtonItem(title: "Done", style: UIBarButtonItem.Style.done, target: self, action: #selector(ProfileEditTableViewCell.donePressedHeight))
        let spaceButton4  = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        toolBar4.setItems([spaceButton4, doneButton4], animated: false)
        toolBar4.isUserInteractionEnabled = true
        toolBar4.sizeToFit()
        heightTextField!.inputAccessoryView = toolBar4
        
        //bodypicker
        bodyPickerView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: bodyPickerView.bounds.size.height)
        bodyPickerView.tag = 5
        bodyPickerView.delegate   = self
        bodyPickerView.dataSource = self
        
        let vi5 = UIView(frame: bodyPickerView.bounds)
        vi5.backgroundColor = UIColor.white
        vi5.addSubview(bodyPickerView)
        
        bodyTextField!.inputView = vi5
        
        let toolBar5 = UIToolbar()
        toolBar5.barStyle = UIBarStyle.default
        toolBar5.isTranslucent = true
        toolBar5.tintColor = UIColor.black
        let doneButton5   = UIBarButtonItem(title: "Done", style: UIBarButtonItem.Style.done, target: self, action: #selector(ProfileEditTableViewCell.donePressedBody))
        let spaceButton5  = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        toolBar5.setItems([spaceButton5, doneButton5], animated: false)
        toolBar5.isUserInteractionEnabled = true
        toolBar5.sizeToFit()
        bodyTextField!.inputAccessoryView = toolBar5
        
        //tobaccopicker
        tobaccoPickerView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: tobaccoPickerView.bounds.size.height)
        tobaccoPickerView.tag = 6
        tobaccoPickerView.delegate   = self
        tobaccoPickerView.dataSource = self
        
        let vi6 = UIView(frame: tobaccoPickerView.bounds)
        vi6.backgroundColor = UIColor.white
        vi6.addSubview(tobaccoPickerView)
        
        tobaccoTextField!.inputView = vi6
        
        let toolBar6 = UIToolbar()
        toolBar6.barStyle = UIBarStyle.default
        toolBar6.isTranslucent = true
        toolBar6.tintColor = UIColor.black
        let doneButton6   = UIBarButtonItem(title: "Done", style: UIBarButtonItem.Style.done, target: self, action: #selector(ProfileEditTableViewCell.donePressedTobacco))
        let spaceButton6  = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        toolBar6.setItems([spaceButton6, doneButton6], animated: false)
        toolBar6.isUserInteractionEnabled = true
        toolBar6.sizeToFit()
        tobaccoTextField!.inputAccessoryView = toolBar6
        
        //sakepicker
        sakePickerView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: sakePickerView.bounds.size.height)
        sakePickerView.tag = 7
        sakePickerView.delegate   = self
        sakePickerView.dataSource = self
        
        let vi7 = UIView(frame: sakePickerView.bounds)
        vi7.backgroundColor = UIColor.white
        vi7.addSubview(sakePickerView)
        
        sakeTextField!.inputView = vi7
        
        let toolBar7 = UIToolbar()
        toolBar7.barStyle = UIBarStyle.default
        toolBar7.isTranslucent = true
        toolBar7.tintColor = UIColor.black
        let doneButton7   = UIBarButtonItem(title: "Done", style: UIBarButtonItem.Style.done, target: self, action: #selector(ProfileEditTableViewCell.donePressedSake))
        let spaceButton7  = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        toolBar7.setItems([spaceButton7, doneButton7], animated: false)
        toolBar7.isUserInteractionEnabled = true
        toolBar7.sizeToFit()
        sakeTextField!.inputAccessoryView = toolBar7
        
        //piaspicker
        piasPickerView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: sakePickerView.bounds.size.height)
        piasPickerView.tag = 11
        piasPickerView.delegate   = self
        piasPickerView.dataSource = self
        
        let vi11 = UIView(frame: piasPickerView.bounds)
        vi11.backgroundColor = UIColor.white
        vi11.addSubview(piasPickerView)
        
        piasTextField!.inputView = vi11
        
        let toolBar11 = UIToolbar()
        toolBar11.barStyle = UIBarStyle.default
        toolBar11.isTranslucent = true
        toolBar11.tintColor = UIColor.black
        let doneButton11   = UIBarButtonItem(title: "Done", style: UIBarButtonItem.Style.done, target: self, action: #selector(ProfileEditTableViewCell.donePressedPias))
        let spaceButton11  = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        toolBar11.setItems([spaceButton11, doneButton11], animated: false)
        toolBar11.isUserInteractionEnabled = true
        toolBar11.sizeToFit()
        piasTextField!.inputAccessoryView = toolBar11
        
        //personalpicker
        personalPickerView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: personalPickerView.bounds.size.height)
        personalPickerView.tag = 8
        personalPickerView.delegate   = self
        personalPickerView.dataSource = self
        
        let vi8 = UIView(frame: personalPickerView.bounds)
        vi8.backgroundColor = UIColor.white
        vi8.addSubview(personalPickerView)
        
        personalTextField!.inputView = vi8
        
        let toolBar8 = UIToolbar()
        toolBar8.barStyle = UIBarStyle.default
        toolBar8.isTranslucent = true
        toolBar8.tintColor = UIColor.black
        let doneButton8   = UIBarButtonItem(title: "Done", style: UIBarButtonItem.Style.done, target: self, action: #selector(ProfileEditTableViewCell.donePressedPersonal))
        let spaceButton8  = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        toolBar8.setItems([spaceButton8, doneButton8], animated: false)
        toolBar8.isUserInteractionEnabled = true
        toolBar8.sizeToFit()
        personalTextField!.inputAccessoryView = toolBar8
        
        //sexpicker
        sexPickerView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: sexPickerView.bounds.size.height)
        sexPickerView.tag = 9
        sexPickerView.delegate   = self
        sexPickerView.dataSource = self
        
        let vi9 = UIView(frame: sexPickerView.bounds)
        vi9.backgroundColor = UIColor.white
        vi9.addSubview(sexPickerView)
        
        sexTextField!.inputView = vi9
        
        let toolBar9 = UIToolbar()
        toolBar9.barStyle = UIBarStyle.default
        toolBar9.isTranslucent = true
        toolBar9.tintColor = UIColor.black
        let doneButton9   = UIBarButtonItem(title: "Done", style: UIBarButtonItem.Style.done, target: self, action: #selector(ProfileEditTableViewCell.donePressedSex))
        let spaceButton9  = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        toolBar9.setItems([spaceButton9, doneButton9], animated: false)
        toolBar9.isUserInteractionEnabled = true
        toolBar9.sizeToFit()
        sexTextField!.inputAccessoryView = toolBar9
        
        //samepicker
        samePickerView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: samePickerView.bounds.size.height)
        samePickerView.tag = 10
        samePickerView.delegate   = self
        samePickerView.dataSource = self
        
        let vi10 = UIView(frame: samePickerView.bounds)
        vi10.backgroundColor = UIColor.white
        vi10.addSubview(samePickerView)
        
        sameTextField!.inputView = vi10
        
        let toolBar10 = UIToolbar()
        toolBar10.barStyle = UIBarStyle.default
        toolBar10.isTranslucent = true
        toolBar10.tintColor = UIColor.black
        let doneButton10   = UIBarButtonItem(title: "Done", style: UIBarButtonItem.Style.done, target: self, action: #selector(ProfileEditTableViewCell.donePressedSame))
        let spaceButton10  = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        toolBar10.setItems([spaceButton10, doneButton10], animated: false)
        toolBar10.isUserInteractionEnabled = true
        toolBar10.sizeToFit()
        sameTextField!.inputAccessoryView = toolBar10
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @objc func donePressedAge() {
        self.ageTextField!.endEditing(true)
    }
    
    @objc func donePressedArea() {
        self.areaTextField!.endEditing(true)
    }
    
    @objc func donePressedOccupation() {
        self.occupationTextField!.endEditing(true)
    }
    
    @objc func donePressedHeight() {
        self.heightTextField!.endEditing(true)
    }
    
    @objc func donePressedBody() {
        self.bodyTextField!.endEditing(true)
    }
    
    @objc func donePressedTobacco() {
        self.tobaccoTextField!.endEditing(true)
    }
    
    @objc func donePressedSake() {
        self.sakeTextField!.endEditing(true)
    }
    
    @objc func donePressedPias() {
        self.piasTextField!.endEditing(true)
    }
    
    @objc func donePressedPersonal() {
        self.personalTextField!.endEditing(true)
    }
    
    @objc func donePressedSex() {
        self.sexTextField!.endEditing(true)
    }
    
    @objc func donePressedSame() {
        self.sameTextField!.endEditing(true)
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView.tag == 1 {    // <<<<<<<<<<　変更
            return ageList[row]
        } else if pickerView.tag == 2{
            return areaList[row]
        } else if pickerView.tag == 3{
            return occupationList[row]
        } else if pickerView.tag == 4{
            return heightList[row]
        } else if pickerView.tag == 5{
            return bodyList[row]
        } else if pickerView.tag == 6{
            return tobaccoList[row]
        } else if pickerView.tag == 7{
            return sakeList[row]
        } else if pickerView.tag == 8{
            return personalList[row]
        } else if pickerView.tag == 9{
            return sexList[row]
        } else if pickerView.tag == 10{
            return sameList[row]
        } else {
            return piasList[row]
        }
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView.tag == 1 {     // <<<<<<<<<<　変更
            return ageList.count
        } else if pickerView.tag == 2{
            return areaList.count
        } else if pickerView.tag == 3{
            return occupationList.count
        } else if pickerView.tag == 4{
            return heightList.count
        } else if pickerView.tag == 5 {
            return bodyList.count
        } else if pickerView.tag == 6{
            return tobaccoList.count
        } else if pickerView.tag == 7{
            return sakeList.count
        } else if pickerView.tag == 8{
            return personalList.count
        } else if pickerView.tag == 9{
            return sexList.count
        } else if pickerView.tag == 10{
            return sameList.count
        } else {
            return piasList.count
        }
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView.tag == 1 {      // <<<<<<<<<<　変更
            ageTextField!.text = ageList[row]
        } else if pickerView.tag == 2{
            areaTextField!.text = areaList[row]
        } else if pickerView.tag == 3{
            occupationTextField!.text = occupationList[row]
        } else if pickerView.tag == 4{
            heightTextField!.text =  heightList[row]
        } else if pickerView.tag == 5 {
            bodyTextField!.text =  bodyList[row]
        } else if pickerView.tag == 6{
            tobaccoTextField!.text = tobaccoList[row]
        } else if pickerView.tag == 7{
            sakeTextField!.text =  sakeList[row]
        } else if pickerView.tag == 8{
            personalTextField!.text =  personalList[row]
        } else if pickerView.tag == 9{
            sexTextField!.text =  sexList[row]
        } else if pickerView.tag == 10{
            sameTextField!.text = sameList[row]
        } else {
            piasTextField!.text = piasList[row]
        }
    }
}
