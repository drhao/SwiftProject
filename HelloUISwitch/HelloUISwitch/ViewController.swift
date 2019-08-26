//
//  ViewController.swift
//  HelloUISwitch
//
//  Created by drhao on 2019/8/10.
//  Copyright © 2019 HaoStudio. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mySwitch: UISwitch!
    
    @IBAction func makeAChange(_ sender: UISwitch) {
        if sender.isOn {
            print("it's on")
            view.backgroundColor = .white
        } else {
            print("it's off")
            view.backgroundColor = .black
        }
    }

    @objc func codeSwtichChanged(_ sender:UISwitch) {
        if sender.isOn {
            print("it's on")
            view.backgroundColor = .white
        } else {
            print("it's off")
            view.backgroundColor = .black
        }
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        mySwitch.isOn = false
        makeAChange(mySwitch)
        
        let codeSwitch = UISwitch(frame: CGRect(x: view.frame.midX - 51/2, y: view.frame.maxY - 100, width: 51, height: 31))
        view.addSubview(codeSwitch)
        codeSwitch.isOn = true
        codeSwitch.addTarget(self, action: #selector(ViewController.codeSwtichChanged(_:)), for: .valueChanged)
        
    }


}

