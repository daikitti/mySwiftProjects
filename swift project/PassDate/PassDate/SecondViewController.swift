//
//  SecondViewController.swift
//  PassDate
//
//  Created by Have Dope on 17.12.2022.
//

import UIKit

class SecondViewController: UIViewController {

    var loggin: String?
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let loggin =  self.loggin else {return}
        label.text = "Hello, \(loggin)"
    }
    
    @IBAction func goBackTapped(_ sender: UIButton) {
        
    }
    
}
