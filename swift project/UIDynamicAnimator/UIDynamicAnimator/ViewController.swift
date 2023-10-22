//
//  ViewController.swift
//  UIDynamicAnimator
//
//  Created by Have Dope on 05.02.2023.
//

import UIKit

class ViewController: UIViewController {

    //UiColisionBehavior - обнаружение столкновений
    //UIGravityBehavior -  - обспечивает тяготение
    //UIPushBehavior -  реагирует на толчки
    // UISnapeBehavior -крепит view к определенной точке
    
/* var squareViews = [UIDynamicItem]()
    var animator = UIDynamicAnimator()*/
    
    var squeareView = UIView()
    var animator = UIDynamicAnimator()
    var pushBeahavior = UIPushBehavior()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        createGestureRecognizer()
        createSmallSquerView()
        createAnimationAndBehevior()
        
        

    }
    
    
    
    func createSmallSquerView(){
        squeareView = UIView(frame: CGRect(x: 0, y: 0, width: 80, height: 80))
        squeareView.backgroundColor = .green
        squeareView.center = view.center
        view.addSubview(squeareView)
    }
    
    //добавляем жесть
    func createGestureRecognizer(){
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(hendlertap))
        view.addGestureRecognizer(tapGestureRecognizer)
    }
    
    //реагирование на толчки
    func createAnimationAndBehevior(){
        animator = UIDynamicAnimator(referenceView: view)
        //сощдаем столкновение
        let collision = UICollisionBehavior(items: [squeareView])
        collision.translatesReferenceBoundsIntoBoundary = true
        pushBeahavior = UIPushBehavior(items: [squeareView], mode: .continuous)
        animator.addBehavior(collision)
        animator.addBehavior(pushBeahavior)
    }
    
    @objc func  hendlertap(paramTap: UITapGestureRecognizer ){
        //получение угла view
        let tapPoint: CGPoint = paramTap.location(in: view)
        let squareViewCenterPoint: CGPoint = squeareView.center
        // arc tangent 2((p1.x - p2.x), (p1.x - p2.y))
        let deltaX: CGFloat = tapPoint.x - squareViewCenterPoint.x
        let deltaY: CGFloat = tapPoint.y - squareViewCenterPoint.y
        let angle: CGFloat = atan2(deltaY,deltaX)
        pushBeahavior.angle = angle
        
        let distanceBetweenPoins: CGFloat = sqrt(pow(tapPoint.x - squareViewCenterPoint.x,2.0) + pow(tapPoint.y - squareViewCenterPoint.y, 2.0))
        pushBeahavior.magnitude = distanceBetweenPoins / 200
    }
    
}




/*
squareView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
squareView.backgroundColor = .green
squareView.center = view.center
view.addSubview(squareView)


// создаем аниматор и тяготение
animator = UIDynamicAnimator(referenceView: view)
let gravity = UIGravityBehavior(items: [squareView])
animator.addBehavior(gravity)*/




/*
 //создаем view
 let numberOfView = 2
 squareViews.reserveCapacity(numberOfView)
 let colors =  [UIColor.red, UIColor.green]
 var currentCenterPoint: CGPoint = view.center
 let eachViewSize = CGSize(width: 50, height: 50)
 
 for couter in 0..<numberOfView{
     let newView = UIView(frame: CGRect(x: 0, y: 0, width: eachViewSize.width, height: eachViewSize.height))
     newView.backgroundColor = colors[couter]
     newView.center = currentCenterPoint
     currentCenterPoint.y += eachViewSize.height + 10
     view.addSubview(newView)
     squareViews.append(newView)
 }
animator = UIDynamicAnimator(referenceView: view)
 
 //создаем тяготение
 let gravity = UIGravityBehavior(items: squareViews)
 animator.addBehavior(gravity)
 
 //реализация стокновения
 let collision = UICollisionBehavior(items: squareViews)
 collision.translatesReferenceBoundsIntoBoundary = true
 collision.addBoundary(withIdentifier: "bottomBoundary" as NSCopying, from: CGPoint(x: 0, y: view.bounds.size.height - 100), to: CGPoint(x: view.bounds.size.width, y: view.bounds.size.height - 100))
 collision.collisionDelegate = self
 animator.addBehavior(collision)*/


/*
 extension ViewController: UICollisionBehaviorDelegate{
     func collisionBehavior(_ behavior: UICollisionBehavior, beganContactFor item: UIDynamicItem, withBoundaryIdentifier identifier: NSCopying?, at p: CGPoint) {
         let identifier  = identifier as? String
         let kBottomBoundary = "bottomBoundary"
         if identifier == kBottomBoundary {
             UIView.animate(withDuration: 1 , animations: {
                 let view = item as? UIView
                 view?.backgroundColor = .red
                 view?.alpha = 0
                 view?.transform = CGAffineTransform(scaleX: 2, y: 2)
                 
             }, completion: { (finished) in
               let  view = item as? UIView
                 behavior.removeItem(item)
                 view?.removeFromSuperview()
             })
             
         }
     }
     
 }
*/
