//
//  MyCell.swift
//  TEST UIcollection
//
//  Created by Have Dope on 23.02.2023.
//

import UIKit

class MyCell: UICollectionViewCell {

    @IBOutlet weak var productImage: UIImageView!
    
    @IBOutlet weak var productLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    
    func setupCell(product:Product){
        self.productImage.image = product.image
        self.productLabel.text = product.name
        
        
    }
}
