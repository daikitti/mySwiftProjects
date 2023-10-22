//
//  ViewController.swift
//  UIImageView
//
//  Created by Have Dope on 31.01.2023.
//

import UIKit

class ViewController: UIViewController {

    var myImageView = UIImageView()
    let macBookIage = UIImage(named: "2")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: Int(view.bounds.width) - 290 , height: Int(view.bounds.height) - 750))
        myImageView.image = macBookIage
        
        myImageView.layer.borderColor = UIColor.black.cgColor
        myImageView.layer.borderWidth = 2
        myImageView.center = view.center
        myImageView.clipsToBounds = true
      
        myImageView.layer.cornerRadius = 50
        myImageView.contentMode = .scaleAspectFill
        self.view.addSubview(myImageView)
        
        
    }


}

