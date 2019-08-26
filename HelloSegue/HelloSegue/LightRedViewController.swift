//
//  LightRedViewController.swift
//  HelloSegue
//
//  Created by appsgaga on 2017/11/26.
//  Copyright © 2017年 appsgaga. All rights reserved.
//

import UIKit

class LightRedViewController: UIViewController {
    
    var infoFromViewOne: String?
    
    @IBOutlet weak var myLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myLabel.text = infoFromViewOne
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
