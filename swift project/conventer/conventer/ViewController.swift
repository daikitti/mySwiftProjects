//
//  ViewController.swift
//  conventer
//
//  Created by Have Dope on 17.12.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var cenliusLabel: UILabel!
    @IBOutlet weak var fahrenheitLabel: UILabel!
    @IBOutlet weak var slider: UISlider!{
        didSet{
            slider.maximumValue = 100
            slider.minimumValue = 0
            slider.value = 0
        }
    }
    
    
    @IBAction func sliderChanged(_ sender: UISlider) {
        let temperatureCelsius = Int(sender.value)
        cenliusLabel.text = "\(temperatureCelsius)ºC"
        let x = (sender.value * 9/5) + 32
        let fahrengateTemperature = x
        fahrenheitLabel.text = String( format: "%.2f", fahrengateTemperature, "ºF")
        
    }
}

