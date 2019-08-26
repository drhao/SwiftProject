//
//  ViewController.swift
//  HelloUIPickerView
//
//  Created by drhao on 2019/8/11.
//  Copyright © 2019 HaoStudio. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    let numberArray = ["1", "2", "3", "4", "5", "6", "7", "8"]
    let fruitArray = ["apple", "banana", "mango", "watermelon"]

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return numberArray.count
        } else {
            return fruitArray.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0{
            return numberArray[row]
        }else{
            return fruitArray[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if component == 0 {
            print("Number: \(numberArray[row]))
        } else {
            print("fruit: \(fruitArray[row])")
        }
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

