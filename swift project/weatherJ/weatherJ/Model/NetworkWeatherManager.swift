//
//  NetworkWeatherManager.swift
//  weatherJ
//
//  Created by Have Dope on 24.12.2022.
//

import Foundation

struct NetworkWeatherManager{
    
    func fetchWeather(latitude:Double, longitude: Double, completionHandler: @escaping(Weather) ->Void ){
        
        let urlString = "https://api.weather.yandex.ru/v2/forecast?lat=\(latitude)&lon=\(longitude)"
        // 50.257453, 127.534612
        guard let url = URL(string: urlString) else { return }
        
        var request = URLRequest(url: url , timeoutInterval: Double.infinity)
        request.addValue("\(apiKey)", forHTTPHeaderField: "X-Yandex-API-Key")
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data else {
                print(String(describing: error))
                return
                
                }
                //print(String(data: data, encoding: .utf8)!)
            if let weather = self.parseJSON(withData: data){
            //    print(weather)
                completionHandler(weather)
            }
        }
        task.resume()
    }
    
    func parseJSON(withData data: Data) -> Weather? {
        let decoder = JSONDecoder()
        do {
            let weatherData = try decoder.decode(WeatherData.self, from: data)
            guard let weather = Weather(weatherData: weatherData) else {
                return nil
            }
            return weather
            
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        return nil
    }
}
