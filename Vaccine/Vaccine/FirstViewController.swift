//
//  FirstViewController.swift
//  Vaccine
//
//  Created by Hao on 2019/8/26.
//  Copyright © 2019 Hao. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var birthday: UIButton!
    @IBOutlet weak var birthdayDatePicker: UIDatePicker!
    
    @IBAction func inputBirthday(_ sender: UIButton) {
        birthdayDatePicker.isHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

