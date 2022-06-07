//
//  OpponentTableViewCell.swift
//  MyProduct
//
//  Created by 赤池春輝 on 2020/09/22.
//  Copyright © 2020 com.beneif. All rights reserved.
//

import UIKit
import NCMB

class OpponentTableViewCell: UITableViewCell {
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var ageLabel: UILabel!
    @IBOutlet var areaLabel: UILabel!
    @IBOutlet var commentTextView: UITextView!
    @IBOutlet var userImage: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        userImage.layer.cornerRadius = 50.0
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
