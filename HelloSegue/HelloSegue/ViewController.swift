//
//  ViewController.swift
//  HelloSegue
//
//  Created by appsgaga on 2017/11/26.
//  Copyright © 2017年 appsgaga. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myTextInput: UITextField!
    
    @IBAction func changeView(_ sender: UIButton) {
        if let inputText = myTextInput.text{
            if inputText == ""{
                //no input, pop up an alert
                let myAlert = UIAlertController(title: "No input", message: "Please enter something", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                myAlert.addAction(okAction)
                present(myAlert, animated: true, completion: nil)
            }else{
                //change view
                performSegue(withIdentifier: "gotoview2", sender: inputText)
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "gotoview2"{
            if let lightRed = segue.destination as? LightRedViewController{
                lightRed.infoFromViewOne = sender as? String
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

