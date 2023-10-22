//
//  ViewController.swift
//  UITableView
//
//  Created by Have Dope on 11.02.2023.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    @IBOutlet weak var MyTableView: UITableView!
    let identifier = "MyCell"
    
    var array = ["1","2","3","4"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        
        
        
    }
    
    
    @IBAction func editButton(_ sender: Any) {
        MyTableView.isEditing = !MyTableView.isEditing
    }
    
    
}
              
              
              
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        let number = array[indexPath.row]
        cell.textLabel?.text = number
        
        return cell
    }
    
    //DELETE(()
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle{
        return .delete
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            array.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .left)
        }
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
    return true
        
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath){
        
        let item     = array[sourceIndexPath.row]
        array.remove(at: sourceIndexPath.row)
        array.insert(item, at: destinationIndexPath.row )
    }
    func tableView(_ tableView: UITableView, contextMenuConfigurationForRowAt indexPath: IndexPath, point: CGPoint) -> UIContextMenuConfiguration? {

          let actionProvider: UIContextMenuActionProvider = { _ in
              
              return UIMenu(title: "Edit", children: [
                  UIAction(title: "Copy",
                           handler: { _ in
                              let cell = tableView.cellForRow(at: indexPath)
                              let pasteBoard = UIPasteboard.general
                              pasteBoard.string = cell?.textLabel?.text
                           })
              ])
          }
          
          return UIContextMenuConfiguration(identifier: "unique-ID" as NSCopying,
                                            previewProvider: nil,
                                            actionProvider: actionProvider)

      }
}
