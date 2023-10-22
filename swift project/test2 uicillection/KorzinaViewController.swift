//
//  KorzinaViewController.swift
//  test2 uicillection
//
//  Created by Have Dope on 06.03.2023.
//

import UIKit

class KorzinaViewController: UIViewController {

    @IBOutlet weak var korzinaViewController: UICollectionView!
    
    var selectedIndex: Int?
    
    let menu:Menu = Menu()
    override func viewDidLoad() {
        super.viewDidLoad()
        korzinaViewController.register(UINib(nibName: "MyCell", bundle: nil), forCellWithReuseIdentifier: "MyCell")
        
        
        
    }
    

  

}

extension KorzinaViewController: UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath) as! MyCell
        
       
        
        
        let group = menu.groups[selectedIndex!]
        let product = group.products[selectedIndex!]
        cell.setupImage(product: product)
        return cell
    }
    
    
    
}
