//
//  addCity.swift
//  weatherJ
//
//  Created by Have Dope on 26.12.2022.
//

import UIKit

extension UIViewController {
    
    func alerPlusCity(name: String, placeholder: String, complitionHandler: @escaping ( String) -> Void){
        let alertConroller = UIAlertController(title: name, message: nil, preferredStyle: .alert)
        let alertOK = UIAlertAction(title: "Ok", style: .default){
            (action) in
            
            let tftext = alertConroller.textFields?.first
            guard let text = tftext?.text else {return}
            complitionHandler(text)
            
        }
        
        alertConroller.addTextField { (tf) in
            tf.placeholder = placeholder
        }
        let alertCencel = UIAlertAction(title: "Отмена", style: .default) { (_) in }
        
        alertConroller.addAction(alertOK)
        alertConroller.addAction(alertCencel)
        
        present(alertConroller, animated: true , completion: nil)
    }
    
}
