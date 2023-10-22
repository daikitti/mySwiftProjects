//
//  MyTableViewCell.swift
//  MVC
//
//  Created by Have Dope on 13.02.2023.
//

import UIKit

class MyTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

  
    }

   public func refresh(_ model: Model){
        nameLabel.text = model.name
        detailLabel.text = model.prof
        
    }
    
    
    
    
    
    
}
