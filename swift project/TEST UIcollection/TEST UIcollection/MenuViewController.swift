//
//  MenuViewController.swift
//  TEST UIcollection
//
//  Created by Have Dope on 23.02.2023.
//

import UIKit

class MenuViewController: UIViewController {
    
    @IBOutlet weak var menuCollectionView: UICollectionView!
    
    var menu:Menu = Menu()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.menuCollectionView.register(UINib(nibName: "MyCell", bundle: nil), forCellWithReuseIdentifier: "MyCell")
        
        self.menuCollectionView.delegate = self
        self.menuCollectionView.dataSource = self
    }
    
}


extension MenuViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return menu.products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = menuCollectionView.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath) as! MyCell
        
        let product = menu.products[indexPath.item]
        cell.setupCell(product: product)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (view.window?.windowScene?.screen.bounds.width)! - 10
        let heith = (view.window?.windowScene?.screen.bounds.width)! - 10
        
        return CGSize(width: width, height: heith)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
    }
}


