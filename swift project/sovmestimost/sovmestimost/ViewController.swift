//
//  ViewController.swift
//  sovmestimost
//
//  Created by Have Dope on 20.12.2022.
//

import UIKit

extension ViewController {
        private func showAlert (title: String , message: String) {
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default)
            alert.addAction(okAction)
            present(alert, animated: true)
        }
    }

class ViewController: UIViewController {
    
    @IBOutlet weak var boyTF: UITextField!
    
    @IBOutlet weak var ShawtyTF: UITextField!
    
    
    
    
    @IBAction func unwindSegueToMainScreen(segue: UIStoryboardSegue){}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "secondSegue" else { return }
        guard let destination = segue.destination as? SecondViewController else { return}
        destination.boy = boyTF.text
        destination.girl = ShawtyTF.text
        
    }
    
    @IBAction func goTapped(_ sender: UIButton) {
        guard let boyTF = boyTF.text , let ShawtyTF = ShawtyTF.text else {return}
       
        
        if boyTF.isEmpty || ShawtyTF.isEmpty{
            showAlert(
                title: "Не получилось",
                message: "Брат с нискем ты совместим на 100, введи второе имя плbз"
            )
            
        }else{
            
            performSegue(withIdentifier: "secondSegue", sender: nil)
        }
       
    }
    
}
