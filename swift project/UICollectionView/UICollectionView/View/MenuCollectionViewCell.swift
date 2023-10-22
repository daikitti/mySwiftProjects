//
//  MenuCollectionViewCell.swift
//  UICollectionView
//
//  Created by Have Dope on 14.02.2023.
//

import UIKit

class MenuCollectionViewCell: UICollectionViewCell {
  
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    var menu: Menu?{
        didSet{
            nameLabel.text = menu?.name
            if let image = menu?.imageName{
                imageView.image = UIImage(named: image)
            }
        }
    }
}
