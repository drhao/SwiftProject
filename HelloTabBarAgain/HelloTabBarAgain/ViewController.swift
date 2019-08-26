//
//  ViewController.swift
//  HelloTabBarAgain
//
//  Created by drhao on 2019/8/18.
//  Copyright © 2019 HaoStudio. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        myLabel.text = "First view"
        if let secondViewController = self.tabBarController?.viewControllers?[1] as? NewViewController {
            secondViewController.messsageFromViewOne = "Hi"
        }
    }


}

