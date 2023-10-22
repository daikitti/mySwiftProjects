//
//  ProductModel.swift
//  TEST UIcollection
//
//  Created by Have Dope on 26.02.2023.
//

import Foundation
import UIKit


struct Product {
    var name: String
    var image: UIImage
    var price: Float
}


class Menu {
    var products = [Product]()
    
    init() {
        Setup()
    }
    
    func Setup() {
        
        let p1 = Product(name: "p1", image: UIImage(named: "p1")!, price: 300)
        let p2 = Product(name: "p2", image: UIImage(named: "p2")!, price: 300)
        let p3 = Product(name: "p3", image: UIImage(named: "p3")!, price: 300)
        self.products = [p1,p2,p3]
    }
    
}
