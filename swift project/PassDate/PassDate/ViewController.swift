//
//  ViewController.swift
//  PassDate
//
//  Created by Have Dope on 17.12.2022.
//

import UIKit

class ViewController: UIViewController {

   
    @IBOutlet weak var logginTF: UITextField!
    
    
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var PasswordTF: UITextField!
    
    @IBAction func unwindSegueToMainScreen(segue: UIStoryboardSegue){
        guard let svc = segue.source as? SecondViewController else {return}
        resultLabel.text = svc.label.text
        
    }
    
    @IBAction func logginTapped(_ sender: UIButton) {
        
            performSegue(withIdentifier: "detailSegue", sender: nil)
        
            
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let dvc =  segue.destination as? SecondViewController else {return}
        
        dvc.loggin = logginTF.text
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}

