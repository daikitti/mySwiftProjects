//
//  GroupCell.swift
//  CollectionViewLesson
//
//  Created by Nikolai Mikhailov on 12.02.2020.
//  Copyright © 2020 Nikolai Mikhailov. All rights reserved.
//

import UIKit

class GroupCell: UICollectionViewCell {

    @IBOutlet weak var nameGroup: UILabel!
    
    override func prepareForReuse() {
        super.prepareForReuse()
         self.contentView.backgroundColor = .white
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setupCell(group:Group,isSelected:Bool){
        self.nameGroup.text = group.name
        if isSelected{
            self.contentView.backgroundColor = .orange
        }else{
            self.contentView.backgroundColor = .white
        }
    }

}
