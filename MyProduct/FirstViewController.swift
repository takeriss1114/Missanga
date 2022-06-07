//
//  FirstViewController.swift
//  MyProduct
//
//  Created by 赤池春輝 on 2020/09/04.
//  Copyright © 2020 com.beneif. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    @IBOutlet var roundButton1: UIButton!
    @IBOutlet var roundButton2: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        roundButton1.layer.cornerRadius = 45.0
        roundButton2.layer.cornerRadius = 45.0
        
    }
}
