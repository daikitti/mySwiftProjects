//
//  DetailVC.swift
//  weatherJ
//
//  Created by Have Dope on 26.12.2022.
//

import UIKit
import SwiftSVG

class DetailVC: UIViewController {

    
    
    @IBOutlet var conditionLabel: UILabel!
    
    
    @IBOutlet var tempCity: UILabel!
    
    @IBOutlet weak var nameCityLabel: UILabel!
    
    @IBOutlet var viewCity: UIView!
    
    @IBOutlet var maxTempLabel: UILabel!
    @IBOutlet var minTempLabel: UILabel!
    @IBOutlet var windSpeedLabel: UILabel!
    @IBOutlet var pressureLabel: UILabel!
    
    var weatherModel: Weather?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        refreshLabels()
    }
    
    
    func refreshLabels(){
        nameCityLabel.text = weatherModel?.name
        
        let url = URL(string: "https://yastatic.net/weather/i/icons/blueye/color/svg/\(weatherModel!.conditionCode).svg")
        
        
        let weatherImage = UIView(SVGURL: url!) {(image) in
            image.resizeToFit(self.viewCity.bounds)
        }
        self.viewCity.addSubview(weatherImage)
        
        
        conditionLabel.text = weatherModel?.conditionString
        tempCity.text = "\((weatherModel?.temperatureString)!)"
        pressureLabel.text = "\((weatherModel?.pressureMm)!)"
        windSpeedLabel.text = "\((weatherModel?.windSpeed)!)"
        minTempLabel.text = "\((weatherModel?.tempMin)!)"
        maxTempLabel.text = "\((weatherModel?.tempMax)!)"
        
    }


}
