//
//  MainCell.swift
//  createMenu
//
//  Created by Have Dope on 18.02.2023.
//

import UIKit

class MainCell: UICollectionViewCell {
    
    @IBOutlet weak var nameGroup: UILabel!
    @IBOutlet weak var imageGroup: UIImageView!
   
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setupCell(group:Group){
        self.imageGroup.image = group.image
        self.nameGroup.text = group.name
        
    }

}
