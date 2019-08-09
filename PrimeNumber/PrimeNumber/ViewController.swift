//
//  ViewController.swift
//  PrimeNumber
//
//  Created by Hao on 2019/8/9.
//  Copyright © 2019 Hao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var inputTextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    @IBAction func doThePrimeTest(_ sender: UIButton) {
        //1. Take out the number string from inputTextField
        if let inputText = inputTextField.text, let inputNumber = Int(inputText) {
            checkPrime(withNumber: inputNumber) { self.resultLabel.text = $0
                self.resultLabel.isHidden = false
            }
        }
        
        //2. COnvert to int
        
        //3. checkPrime
       
        inputTextField.text = ""
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        inputTextField.becomeFirstResponder()
        // Do any additional setup after loading the view.
    }

    
    func checkPrime(withNumber textNumber: Int) -> String {
        var isPrime: Bool? = true
        
        if textNumber <= 0 {
            isPrime = nil
        } else if textNumber == 1 {
            isPrime = false
        } else {
            for i in 2..<textNumber {
                if textNumber % i == 0 {
                    //not prime
                    isPrime = false
                    break
                }
            }
        }
        
        if isPrime == true {
            return "\(textNumber) is a prime"
        } else if isPrime == false {
            return "\(textNumber) is not a prime"
        }
        else {
            return "Please enter a number greater than 1"
        }
    }

    func checkPrime(withNumber number:Int, andCompletionHandler handler:(String) -> ()) {
        handler(checkPrime(withNumber: number))
    }
    
}

