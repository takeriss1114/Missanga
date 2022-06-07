//
//  DetailViewController.swift
//  MyProduct
//
//  Created by 赤池春輝 on 2020/09/22.
//  Copyright © 2020 com.beneif. All rights reserved.
//

import UIKit
import NCMB
import Kingfisher

class DetailViewController: UIViewController, UITableViewDataSource, UINavigationControllerDelegate{
    
    @IBOutlet var detailTableView: UITableView!
    
    var nameLabel: String?
    var ageLabel: String?
    var areaLabel: String?
    var contactLabel: String?
    var occupationLabel: String?
    var heightLabel: String?
    var bodyLabel: String?
    var sakeLabel: String?
    var tobaccoLabel: String?
    var piasLabel: String?
    var personalLabel: String?
    var hobbyLabel: String?
    var artLabel: String?
    var commentLabel: String?
    
    var cellObjectId: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        detailTableView.rowHeight = 1000
        
        detailTableView.dataSource = self
        
        detailTableView.tableFooterView = UIView()
        
        let nib = UINib(nibName: "DetailTableViewCell", bundle: Bundle.main)
        detailTableView.register(nib, forCellReuseIdentifier: "detailCell")

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "detailCell") as! DetailTableViewCell
        cell.nameLabel.text = nameLabel
        cell.ageLabel.text = ageLabel
        cell.areaLabel.text = areaLabel
        cell.contactLabel.text = contactLabel
        cell.occupationLabel.text = occupationLabel
        cell.heightLabel.text = heightLabel
        cell.bodyLabel.text = bodyLabel
        cell.sakeLabel.text = sakeLabel
        cell.tobaccoLabel.text = tobaccoLabel
        cell.piasLabel.text = piasLabel
        cell.personalLabel.text = personalLabel
        cell.hobbyLabel.text = hobbyLabel
        cell.artLabel.text = artLabel
        cell.commentLabel.text = commentLabel
        let userImageUrl = "https://mbaas.api.nifcloud.com/2013-09-01/applications/xbS6RMjeVi2zmhvU/publicFiles/" + cellObjectId
        cell.userImageView.kf.setImage(with: URL(string: userImageUrl), placeholder: UIImage(named: "placeholder.png"))
        print(userImageUrl)
        return cell
    }

}
