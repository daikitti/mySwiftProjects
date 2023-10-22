//
//  ViewController.swift
//  UITabBarController and UITabBarItem
//
//  Created by Have Dope on 24.01.2023.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    
        self.navigationItem.title = "firstVC"
        
        var tabBarItem = UITabBarItem()
        tabBarItem = UITabBarItem(tabBarSystemItem: .contacts, tag: 0)
        
        self.tabBarItem = tabBarItem
        self.view.backgroundColor = UIColor.brown
        
        
    }


}

