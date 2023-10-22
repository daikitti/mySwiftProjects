//
//  ViewController.swift
//  first game
//
//  Created by Have Dope on 08.12.2022.
//

import UIKit

class ViewController: UIViewController {

   
    @IBOutlet weak var DateTF: UITextField!
    @IBOutlet weak var MonthTF: UITextField!
    @IBOutlet weak var YearTF: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    
    
    @IBAction func findDay(_ sender: UIButton) {
        
        guard let day = DateTF.text,
              let month = MonthTF.text,
              let year = YearTF.text
        else {return}
        
        let calendar = Calendar.current
        var dateComponets = DateComponents()
        
        dateComponets.day = Int(day)
        dateComponets.month = Int(month)
        dateComponets.year = Int(year)
        
        let dateFormatted = DateFormatter()
        dateFormatted.dateFormat = "EEEE"
        dateFormatted.locale = Locale(identifier: "ru_Ru")
       
        
        guard  let date = calendar.date(from: dateComponets) else {return}
        
     let weekDay = dateFormatted.string(for: date)
        let capitalizedWeekDay = weekDay!.capitalized
        
        resultLabel.text = capitalizedWeekDay
       
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
}

