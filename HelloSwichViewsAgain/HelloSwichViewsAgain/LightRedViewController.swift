//
//  LightRedViewController.swift
//  HelloSwichViewsAgain
//
//  Created by drhao on 2019/8/18.
//  Copyright © 2019 HaoStudio. All rights reserved.
//

import UIKit

class LightRedViewController: UIViewController {

    @IBAction func gotoView3(_ sender: UIButton) {
        let lightGreen = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "lightGreen")
        self.navigationController?.pushViewController(lightGreen, animated: true)
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
