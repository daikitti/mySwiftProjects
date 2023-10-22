//
//  ViewController.swift
//  UInavigationControllerPart2BarItem
//
//  Created by Have Dope on 20.01.2023.
//

import UIKit

class ViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //  createImageTitleView()
        //self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .camera, target: self, action: #selector(perfrAdd(param: )))
        
        /*
    let simpleSwitch = UISwitch()
        simpleSwitch.isOn = true
        simpleSwitch.addTarget(self, action: #selector(switchIsChanche), for: .valueChanged)
        
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: simpleSwitch)
         */
        
        
        
        title = "View Controller"
        let items = ["up", "down"]
        var segmentController = UISegmentedControl(items: items)
        //segmentController.isMomentary = true
        segmentController.selectedSegmentIndex = 0
        segmentController.addTarget(self, action: #selector(segmentControllerTarget(param: )), for: .valueChanged)
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: segmentController)
    }
    
    
    @objc func segmentControllerTarget(param:UISegmentedControl){
        switch param.selectedSegmentIndex{
        case 0 :
            print("up")
        case 1:
            print("down")
        default:
            break
            
        
        }
    }
    
  
    
    /*
     func createImageTitleView() {
     title = "View Controller"
     let imageView = UIImageView( frame: CGRect(x: 0, y: 0, width: 100, height: 40))
     imageView.contentMode = .scaleAspectFit
     
     let image = UIImage(named: "free-icon")
     imageView.image = image
     
     
     self.navigationItem.titleView = imageView
     }
     
     @objc func perfrAdd(param: UIBarButtonItem){
     print("Add click")}
     
     @objc func switchIsChanche (param: UISwitch)
     {
         if param.isOn{
             print ("switch is On")
             
         }else{
             print ("switch is Off")
         }
     }
     */
    
    
}


