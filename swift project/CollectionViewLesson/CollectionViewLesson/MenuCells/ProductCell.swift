//
//  ProductCell.swift
//  CollectionViewLesson
//
//  Created by Nikolai Mikhailov on 11.02.2020.
//  Copyright © 2020 Nikolai Mikhailov. All rights reserved.
//

import UIKit

class ProductCell: UICollectionViewCell {

    @IBOutlet weak var productImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        self.productImage.image = nil
    }
    
    func setupCell(product:Product){
        self.productImage.image = product.image
    }

}
