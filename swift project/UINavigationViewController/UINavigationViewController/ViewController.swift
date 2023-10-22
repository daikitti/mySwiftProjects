//
//  ViewController.swift
//  UINavigationViewController
//
//  Created by Have Dope on 16.01.2023.
//

import UIKit

class ViewController: UIViewController {

    
    var displaySecondButton = UIButton()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.title = "FirstVC"
        
        self.displaySecondButton = UIButton(type: .system)
        self.displaySecondButton.setTitle("SecondVC", for: .normal)
        self.displaySecondButton.frame = CGRect(x: 100, y: 400, width: 200, height: 30)
        self.displaySecondButton.addTarget(self, action: #selector(performDisplaySecondVC), for: .touchUpInside)
        self.view.addSubview(displaySecondButton)
    }

    
    @objc func performDisplaySecondVC(paramSender: Any){
        let secondVC = SecondViewController()
        self.navigationController?.pushViewController(secondVC, animated: true)
    }
    
    
}

