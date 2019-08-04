//
//  ViewController.swift
//  NumberLock
//
//  Created by Hao on 2019/8/4.
//  Copyright © 2019 Hao. All rights reserved.
//

import UIKit
import GameKit

class ViewController: UIViewController {
    //make a random number
    var answer = GKRandomSource.sharedRandom().nextInt(upperBound: 100) + 1
    var maxNumber = 100
    var minNumber = 1
    var isOver = false
    
    @IBOutlet weak var messageLabel: UILabel!
    
    @IBOutlet weak var inputTextField: UITextField!
    
    
    @IBOutlet weak var background: UIImageView!
    
    @IBAction func makeAGuess(_ sender: UIButton) {
        
        if isOver == false {
            print(answer)
            let inputText = inputTextField.text!
            
            inputTextField.text = ""
            
            let inputNumber = Int(inputText)
            if inputNumber == nil {
                messageLabel.text = "wrong input! Guess a numbre between \(minNumber) and \(maxNumber)"
            } else if inputNumber! > 100 {
                messageLabel.text = "Too large!!  Guess a numbre between \(minNumber) and \(maxNumber)"
            } else if inputNumber! < 1 {
                messageLabel.text = "Too small!! Guess a numbre between \(minNumber) and \(maxNumber)"
            } else if inputNumber! == answer {
                messageLabel.text = "Bingo!! Press [Guess] to play again!!"
                isOver = true
                background.image = UIImage(named: "Finish")
            } else {
                if inputNumber! > answer {
                    maxNumber = inputNumber!
                } else {
                    minNumber = inputNumber!
                }
                messageLabel.text = "Guess a number between \(minNumber) and \(maxNumber)"
            }
        } else {
            minNumber = 1
            maxNumber = 100
            isOver = false
            messageLabel.text = "Guess a number between \(minNumber) and \(maxNumber)"
            answer = GKRandomSource.sharedRandom().nextInt(upperBound: 100) + 1
            background.image = UIImage(named: "BG")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        inputTextField.becomeFirstResponder()
    
        
    }


}

