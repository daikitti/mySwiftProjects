//
//  ViewController.swift
//  UIActivityViewControlle(Share more)
//
//  Created by Have Dope on 16.01.2023.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    var buttonShare = UIButton()
    var textField = UITextField()
    var activityViewController: UIActivityViewController? = nil
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
       createButton()
        createTextField()
        // Do any additional setup after loading the view.
    }

    //MARK: - Method
 
    func createTextField(){
        self.textField.frame = CGRect(x: 0, y: 0, width: 280, height: 30)
        self.textField.center = self.view.center
        self.textField.borderStyle = UITextField.BorderStyle.roundedRect
        self.textField.placeholder = "Enter text to share О_о"
        self.textField.delegate = self
        self.view.addSubview(self.textField)
    }
    
    func createButton(){
        self.buttonShare  = UIButton(type: .roundedRect)
        self.buttonShare.frame = CGRect(x: 50, y: 450, width: 280, height: 44)
        self.buttonShare.setTitle("Расшaрить", for: .normal)
        self.buttonShare.addTarget(self, action: #selector(hendlerShare), for: .touchUpInside)
        self.view.addSubview(self.buttonShare)
        
    }
    
    @objc func hendlerShare(paramSender: Any) {
        let text = self.textField.text
        
        if text?.count == 0 {
            let messege = "Cначала введите текст, потом нажмите кнопку"
            let alertController = UIAlertController(title: nil, message: messege, preferredStyle: .alert)
            let action = UIAlertAction(title: "Ok", style: .cancel,handler: nil)
            
            alertController.addAction(action)
            self.present(alertController, animated: true, completion: nil)
        }
        self.activityViewController = UIActivityViewController(activityItems: [self.textField.text ?? "nil"], applicationActivities: nil)
        self.present(self.activityViewController!, animated: true,completion: nil)
    }

    //MARK: - UITextViewDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.textField.resignFirstResponder()
        return true
    }
    
}

