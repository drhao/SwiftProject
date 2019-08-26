//
//  DetailViewController.swift
//  HelloTableView
//
//  Created by drhao on 2019/8/19.
//  Copyright © 2019 HaoStudio. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var infoFromViewOne:String?
    
    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var myLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let okFileName = infoFromViewOne {
            myLabel.text = okFileName
            myImageView.image = UIImage(named: okFileName)
           
        }
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
