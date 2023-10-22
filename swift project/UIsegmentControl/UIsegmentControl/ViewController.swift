//
//  ViewController.swift
//  UIsegmentControl
//
//  Created by Have Dope on 16.01.2023.
//

import UIKit

class ViewController: UIViewController {

    var segmentControll = UISegmentedControl()
    var menuArray = ["one", "two", "thee"]
    
   var imageView = UIImageView()
    var imageArray = [UIImage(named: "photo-1.jpeg"),
                      UIImage(named: "photo-2.jpeg"),
                      UIImage(named: "photo-3.jpeg")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
            //image
        self.imageView.frame = CGRect(x: 0, y: 0, width: 250, height: 300)
        self.imageView.center = self.view.center
        self.imageView.image = self.imageArray[1]
        self.view.addSubview(self.imageView)
        
        
        self.segmentControll = UISegmentedControl(items: self.menuArray)
        self.segmentControll.frame = CGRect(x: 100, y: 700, width: 200, height: 30)
        self.view.addSubview(self.segmentControll)
        
        
        self.segmentControll.addTarget(self, action: #selector(selectedValue), for: .valueChanged)
        
        
        
    }

    @objc func selectedValue(target: UISegmentedControl){
        
        if target == self.segmentControll{
            let segmentIndex = target.selectedSegmentIndex
            
            self.imageView.image = self.imageArray[segmentIndex]
            
    
                
            }
        }
    

}

