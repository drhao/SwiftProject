//
//  ViewController.swift
//  MyBook
//
//  Created by drhao on 2019/8/24.
//  Copyright © 2019 HaoStudio. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var pageViewController: UIPageViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let storyboard = UIStoryboard(name: "main", bundle: nil)
        let pageViewController = storyboard.instantiateViewController(withIdentifier: "pageViewController") as? UIPageViewController
        pageViewController?.view.frame = self.view.frame
        addChild(pageViewController!)
        view.addSubview(pageViewController!.view)
        pageViewController?.didMove(toParent: self)
    }

    func viewControllerAtIndex(index: Int) -> ContentViewController? {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let contentViewController = storyboard.instantiateViewController(withIdentifier: "mainCOntentZviewController" ) as? ContentViewController
        contentViewController?.nowPageNumber = index
        return contentViewController
    }

}

