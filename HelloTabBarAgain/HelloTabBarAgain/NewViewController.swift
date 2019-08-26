//
//  NewViewController.swift
//  HelloTabBarAgain
//
//  Created by drhao on 2019/8/18.
//  Copyright © 2019 HaoStudio. All rights reserved.
//

import UIKit

class NewViewController: UIViewController {
    var messsageFromViewOne:String?

    @IBOutlet weak var myTextInput: UITextField!
    
    @IBAction func ok(_ sender: UIButton) {
        if let inputText = myTextInput.text {
            print(inputText)
            myTextInput.text = ""
            myTextInput.resignFirstResponder()
            if let firstViewController = self.tabBarController?.viewControllers?[0] as? ViewController {
                firstViewController.myLabel.text = inputText
                self.tabBarController?.selectedIndex = 0
            }
        }

    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
       
        myTextInput.text = messsageFromViewOne
    }
    
    override func viewDidAppear(_ animated: Bool) {
        myTextInput.becomeFirstResponder()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
