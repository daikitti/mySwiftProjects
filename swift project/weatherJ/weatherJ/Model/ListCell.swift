//
//  ListCell.swift
//  weatherJ
//
//  Created by Have Dope on 25.12.2022.
//

import UIKit

class ListCell: UITableViewCell {

    @IBOutlet weak var tempCityLabel: UILabel!
    
    @IBOutlet weak var nameCityLabel: UILabel!
    
    @IBOutlet weak var conditionCityLabel: UILabel!
    
    
    func configure(weather: Weather)
    {
        self.nameCityLabel.text = weather.name
        self.conditionCityLabel.text = weather.conditionString
        self.tempCityLabel.text = weather.temperatureString
    }
    
}

