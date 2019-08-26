//
//  ViewController.swift
//  HelloUISegmentedControl
//
//  Created by drhao on 2019/8/10.
//  Copyright © 2019 HaoStudio. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func myToggleChanged(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            view.backgroundColor = .white
        case 1:
            view.backgroundColor = .black
        case 2:
            view.backgroundColor = .red
        case 3:
            view.backgroundColor = .orange
        case 4:
            view.backgroundColor = .yellow
        default:
            view.backgroundColor = .white
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

