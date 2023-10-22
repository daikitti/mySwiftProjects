//
//  MainCell.swift
//  CollectionViewLesson
//
//  Created by Nikolai Mikhailov on 14.02.2020.
//  Copyright © 2020 Nikolai Mikhailov. All rights reserved.
//

import UIKit

class MainCell: UICollectionViewCell {

    @IBOutlet weak var imageGroup: UIImageView!
    @IBOutlet weak var nameGroup: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setupCell(group:Group){
        self.imageGroup.image = group.image
        self.nameGroup.text = group.name
    }
}
