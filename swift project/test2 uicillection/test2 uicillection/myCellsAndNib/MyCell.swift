//
//  MyCell.swift
//  test2 uicillection
//
//  Created by Have Dope on 26.02.2023.
//

import UIKit

class MyCell: UICollectionViewCell {

    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var priceProductLabel: UILabel!
    @IBOutlet weak var productNameLabel: UILabel!
    
    var indexCell: Int = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func setupImage(product:Product){
        
        self.productImage.image = product.image
        self.priceProductLabel.text = "\(product.price)"
        self.productNameLabel.text = product.name
        self.indexCell = product.indexProduct
    }

  
   /*
    @IBAction func buttonAction(_ sender: Any) {
        print (indexCell)
        
        let  menu:Menu = Menu()
    
            
            let group = menu.groups[indexCell]
            let product = group.products[indexCell]
            
            print("ЭТО product//         ", product, "        //ЭТО product ")
            
        
        let storyboard = UIStoryboard(name: "main", bundle: nil)
        guard  let korzinaViewController = storyboard.instantiateViewController(withIdentifier: "KorzinaViewController") as? KorzinaViewController else {return}
        
        korzinaViewController.selectedIndex = indexCell
       
        
            
            
        }*/
        

        
        
    }
    
    

