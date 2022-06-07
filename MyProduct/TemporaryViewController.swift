//
//  TemporaryViewController.swift
//  MyProduct
//
//  Created by 赤池春輝 on 2020/09/08.
//  Copyright © 2020 com.beneif. All rights reserved.
//

import UIKit

class TemporaryViewController: UIViewController {
    
    @IBOutlet var roundButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        roundButton.layer.cornerRadius = 45.0
    }
    
    @IBAction func back() {
        self.dismiss(animated: true, completion: nil)
    }

}
