//
//  ViewController.swift
//  MVC UserDefaults
//
//  Created by Have Dope on 13.02.2023.
//

import UIKit

class ViewController: UIViewController {

    let tableViewController = UITableViewController(style: .plain)
    var refresh = UIRefreshControl()
    
    var allTime = [Date]()
    var cellIndetifier = "Cell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createTableView()
        self.refresh.addTarget(self, action: #selector(handleRefresh(param: )), for: .valueChanged)
        self.refresh.tintColor = .black
        view.addSubview(tableViewController.tableView)
        tableViewController.tableView.addSubview(refresh)
        
        
    }
    
    @objc func handleRefresh(param: UIRefreshControl){
        allTime.append(Date())
        refresh.endRefreshing()
        
        let indexPathNewRow = IndexPath(row: allTime.count-1, section: 0)
        tableViewController.tableView.insertRows(at: [indexPathNewRow], with: .automatic)
    }


    func createTableView(){
        
        tableViewController.tableView = UITableView(frame: CGRect(x: 0, y: 70, width: view.bounds.width, height: view.bounds.height), style: .plain)
        tableViewController.tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIndetifier)
        tableViewController.tableView.delegate = self
        tableViewController.tableView.dataSource = self
    }
    
    
    
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allTime.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIndetifier, for: indexPath)
        
        let date = allTime[indexPath.row]
     
        cell.textLabel?.text = "\(date)"
        
        
        return cell
        
    }
    
    
}
