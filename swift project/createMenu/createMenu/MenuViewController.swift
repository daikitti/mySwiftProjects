//
//  MenuViewController.swift
//  createMenu
//
//  Created by Have Dope on 18.02.2023.
//

import UIKit

class MenuViewController: UIViewController {
    
    
    @IBOutlet weak var groupsCollectionView: UICollectionView!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var group:Group!
    var selectedGroup: Group?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.collectionView.register(UINib(nibName: "ProductCell", bundle: nil),  forCellWithReuseIdentifier: "ProductCell")
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        
        self.groupsCollectionView.register(UINib(nibName: "GroupCell", bundle: nil),  forCellWithReuseIdentifier: "GroupCell")
        self.groupsCollectionView.dataSource = self
        self.groupsCollectionView.delegate = self
        
        
        
        if let groups = group.groups, groups.count > 0 {
            selectedGroup = groups.first!
        }else{
            selectedGroup = group
        }
    }
    

}

extension
MenuViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == groupsCollectionView {
            if let groups = group.groups{
                return groups.count
            }else{
                return 0
            }
            
        }else{
            if let products = selectedGroup?.products{
                return products.count
            }else{
                return 0
            }
        }
        
    }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            
            if collectionView == groupsCollectionView {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier:
                                                                "GroupCell",for: indexPath) as! GroupCell
                let group = self.group.groups![indexPath.item]
                cell.setupCell(group: group)
                return cell
            }else{
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier:
                                                                "ProductCell",
                                                              for: indexPath) as! ProductCell
                
                let product = selectedGroup!.products![indexPath.item]
                cell.setupCell(product: product)
                return cell
            }
            
            
        }
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            
            if collectionView == groupsCollectionView {
                let groupName = self.group.groups![indexPath.item].name
                let width = groupName.widtOfString(usingFont: UIFont.systemFont(ofSize: 17))
                
                return CGSize(width: width + 20,
                              height: collectionView.frame.height)
                
            }else{
                return CGSize(width: (view.window?.windowScene?.screen.bounds.width)! - 10,
                              height: ((view.window?.windowScene?.screen.bounds.height)! - 300))
            }
            
            
        }
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
            return 10
        }
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
            return 10
        }
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
            return UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
        }
        
        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            if collectionView == groupsCollectionView {
                self.selectedGroup =  self.group.groups![indexPath.item]
                self.collectionView.scrollToItem(at: IndexPath(item: 0, section: 0), at: .centeredHorizontally, animated: true)
                self .collectionView.reloadData()
                
            }
        }
    }
    

