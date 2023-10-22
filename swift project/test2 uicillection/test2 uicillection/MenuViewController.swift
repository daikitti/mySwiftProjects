//
//  MenuViewController.swift
//  test2 uicillection
//
//  Created by Have Dope on 26.02.2023.
//

import UIKit

class MenuViewController: UIViewController {
    
    let menu:Menu = Menu()
    var selectedIndex = 0
    
    @IBOutlet weak var groupsCollectionsView: UICollectionView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.register(UINib(nibName: "MyCell", bundle: nil), forCellWithReuseIdentifier: "MyCell")
        groupsCollectionsView.register(UINib(nibName: "categoryCell", bundle: nil), forCellWithReuseIdentifier: "categoryCell")
        
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        
        self.groupsCollectionsView.delegate = self
        self.groupsCollectionsView.dataSource = self
        //self.collectionView.backgroundColor = UIColor(patternImage: UIImage(named: "unnamed")!)
       
        
        
    }
    
}
    extension MenuViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
            if collectionView == groupsCollectionsView{
                return menu.groups.count
            }else{
                let group =  menu.groups[selectedIndex]
                return group.products.count
            }
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            
            if collectionView == groupsCollectionsView{
                let groupCell = groupsCollectionsView.dequeueReusableCell(withReuseIdentifier: "categoryCell", for: indexPath) as! categoryCell
                groupCell.layer.cornerRadius = 5
                groupCell.layer.masksToBounds = true
                groupCell.layer.backgroundColor = UIColor.white.cgColor/*(red: 227/225, green: 204/225, blue: 237/225, alpha: 1)*/
                groupCell.layer.shadowColor = UIColor.gray.cgColor
                groupCell.layer.shadowOffset = CGSize(width: 0, height: 2.0)//CGSizeMake(0, 2.0);
                groupCell.layer.shadowRadius = 2.0
                groupCell.layer.shadowOpacity = 1.0
                groupCell.layer.masksToBounds = false
                groupCell.layer.shadowPath = UIBezierPath(roundedRect:groupCell.bounds, cornerRadius:groupCell.contentView.layer.cornerRadius).cgPath
                let groups = menu.groups[indexPath.item]
                groupCell.SetupGroupsLabel(groups: groups)
                return groupCell
                
            }else{
                
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath) as! MyCell
                cell.layer.cornerRadius = 35
            
               
                
                
                let group = menu.groups[selectedIndex]
                let product = group.products[indexPath.item]
                cell.setupImage(product: product)
                return cell
            }
                
           
        }
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
            
            if collectionView == groupsCollectionsView{
               
                
                let wigth =  collectionView.frame.width/1.1 - 10
                let heigth = collectionView.frame.height - 10
                return CGSize(width: wigth, height: heigth)
            }else{
                
                let wigth = view.bounds.size.width - 20
                let heigth = view.bounds.size.height/4 - 10
                return CGSize(width: wigth, height: heigth)
            }
        }
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat{
            return 10
        }
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
            UIEdgeInsets(top: 0, left: 5, bottom: 20, right: 5)
        }
        
        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            if collectionView == groupsCollectionsView {
                selectedIndex = indexPath.item
                self.collectionView.scrollToItem(at: IndexPath(item: 0, section: 0), at: .bottom, animated: true)
                self.collectionView.reloadData()
      
            }else{
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath) as! MyCell
            
               
                
                
                let group = menu.groups[selectedIndex]
                let product = group.products[indexPath.item]
                cell.setupImage(product: product)
             //   cell.buttonAction(Any.self)
                
                
               
                
            }
        }
    }



