//
//  ViewController.swift
//  HelloUIButton
//
//  Created by drhao on 2019/8/11.
//  Copyright © 2019 HaoStudio. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @objc func hitMe(_ thisButton:UIButton) {
        print("Yo!! What's up!?")
    }
    
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        print("Hello World!!")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let newButton = UIButton(type: .system)
        newButton.frame = CGRect(x: 50, y: 50, width: 100, height: 50)
        newButton.setTitle("Press", for: .normal)
        newButton.setTitle("Pressing", for: .highlighted)
        view.addSubview(newButton)
        newButton.addTarget(self, action: #selector(ViewController.hitMe(_:)), for: .touchUpInside)
        
        let anotherButton = UIButton(type: .custom)
        anotherButton.frame = CGRect(x: 200, y: 200, width: 114, height: 54)
        anotherButton.setImage(UIImage(named: "PlayButton"), for: .normal)
        anotherButton.setImage(UIImage(named: "PlayButtonPressed"), for: .highlighted)
        view.addSubview(anotherButton)
        anotherButton.addTarget(self, action: #selector(ViewController.hitMe(_:)), for: .touchUpInside)
        
        
    }


}

