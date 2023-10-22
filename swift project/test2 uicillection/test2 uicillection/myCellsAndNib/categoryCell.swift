//
//  categoryCell.swift
//  test2 uicillection
//
//  Created by Have Dope on 26.02.2023.
//

import UIKit

class categoryCell: UICollectionViewCell {

    @IBOutlet weak var groupsLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
 
    
    }
   
    
    func SetupGroupsLabel(groups:Groups){
        self.groupsLabel.text = groups.name
    }
  
}
