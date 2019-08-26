//
//  FirstViewController.swift
//  ToDoList
//
//  Created by drhao on 2019/8/19.
//  Copyright © 2019 HaoStudio. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    @IBOutlet weak var myTableView: UITableView!
    
    var toDos = UserDefaults.standard.stringArray(forKey: "todos")  ?? [String]()
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = toDos[indexPath.row]
        cell.textLabel?.textColor = .white
        cell.textLabel?.font = UIFont(name: "arial", size: 24)
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            toDos.remove(at: indexPath.row)
            UserDefaults.standard.set(toDos, forKey: "todos")
            myTableView.reloadData()

        }
    }
    
    func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        return false
    }
    
    func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        if let secondViewController = tabBarController?.viewControllers?[1] as? SecondViewController {
           secondViewController.infoFromViewOne = indexPath.row
        }
        tabBarController?.selectedIndex = 1
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myTableView.dataSource = self
        myTableView.delegate = self
      
        

    }


}

