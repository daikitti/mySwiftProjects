//
//  Menu.swift
//  CollectionViewLesson
//
//  Created by Nikolai Mikhailov on 11.02.2020.
//  Copyright © 2020 Nikolai Mikhailov. All rights reserved.
//

import Foundation
import UIKit

struct Group {
    var groups:[Group]?
    var name:String
    var products:[Product]?
    var image:UIImage
}
struct Product {
    var name:String
    var price:Float
    var image:UIImage
}

class Menu {
    
    var groups = [Group]()
    
    init() {
        setup()
    }
    
    func setup(){
        
        let p1 = Product(name: "Пицца1", price: 100, image: UIImage(named: "p1")!)
        let p2 = Product(name: "Пицца2", price: 200, image: UIImage(named: "p1")!)
        let p3 = Product(name: "Пицца3", price: 300, image: UIImage(named: "p1")!)
         
        let p4 = Product(name: "Пицца4", price: 1000, image: UIImage(named: "p1")!)
        let p5 = Product(name: "Пицца5", price: 2000, image: UIImage(named: "p1")!)
        let p6 = Product(name: "Пицца6", price: 3000, image: UIImage(named: "p1")!)
         
         let p7 = Product(name: "Пицца7", price: 10000, image: UIImage(named: "p1")!)
         let p8 = Product(name: "Пицца8", price: 20000, image: UIImage(named: "p1")!)
         let p9 = Product(name: "Пицца9", price: 30000, image: UIImage(named: "p1")!)

         let pizzaGroupIn1 = Group(groups: nil, name: "Пицца 25см", products: [p1,p2,p3], image: UIImage(named: "p1")!)
         let pizzaGroupIn2 = Group(groups: nil, name: "Пицца 40см", products: [p4,p5,p6], image: UIImage(named: "p1")!)
         let pizzaGroupIn3 = Group(groups: nil, name: "Пицца 60см", products: [p7,p8,p9], image: UIImage(named: "p1")!)
         
        
         
          let pizzaGroup = Group(groups: [pizzaGroupIn1,pizzaGroupIn2,pizzaGroupIn3], name: "Пицца", products: nil, image: UIImage(named: "p1")!)
         
         
         
         //БУРГЕРЫ
         let b1 = Product(name: "Бургер1", price: 100, image: UIImage(named: "p3")!)
         let b2 = Product(name: "Бургер2", price: 200, image: UIImage(named: "p3")!)
         let b3 = Product(name: "Бургер3", price: 300, image: UIImage(named: "p3")!)
         
         let b4 = Product(name: "Бургер4", price: 100, image: UIImage(named: "p3")!)
         let b5 = Product(name: "Бургер5", price: 200, image: UIImage(named: "p3")!)
         let b6 = Product(name: "Бургер6", price: 300, image: UIImage(named: "p3")!)
         
         let b7 = Product(name: "Бургер7", price: 100, image: UIImage(named: "p3")!)
         let b8 = Product(name: "Бургер8", price: 200, image: UIImage(named: "p3")!)
         let b9 = Product(name: "Бургер9", price: 300, image: UIImage(named: "p3")!)

          let burgerGroupIn1 = Group(groups: nil, name: "Бургер с колбасой", products: [b1,b2,b3], image: UIImage(named: "p3")!)
          let burgerGroupIn2 = Group(groups: nil, name: "Бургер с говядиной", products: [b4,b5,b6], image: UIImage(named: "p3")!)
          let burgerGroupIn3 = Group(groups: nil, name: "Бургер с курицей", products: [b7,b8,b9], image: UIImage(named: "p3")!)
          
         
          
           let burgerGroup = Group(groups: [burgerGroupIn1,burgerGroupIn2,burgerGroupIn3], name: "Бургеры", products: nil, image: UIImage(named: "p2")!)

         groups.append(pizzaGroup)
         groups.append(burgerGroup)
       
    }
}



extension String{
    func widthOfString(usingFont font: UIFont) -> CGFloat {
             let fontAttributes = [NSAttributedString.Key.font: font]
             let size = (self as NSString).size(withAttributes: fontAttributes)
             return ceil(size.width)
    }
}
