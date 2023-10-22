//
//  StartViewController.swift
//  test2 uicillection
//
//  Created by Have Dope on 04.03.2023.
//

import UIKit

class StartViewController: UIViewController {
    
    var goLabel = UILabel()
    var progressBar = UIProgressView()
    var imageBackG = UIImageView()
    var timerF = Timer()

    @IBOutlet weak var ContinierBattun: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createBackgroundImage()
        createStartLabel()
        createProgressBar()
        
        timerF = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(timerUpdate), userInfo: nil, repeats: true)
    
    }
    
    
    
    @IBAction func continierButton(_ sender: Any) {
        
        performSegue(withIdentifier: "MenuViewController", sender: nil)
        
    }
    
    
@objc func timerUpdate(param: Timer){
 
    if progressBar.progress < 1 {
        progressBar.progress += progressBar.progress/7
        print ("+")
    }
    else{
        print ("stop")
        self.timerF.invalidate()
        print ("+")
    
        ContinierBattun.isEnabled = true
        
    }
    
}


    func createStartLabel() {
        let width: CGFloat = 250
        self.goLabel = UILabel(frame: CGRect(x: 0, y: 0, width: width, height: 150))
        goLabel.center.x = view.center.x
        goLabel.center.y = view.center.y - 90
        goLabel.textAlignment = .center
        goLabel.backgroundColor = .white
        goLabel.font = .systemFont(ofSize: 30)
        goLabel.layer.borderWidth = 1
        goLabel.layer.borderColor = UIColor.black.cgColor
       
        goLabel.text = "BLAGFOOD"
    
        
        self.view.addSubview(goLabel)
        
    }
    
    func createProgressBar(){
      
        progressBar = UIProgressView(frame: CGRect(x: 0 , y: 0, width: view.frame.maxX - 70, height:  50))
        progressBar.center = view.center
        progressBar.center.y = view.center.y + 150
        progressBar.progress = 0.1
        progressBar.trackTintColor = .black
        progressBar.tintColor = .green
        self.view.addSubview(progressBar)
        
    }
    func createBackgroundImage(){
        imageBackG = UIImageView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height))
        imageBackG.center = view.center
        imageBackG.image = UIImage(named: "ocr")
        imageBackG.alpha = 0.06
        imageBackG.contentMode = .scaleAspectFill
        
        
        view.addSubview(imageBackG)
        
    }
}
