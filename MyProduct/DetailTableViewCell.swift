//
//  DetailTableViewCell.swift
//  MyProduct
//
//  Created by 赤池春輝 on 2020/09/22.
//  Copyright © 2020 com.beneif. All rights reserved.
//

import UIKit
import NCMB

class DetailTableViewCell: UITableViewCell {
    
    @IBOutlet var profileView: UIView!
    @IBOutlet var userImageView: UIImageView!
    
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
    @IBOutlet var hobbyLabel: UILabel!
    @IBOutlet var artLabel: UILabel!
    @IBOutlet var commentLabel: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        profileView.layer.cornerRadius = 15.0
        userImageView.layer.cornerRadius = 50.0
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
