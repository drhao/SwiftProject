//
//  ViewController.swift
//  HelloUISlider
//
//  Created by drhao on 2019/8/10.
//  Copyright © 2019 HaoStudio. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myLabel: UILabel!
    @IBAction func sliderChanged(_ sender: UISlider) {
        myLabel.text = "\(Int(sender.value))"
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

