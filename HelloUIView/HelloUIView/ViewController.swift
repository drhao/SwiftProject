//
//  ViewController.swift
//  HelloUIView
//
//  Created by drhao on 2019/8/9.
//  Copyright © 2019 HaoStudio. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var midRect: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        midRect.backgroundColor = UIColor.green
        midRect.alpha = 0.5
        midRect.isHidden = true
        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.orange
        view.viewWithTag(101)?.backgroundColor = UIColor.lightGray
        
        let viewArea = CGRect(x: 50, y: 400, width: 100, height: 50)
        let smallRect = UIView(frame: viewArea)
        smallRect.backgroundColor = UIColor.purple
        view.viewWithTag(101)?.addSubview(smallRect)
        
    }
}

