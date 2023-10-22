//
//  ViewController.swift
//  UICollectionView
//
//  Created by Have Dope on 14.02.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    
    
    var itemMenuArray: [Menu] = {
        var blankMenu = Menu()
        blankMenu.name = "Coca-Cola"
        blankMenu.imageName = "kola"
      
        
        var blankMenu2 = Menu()
        blankMenu.name = "Coffe"
        blankMenu.imageName = "kofe"
        return  [blankMenu, blankMenu2 ]
        
        
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
    }


}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemMenuArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let itemCell = collectionView.dequeueReusableCell(withReuseIdentifier: "menuCell", for: indexPath) as? MenuCollectionViewCell {
            
            itemCell.menu = itemMenuArray[indexPath.row]
            
            
            
            return itemCell
        }
        return UICollectionViewCell()
    }
    
    

    
    
}

