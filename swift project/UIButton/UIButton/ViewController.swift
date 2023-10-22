//
//  ViewController.swift
//  UIButton
//
//  Created by Have Dope on 25.01.2023.
//

import UIKit

class ViewController: UIViewController {
   var myButton1 = UIButton()
   var myButton2 = UIButton()
    var myLabelTest = UILabel()
    var A: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
     var buttonRect = CGRect(x: 50 , y: 700, width: 100, height: 20 )
        myButton1.frame = buttonRect
        myButton1.setTitle("button 1", for: .normal)
        myButton1.backgroundColor = .blue
       
        myButton1.addTarget(self, action: #selector(mybuttonTarget(param: )), for: .touchUpInside)
        
        
        myLabelTest.frame = CGRect(x: 0, y: 0 , width: 100, height: 30)
        myLabelTest.text = "0"
        myLabelTest.font = .boldSystemFont(ofSize: 20)
        myLabelTest.center = view.center
        myLabelTest.textAlignment = .center
        
     
        
        var buttonRect2 = CGRect(x: 250 , y: 700, width: 100, height: 20 )
           myButton2.frame = buttonRect2
           myButton2.setTitle("button 2", for: .normal)
           myButton2.backgroundColor = .red
          
           myButton2.addTarget(self, action: #selector(myButtonTarget2(param: )), for: .touchUpInside)
           
        
        
        
        self.view.addSubview(myButton1)
        self.view.addSubview(myLabelTest)
        self.view.addSubview(myButton2)
        
    }
    
    @objc func mybuttonTarget(param: UIButton){
        A += 1
        myLabelTest.text = String(A)
    }
    @objc func myButtonTarget2(param: UIButton){
        A -= 1
        myLabelTest.text = String(A)
    }

}

