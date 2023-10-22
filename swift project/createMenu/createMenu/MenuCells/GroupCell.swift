//
//  GroupCell.swift
//  createMenu
//
//  Created by Have Dope on 18.02.2023.
//

import UIKit

class GroupCell: UICollectionViewCell {


    @IBOutlet weak var nameGroup: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setupCell(group:Group){
        self.nameGroup.text = group.name}
    
}


