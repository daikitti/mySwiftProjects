//
//  ViewController.swift
//  UITextField and NotificationCenter
//
//  Created by Have Dope on 24.01.2023.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    var myTextField = UITextField()
    var mylabelTest = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.createTextField()
       // createLabelTest()
        myTextField.delegate = self
        
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: nil) { (nc) in
            self.view.frame.origin.y = -150
        }
        
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: nil){ (nc) in
            self.view.frame.origin.y = 0
        }
    }
    //MARK: - CreateUI
    
    func createTextField(){
        let textFieldFrame = CGRect(x: 0, y: 0, width: 200, height: 31)
        myTextField = UITextField(frame: textFieldFrame)
        myTextField.borderStyle = .roundedRect
        myTextField.contentVerticalAlignment = .center
        myTextField.contentHorizontalAlignment = .center
        myTextField.placeholder = "Я ЛЮБЛЮ ПОЛИНУ"
        myTextField.center = view.center
        view.addSubview(myTextField)
        

        
    }
    
    func createLabelTest(){
        
        let textFieldFrame = CGRect(x: 100, y: 200, width: 200, height: 50)
        mylabelTest = UILabel(frame: textFieldFrame)
        mylabelTest.text = "privet privet"
        view.addSubview(mylabelTest)
    }

    @objc func textFieldDidChange(ncParam: NSNotification){
        print ("UITextFieldDidChange = \(ncParam)")
    }
    //MARK: - UITextFieldDelegate
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        print("textFieldShouldBeginEditing - это я решаю, можно ли редактировать")
        return true
    }
    
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("textFieldDidBeginEditing - внимание, началось редактирование")
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        print("textFieldShouldEndEditing - внимание, закончилось редактирование")

        return true
    }
    
   
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        print("textFieldDidEndEditing")
    }
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        print("textField - вы ввели = \(string)")
        
      //  mylabelTest.text! += string
        return true
    }
    
   
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        print("textFieldShouldClear - ты что-то очистил")
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("textFieldShouldReturn - хотите убрать клавиатуру ? ")
        if textField == myTextField{
            self.myTextField.resignFirstResponder()
           
        }
        return true
    }
    
    
}

