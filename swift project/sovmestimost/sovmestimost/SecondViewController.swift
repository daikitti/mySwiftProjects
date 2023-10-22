//
//  SecondViewController.swift
//  sovmestimost
//
//  Created by Have Dope on 20.12.2022.
//

import UIKit

class SecondViewController: UIViewController {

    var boy: String?
    var girl: String?
    var randomBar: Float = 0.0
    
    @IBOutlet weak var boyAndShawtyLabel: UILabel!
    
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBOutlet weak var progressBar: UIProgressView!
      
    
    
    override func viewDidLoad() {
        if boy == "Никита" && girl == "Полина" {
           randomBar = Float(1.0)
        } else {
            randomBar = Float.random(in: 0.0 ... 1.0)
            
        }
        progressBar.progress = Float(randomBar)
        let rendomBarProcent = randomBar * 100
        resultLabel.text = "\(Int(rendomBarProcent)) %"
        guard let boy = boy, let girl = girl else {return}
        boyAndShawtyLabel.text = "\(boy)  и  \(girl)"
        
       
    }
    
    
    
    @IBAction func backTapped(_ sender: UIButton) {
    }
    
}
