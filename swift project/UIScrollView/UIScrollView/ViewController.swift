//
//  ViewController.swift
//  UIScrollView
//
//  Created by Have Dope on 01.02.2023.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate{
    
    var myScrollView = UIScrollView()
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let meImage = UIImage(named: "me")
        let oblakaImage = UIImage(named: "oblaka")
        let profileImage = UIImage(named: "profile")
        
        let scrollViewReact = self.view.bounds
        
        // createScroll
        myScrollView = UIScrollView(frame: scrollViewReact)
        myScrollView.isPagingEnabled = true
        myScrollView.contentSize = CGSize(width: scrollViewReact.size.width * 3, height: scrollViewReact.size.height)
        self.view.addSubview(myScrollView)
        //
        //createMe
        var imageViewRect = self.view.bounds
        let meImageView = self.newImageWithImage(paramImage: meImage!, paramFrame: imageViewRect)
        myScrollView.addSubview(meImageView)
        
        //next page
        imageViewRect.origin.x += imageViewRect.size.width + 15
        let oblakaImageView = self.newImageWithImage(paramImage: oblakaImage!, paramFrame: imageViewRect)
        myScrollView.addSubview(oblakaImageView)
        
        // nextPage
        imageViewRect.origin.x += imageViewRect.size.width + 15
        let profileImageView = self.newImageWithImage(paramImage: profileImage!, paramFrame: imageViewRect)
        myScrollView.addSubview(profileImageView)
      
    }
    
    
    //newImageviewWithImage
    func newImageWithImage(paramImage: UIImage, paramFrame: CGRect)-> UIImageView {
        
        let result = UIImageView(frame: paramFrame)
        result.contentMode = .scaleAspectFit
        result.image = paramImage
        return result
        
    }
    
    
    
    
}
