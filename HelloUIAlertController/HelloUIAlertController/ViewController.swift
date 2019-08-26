//
//  ViewController.swift
//  HelloUIAlertController
//
//  Created by drhao on 2019/8/10.
//  Copyright © 2019 HaoStudio. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func showAlert(_ sender: UIButton) {
        let myAlert = UIAlertController(title: "Hello", message: "How are you", preferredStyle: .actionSheet)
        let okAction = UIAlertAction(title: "ok", style: .default)
        let helloAction = UIAlertAction(title: "Hello", style: .destructive) { (action) in
            print("Say Hello!!")
            self.dismiss(animated: true, completion: nil)
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (action) in
            print("Cancel")
            self.dismiss(animated: true, completion: nil)
        }
        
        
        myAlert.addAction(helloAction)
        myAlert.addAction(okAction)
         myAlert.addAction(cancelAction)
        present(myAlert, animated: true, completion: nil )
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

