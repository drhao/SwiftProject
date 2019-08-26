//
//  ViewController.swift
//  HelloTableView
//
//  Created by drhao on 2019/8/19.
//  Copyright © 2019 HaoStudio. All rights reserved.
//

import UIKit



class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    let fruitArray = ["apple", "banana", "mango", "watermelon"]
    let colorArray = ["red", "blue", "green"]
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return fruitArray.count
        } else {
            return colorArray.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let cell = UITableViewCell()
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        if indexPath.section == 0 {
            cell.textLabel?.text = fruitArray[indexPath.row]
        } else {
            cell.textLabel?.text = colorArray[indexPath.row]
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Fruit"
        } else {
            return "Color"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

