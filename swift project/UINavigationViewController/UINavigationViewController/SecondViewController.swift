//
//  SecondViewController.swift
//  UINavigationViewController
//
//  Created by Have Dope on 16.01.2023.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "SecondVC"
        
      
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        self.perform(#selector(goBack), with: nil, afterDelay: 3.0)
    }
    @objc func goBack(){
        //self.navigationController?.popViewController(animated: true)
      //получаем текущий массив контроллеров
        var currentControllArray = self.navigationController?.viewControllers
        
        
        //удаляем последний контроллер
        currentControllArray?.removeLast()
        
        //присвоим
        if  let newController = currentControllArray {
            
            self.navigationController?.viewControllers = newController
        }
        
        
        
    }


}
