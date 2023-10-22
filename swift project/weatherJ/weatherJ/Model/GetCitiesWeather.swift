//
//  GetCitiesWeather.swift
//  weatherJ
//
//  Created by Have Dope on 25.12.2022.
//

import Foundation
import CoreLocation

let networkWeatherManager = NetworkWeatherManager()

func getCityWeather(citiesArray: [String], comletionHandler: @escaping (Int, Weather) -> Void){
    
    for (index, item) in citiesArray.enumerated()
    {
        getCoordinateFrom(city: item) { (coordinate, error) in
            guard let coordinate = coordinate, error == nil else {return}
            
            networkWeatherManager.fetchWeather(latitude: coordinate.latitude, longitude: coordinate.longitude) { (weather) in
                comletionHandler(index, weather)
            }
        }
    }
    
}

func getCoordinateFrom (city: String , completion: @escaping(_ coordinate: CLLocationCoordinate2D?,_ error: Error?) -> () ) {
    CLGeocoder().geocodeAddressString(city) { (placemark, error) in
        completion(placemark?.first?.location?.coordinate, error)
    }
    
    
}
