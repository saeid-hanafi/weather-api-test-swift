//
//  weatherInfoModel.swift
//  wheater-app
//
//  Created by Macvps on 4/24/23.
//

import Foundation
import SwiftLocation

protocol Weatherdelegate: ViewController {
    func getWeather(weather: Weather, image: UIImage)
    func getWeatherError(error: String)
}

class WeatherInfoModel {

    private let url = AppDelegate.WEATHERURL
    private let token = AppDelegate.APIKEY
    private let imageUrl = AppDelegate.IMGURL
    weak var weatherDelegate: Weatherdelegate?
    private let locManagerService: CustomLocationManager = CustomLocationManager()
    
    /**
     This Method Gets User Last Location
     */
    private func getWeatherURL(completion: @escaping (_ url: String) -> ()) {
        
        locManagerService.getCurrentLoc { loc in
            if (!self.url.isEmpty && !self.token.isEmpty) {
                let lat: Double = Double(loc.latitude)
                let long: Double = Double(loc.longitude)

                let finalURL = self.url + "lat=\(lat)&lon=\(long)&appid=\(self.token)"

                completion(finalURL)
            }
        }
    }
    
    /**
     This Method Gets Weather Information By Last Location
     */
    func getWeatherInfo() {
        self.getWeatherURL { url in
            let networkConnection = NetworkConnection(url: url, imageURL: self.imageUrl, method: .GET)
            
            networkConnection.getResponse { response in
                
                let result = response as! Weather
                
                networkConnection.getWeatherImage(icon: result.getIcon()) { image in
                    self.weatherDelegate?.getWeather(weather: result, image: image)
                }
            }
        }
    }
}
