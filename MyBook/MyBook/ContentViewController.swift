//
//  ContentViewController.swift
//  MyBook
//
//  Created by drhao on 2019/8/24.
//  Copyright © 2019 HaoStudio. All rights reserved.
//

import UIKit

class ContentViewController: UIViewController {

    var nowPageNumber = 0
    
    @IBOutlet weak var mainImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainImageView.image = UIImage(named: "\(nowPageNumber)")
        
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
