//
//  ViewController.swift
//  UIDynamics part 2 UISnap
//
//  Created by Have Dope on 10.02.2023.
//

import UIKit

class ViewController: UIViewController {

    //UISnapBehavior - снимок штука как мочалка
    var squareView = UIView()
    var animator = UIDynamicAnimator()
    var snapBehavior: UISnapBehavior?
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
    }
    override func viewDidAppear(_ animated: Bool){
        super.viewDidAppear(true)
        createGestureRecognizer()
        createSmallSquareView()
        createAnimatorAndBehaviors()
        let itemBehaviour = UIDynamicItemBehavior(items: [squareView])
        itemBehaviour.elasticity = 1
        animator.addBehavior(itemBehaviour)
    }

    
    func createGestureRecognizer(){
        let tap =  UITapGestureRecognizer(target: self, action: #selector(handleTap(paramTap: )))
        view.addGestureRecognizer(tap)
        
    }
    
    func createSmallSquareView(){
        squareView = UIView(frame: CGRect(x: 0, y: 0, width: 80, height: 80))
        squareView.backgroundColor = .white
        squareView.center = view.center
        var image = UIImageView(frame: CGRect(x: 0, y: 0, width: squareView.bounds.size.width, height: squareView.bounds.size.height))
        image.image = UIImage(named: "icons8chervi")
        squareView.addSubview(image)
        
        view.addSubview(squareView)
    }
    
    func createAnimatorAndBehaviors(){
        animator = UIDynamicAnimator(referenceView: view)
        let collision = UICollisionBehavior(items: [squareView])
        collision.translatesReferenceBoundsIntoBoundary = true
        animator.addBehavior(collision)
        
        //зацеп
        snapBehavior = UISnapBehavior(item: squareView, snapTo: squareView.center)
        snapBehavior?.damping = 0
        animator.addBehavior(snapBehavior!)
        
        
    }

    @objc func handleTap(paramTap:UITapGestureRecognizer){
        //получаем угол между центром квадрата view и точкой касания
        let tapPoint = paramTap.location(in: view)
        if snapBehavior != nil{
            animator.removeBehavior(snapBehavior!)
        }
        snapBehavior = UISnapBehavior(item: squareView, snapTo: tapPoint)
        snapBehavior?.damping = 0.5 // средняя осциляция
        animator.addBehavior(snapBehavior!)
        
    }
}

