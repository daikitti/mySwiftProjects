//
//  MyTableViewController.swift
//  MVC
//
//  Created by Have Dope on 13.02.2023.
//

import UIKit

class MyTableViewController: UITableViewController {
    
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var isPushSwitch: UISwitch!
    @IBOutlet weak var polSegment: UISegmentedControl!
    
    let userDefaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let name = userDefaults.object(forKey: "name"){
            nameTextField.text = name as? String
        }
        
        if let last = userDefaults.object(forKey: "lastName" ){
            lastNameTextField.text = last as? String
        }
        if let pushSwitch = userDefaults.object(forKey: "switch"){
            isPushSwitch.isOn = pushSwitch as! Bool
        }
        if let pol = userDefaults.object(forKey: "segment"){
            polSegment.selectedSegmentIndex = pol as! Int
        }
    }
    
    @IBAction func saveButton(_ sender: UIButton) {
        
        userDefaults.setValue(nameTextField.text, forKey: "name")
        userDefaults.setValue(lastNameTextField.text, forKey: "lastName")
        userDefaults.set(isPushSwitch.isOn, forKey: "switch")
        userDefaults.set(polSegment.selectedSegmentIndex, forKey: "segment")
        print("save")
        lastNameTextField.resignFirstResponder()
        
    }
    
}
















/*
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }


    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if  let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? MyTableViewCell {
            
            let item = itemArray[indexPath.row]
            
            cell.refresh(item)
            
            return cell
            
        }
        return UITableViewCell()
        
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    */
    

