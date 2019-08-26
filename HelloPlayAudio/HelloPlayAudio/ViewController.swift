//
//  ViewController.swift
//  HelloPlayAudio
//
//  Created by drhao on 2019/8/18.
//  Copyright © 2019 HaoStudio. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var audioPlayer: AVAudioPlayer?
    
    @IBAction func play(_ sender: UIButton) {
        audioPlayer?.stop()
        audioPlayer?.currentTime = 0.0
        audioPlayer?.play()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //find sound path
        if let path = Bundle.main.path(forResource: "Right", ofType: ".mp3") {
            //path to url
            let url = URL(fileURLWithPath: path)
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: url)
            } catch {
                print(error.localizedDescription)
            }
        }
        else {
            print("no file")
        }
    }
    


}

