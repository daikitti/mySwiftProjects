//
//  ProductCell.swift
//  createMenu
//
//  Created by Have Dope on 18.02.2023.
//

import UIKit

class ProductCell: UICollectionViewCell {
    
    @IBOutlet weak var priceProduct: UILabel!
    
    @IBOutlet weak var nameProduct: UILabel!
    
    @IBOutlet weak var productImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        self.productImage.image = nil
    }
    func setupCell(product:Product){
        self.productImage.image = product.image
        self.nameProduct.text = product.name
        self.priceProduct.text = "\(product.price)"
    }

}
