//
//  menuModel.swift
//  test2 uicillection
//
//  Created by Have Dope on 26.02.2023.
//

import Foundation
import UIKit


struct Product {
    var image: UIImage
    var name: String
    var price: Int
    var indexProduct: Int
}

struct Groups {
    var name: String
    var products = [Product]()
}

class Menu {

    var groups = [Groups]()
    
    init (){
        Setup()
    }
    
    func Setup(){
        
        if  (UIImage(named: "p1") != nil) && (UIImage(named: "p2") != nil) && (UIImage(named: "p3") != nil){
            
            let p1 = Product(image: UIImage(named: "p1")! , name: "Pizza 25 см", price: 350, indexProduct: 1)
            let p2 = Product(image: UIImage(named: "p1")! , name: "Pizza 30 см", price: 400, indexProduct: 2)
            let p3 = Product(image: UIImage(named: "p1")! , name: "Pizza 35 см", price: 450, indexProduct: 3)
            let p4 = Product(image: UIImage(named: "p1")! , name: "Pizza 40 см", price: 600, indexProduct: 4)
            let p5 = Product(image: UIImage(named: "p1")! , name: "Pizza 45 см с сырными бортиками", price: 1040, indexProduct: 5)
            
            let p6 = Product(image: UIImage(named: "p2")! , name: "BigBurger с курицей", price:  440, indexProduct: 6)
            let p7 = Product(image: UIImage(named: "p2")! , name: "BigBurger с говядиной", price:  530, indexProduct: 7)
            let p8 = Product(image: UIImage(named: "p2")! , name: "BigBurger без мяса", price:  315, indexProduct: 8)
            let p9 = Product(image: UIImage(named: "p2")! , name: "BigBurger с рыбой", price:  730, indexProduct: 9)
            let p10 = Product(image: UIImage(named: "p2")! , name: "BigBurger Chili", price:  510, indexProduct: 0)
            
            let p11 = Product(image: UIImage(named: "p3")! , name: "SmallBurger с курицей", price: 380, indexProduct: 11)
            let p12 = Product(image: UIImage(named: "p3")! , name: "SmallBurger с говядиной", price: 4000, indexProduct: 12)
            let p13 = Product(image: UIImage(named: "p3")! , name: "SmallBurger без мяса", price: 130, indexProduct: 13)
            let p14 = Product(image: UIImage(named: "p3")! , name: "SmallBurger с рыбой", price: 230, indexProduct: 14)
            let p15 = Product(image: UIImage(named: "p3")! , name: "SmallBurger Chili", price: 330, indexProduct: 15)
            
            
            
            
            let products1 = [p1,p2,p3,p4,p5]
            let products2 = [p6,p7,p8,p9,p10]
            let products3 = [p11,p12,p13,p14,p15]
            
            let g1 = Groups(name: "Pizza", products: products1)
            let g2 = Groups(name: "BigBurger", products: products2)
            let g3 = Groups(name: "SmallBurger", products: products3)
            
            self.groups = [g1,g3,g2]
        }
    }
    
}




