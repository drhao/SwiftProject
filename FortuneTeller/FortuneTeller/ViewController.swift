//
//  ViewController.swift
//  FortuneTeller
//
//  Created by drhao on 2019/8/11.
//  Copyright © 2019 HaoStudio. All rights reserved.
//

import UIKit
import GameKit
import AudioToolbox

class ViewController: UIViewController {

    @IBOutlet weak var yourFortune: UIImageView!
    
    @IBAction func tellMeSomething(_ sender: UIButton) {
        showAnswer()
    }
    
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if event?.subtype == .motionShake{
            showAnswer()
        }
    }
    
    func showAnswer() {
        if yourFortune.isHidden == true {
            let answer = GKRandomSource.sharedRandom().nextInt(upperBound: 6)+1
            yourFortune.image = UIImage(named: "\(answer)")
            yourFortune.isHidden = false
            //print(answer)
            
        } else {
            //hide image
            yourFortune.isHidden = true
        }
        
        AudioServicesPlaySystemSound(1000)
        
    }
    
    
    
    override func viewDidLoad() {
       
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

