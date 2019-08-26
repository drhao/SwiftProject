//
//  ViewController.swift
//  HelloUIImageView
//
//  Created by drhao on 2019/8/11.
//  Copyright © 2019 HaoStudio. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var myPet: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        myPet.image = UIImage(named: "MyCat")
        //myPet.image = MyCay
        
    }


}

