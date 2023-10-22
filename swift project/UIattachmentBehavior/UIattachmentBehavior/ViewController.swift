//
//  ViewController.swift
//  UIattachmentBehavior
//
//  Created by Have Dope on 10.02.2023.
//

import UIKit

class ViewController: UIViewController {
    // UIattachmentBehavior - привязка
    // UIsnapBehavior - снимок
    
    var squareView = UIView()
    var squareViewAnnchorView = UIView()
    var anchorView = UIView()
    var animator = UIDynamicAnimator()
    var attachmentBehavior: UIAttachmentBehavior?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createGuestureRecognizer()
        createSmallSquareView()
        createAnchorView()
        createAnimationAndBehaviors()
        
    }
    // создаем квадрат  и в нем еще один
    func createSmallSquareView(){
        squareView = UIView(frame: CGRect(x: 0, y: 0, width: 80, height: 80))
        squareView.backgroundColor = .green
        squareView.center = view.center
        squareViewAnnchorView = UIView(frame:  CGRect(x: 60, y: 0, width: 20, height: 20))
        squareViewAnnchorView.backgroundColor = .brown
        squareView.addSubview(squareViewAnnchorView)
        self.view.addSubview(squareView)
    }

    //view c точкой привязки
    func createAnchorView(){
        anchorView = UIView(frame: CGRect(x: 120, y: 450, width: 20, height: 20))
        anchorView.backgroundColor = .red
        view.addSubview(anchorView)
    }
    //создадим регистратор жеста панорамирования (жест положения пальца )
    func createGuestureRecognizer(){
        let panGuesureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(handlerPan(paramPan: )))
        view.addGestureRecognizer(panGuesureRecognizer)
    }

    //Создаем столкновение и прекрепление
    func createAnimationAndBehaviors(){
        animator = UIDynamicAnimator(referenceView: view)
        //столкновение
        let collision = UICollisionBehavior(items: [squareView])
        collision.translatesReferenceBoundsIntoBoundary = true
        attachmentBehavior = UIAttachmentBehavior(item: squareView, attachedToAnchor: anchorView.center)
        animator.addBehavior(collision)
        animator.addBehavior(attachmentBehavior!)
    }
    
    //метод определяет где палец туда красный квадрат а потом привязка к большому
    @objc func  handlerPan(paramPan: UIGestureRecognizer){
        let tapPoint = paramPan.location(in: view)
        print(paramPan)
        attachmentBehavior?.anchorPoint = tapPoint
        anchorView.center = tapPoint
    }
    
}

