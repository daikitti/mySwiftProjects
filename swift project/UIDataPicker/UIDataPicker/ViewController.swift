//
//  ViewController.swift
//  UIDataPicker
//
//  Created by Have Dope on 15.01.2023.
//

import UIKit

class ViewController: UIViewController {
     
    let picker = UIDatePicker()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        picker.center = view.center
     
        picker.datePickerMode = .countDownTimer
        
        self.view.addSubview(picker)
        
        var oneYearTime = TimeInterval()
        oneYearTime = 365*24*60*60
        
        let todeyData = Date()
        
        let oneYearFromToday = todeyData.addingTimeInterval(oneYearTime)
        let twoYearFromDate = todeyData.addingTimeInterval(3*oneYearTime)
        picker.minimumDate = oneYearFromToday
        picker.maximumDate = twoYearFromDate
        picker.countDownDuration = 2 * 60 * 60
        
        picker.addTarget(self, action: #selector(dataPickerCheange(paramdataPicker: )), for: .valueChanged)
    }

    @objc func dataPickerCheange(paramdataPicker: UIDatePicker) {
        if paramdataPicker.isEqual(self.picker) {
            print ("dataChenge : = ", paramdataPicker.date)
        }
    }
}
/*
extension ViewController: UIPickerViewDataSource {
    // Сколько компонентов выводить
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    // Сколько строк в компоненте
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 10
    }
}

extension ViewController: UIPickerViewDelegate{
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let result = "row = \(row)"
        
        return result
    }
}*/
