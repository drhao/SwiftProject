//
//  ViewController.swift
//  HelloSwichViewsAgain
//
//  Created by drhao on 2019/8/18.
//  Copyright © 2019 HaoStudio. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myTextIput: UITextField!
    @IBAction func gotoView2(_ sender: UIButton) {
        let lightRed = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "lightRed")
        //present(lightRed, animated: true, completion: nil)
        
        //bottom up
        
        //r to l
        self.navigationController?.pushViewController(lightRed, animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

