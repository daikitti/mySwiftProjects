//
//  ViewController.swift
//  AlertContrioller
//
//  Created by Have Dope on 13.01.2023.
//

import UIKit

class ViewController: UIViewController {

   let mySwitch2 = UISwitch()
    let button = UIButton()
    override func viewDidLoad() {
        super.viewDidLoad()
       
        self.button.frame = CGRect (x: 100, y: 200, width: 200, height: 100)
        self.button.backgroundColor = UIColor.black
        self.button.setTitle("Ok", for:.normal)
        self.button.setTitle("Нажата", for: .highlighted)
        
        self.view.addSubview(self.button)
        
        self.mySwitch2.frame = CGRect.zero
        self.mySwitch2.center = self.view.center
        self.view.addSubview(self.mySwitch2)
        
        self.mySwitch2.tintColor = UIColor.green
        self.mySwitch2.thumbTintColor = UIColor.cyan
        
        self.mySwitch2.onTintColor = UIColor.orange
        
        self.mySwitch2.addTarget(self, action: #selector(isOn(target:)), for: .valueChanged)
    }
    
    @objc func isOn (target: UISwitch) {
        if target.isOn{
            self.button.isUserInteractionEnabled = false
            self.button.setTitle("заблокирована ", for: .normal)
        }else{
            self.button.isUserInteractionEnabled = true
            self.button.setTitle("Ok", for:.normal)
        }
    }
    
    
    
    
    
    
}
    

