//
//  SecondViewController.swift
//  ToDoList
//
//  Created by drhao on 2019/8/19.
//  Copyright © 2019 HaoStudio. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    var infoFromViewOne:Int?

    @IBOutlet weak var myButton: UIButton!
    
    @IBOutlet weak var myTextInput: UITextField!
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        if let text = myTextInput.text {
            guard let firstViewController = tabBarController?.viewControllers?[0] as? FirstViewController else
            {return }
            
            if text != "" {
                if infoFromViewOne != nil {
                    firstViewController.toDos[infoFromViewOne!] = text
                    infoFromViewOne = nil
                } else {
                    firstViewController.toDos.append(text)
                }
                    firstViewController.myTableView.reloadData()
                    UserDefaults.standard.set(firstViewController.toDos, forKey: "todos")
            } else {
                if infoFromViewOne != nil {
                    firstViewController.toDos.remove(at: infoFromViewOne!)
                    firstViewController.myTableView.reloadData()
                    UserDefaults.standard.set(firstViewController.toDos, forKey: "todos")
                    infoFromViewOne = nil
                }
            }
        
        }
        myTextInput.text = ""
        myButton.setTitle("Back", for: .normal)
        self.tabBarController?.selectedIndex = 0
    }

    
  
    
    @IBAction func textFieldDidChanged(_ sender: UITextField) {
        if sender.text != "" {
            myButton.setTitle("OK", for: .normal)
        } else {
            myButton.setTitle("Back", for: .normal)
        }
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        buttonPressed(UIButton())
        return true
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        myTextInput.becomeFirstResponder()
        myTextInput.delegate = self
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if infoFromViewOne != nil {
            if let firstViewcontroller = tabBarController?.viewControllers?[0] as? FirstViewController {
                myTextInput.text = firstViewcontroller.toDos[infoFromViewOne!]
                myButton.setTitle("OK", for: .normal)
            }
        }
    }


}

