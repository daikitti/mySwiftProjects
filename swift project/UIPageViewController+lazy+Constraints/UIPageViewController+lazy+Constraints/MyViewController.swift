//
//  myViewController.swift
//  UIPageViewController+lazy+Constraints
//
//  Created by Have Dope on 03.02.2023.
//

import UIKit

class MyViewController: UIPageViewController {
    
    //MARK: - veriable
    var cars = [CarsHalper]()
    let salat = UIImage(named: "salat")
    let susi = UIImage(named: "susi")
    

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "eda"
        
        let firstCar = CarsHalper(name: "salat", image: salat!)
        let lastCar = CarsHalper(name: "polina ", image: susi!)
        cars.append(firstCar)
        cars.append(lastCar)
    }
    
//MARK: - create vc
   lazy var arrayCarViewConrollers: [CarViewController] = {
       var carsVC = [CarViewController]()
        for car in cars {
            carsVC.append(CarViewController(carWith: car))
        }
       return carsVC
    }()
    
    //MARK: - init UIPageViewController
    override init(transitionStyle style: UIPageViewController.TransitionStyle, navigationOrientation: UIPageViewController.NavigationOrientation, options: [UIPageViewController.OptionsKey : Any]? = nil) {
        super.init(transitionStyle: .pageCurl, navigationOrientation: navigationOrientation , options: nil)
        self.view.backgroundColor = .gray
        self.dataSource = self
        self.delegate = self
        setViewControllers([arrayCarViewConrollers[0]], direction: .forward, animated: true, completion: nil)
      
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

extension MyViewController: UIPageViewControllerDataSource, UIPageViewControllerDelegate{
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewController = viewController as? CarViewController else{return nil}
        if let index = arrayCarViewConrollers.firstIndex(of: viewController){
            if index > 0 {
                return arrayCarViewConrollers[index - 1]
            }
        }
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewController = viewController as? CarViewController else{return nil}
        if let index = arrayCarViewConrollers.firstIndex(of: viewController){
            if index < cars.count - 1 {
                return arrayCarViewConrollers[index + 1]
            }
        }
        return nil
    }
    

    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return cars.count
    }
     
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return 0
            
        
    }
    
}
