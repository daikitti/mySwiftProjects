//
//  ViewController.swift
//  UITextView
//
//  Created by Have Dope on 25.01.2023.
//

import UIKit

class ViewController: UIViewController {
    
    var myTextView = UITextView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(updateTextView(param: )), name: UIResponder.keyboardDidShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(updateTextView(param: )), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        
        createTextView()
        
        
        
    }
    
    func createTextView(){
        myTextView = UITextView(frame: CGRect(x: 20, y: 100, width: self.view.bounds.width-50, height: self.view.bounds.height/2))
        myTextView.text = "Some text"
        myTextView.contentInset = UIEdgeInsets(top: 40, left: 15, bottom: 0, right: 0)
        myTextView.font = .boldSystemFont(ofSize: 17)
        myTextView.backgroundColor = .gray
        self.view.addSubview(myTextView)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.myTextView.resignFirstResponder()
        self.myTextView.backgroundColor = .white
    }
    
   @objc func updateTextView(param: Notification){
        let userInfo = param.userInfo
        let gerKeyboardRect = (userInfo![ViewController.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        let keyboardFrame = self.view.convert(gerKeyboardRect, to: view.window)
        
        if param.name == UIResponder.keyboardWillHideNotification {
            myTextView.contentInset = UIEdgeInsets.zero
        }else{
            myTextView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keyboardFrame.height, right: 0)
            myTextView.scrollIndicatorInsets = myTextView.contentInset
        }
        myTextView.scrollRangeToVisible(myTextView.selectedRange)
    }
}

