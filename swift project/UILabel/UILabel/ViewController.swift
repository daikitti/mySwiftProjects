//
//  ViewController.swift
//  UILabel
//
//  Created by Have Dope on 24.01.2023.
//

import UIKit

class ViewController: UIViewController {

    let myLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let lebelFrame = CGRect(x: 0, y: 0, width: 120, height: 50)
        
        myLabel.frame = lebelFrame
        myLabel.font = UIFont.boldSystemFont(ofSize: 20)
        myLabel.numberOfLines = 0
        myLabel.lineBreakMode = .byWordWrapping
        myLabel.text = "ios 11 and xcode 10 and the heavydope technolojes"
        myLabel.adjustsFontSizeToFitWidth = true
        myLabel.sizeToFit()
        myLabel.textColor = .systemPink
        myLabel.shadowColor = .gray
        myLabel.shadowOffset = CGSize(width: 3, height: 1)
        
        myLabel.center = self.view.center
        view.addSubview(myLabel)
    }


}

