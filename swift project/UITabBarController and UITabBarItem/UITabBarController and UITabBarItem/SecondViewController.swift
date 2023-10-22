//
//  SecondViewController.swift
//  UITabBarController and UITabBarItem
//
//  Created by Have Dope on 24.01.2023.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "secondVC"
        
        var tabBarItam = UITabBarItem()
        tabBarItam = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 1)
       
        self.tabBarItem = tabBarItam
        self.view.backgroundColor = UIColor.blue

    }
   

}
