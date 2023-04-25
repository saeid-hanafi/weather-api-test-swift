//
//  WheaterModel.swift
//  wheater-app
//
//  Created by Macvps on 4/19/23.
//

import Foundation
import UIKit

class Weather {
    private var city: String!
    private var lat: String!
    private var lon: String!
    private var main: String!
    private var temp: Float!
    private var description: String!
    private var icon: String!
    private var image: UIImage?
    
    init(city: String!, lat: String!, lon: String!, main: String!, temp: Float!, description: String!, icon: String!, image: UIImage? = nil) {
        self.city = city
        self.lat = lat
        self.lon = lon
        self.main = main
        self.temp = temp
        self.description = description
        self.icon = icon
        self.image = image
    }
    
    func getCityName() -> String {
        return self.city
    }
    
    func getLatitude() -> String {
        return self.lat
    }
    
    func getLangitude() -> String {
        return self.lon
    }
    
    func getMain() -> String {
        return self.main
    }
    
    func getTemprature() -> Float {
        return self.temp
    }
    
    func getDescription() -> String {
        return self.description
    }
    
    func getIcon() -> String {
        return self.icon
    }
    
    func setImage(image: UIImage) {
        self.image = image
    }
    
    func getImage() -> UIImage? {
        guard self.image != nil else {
            return self.image
        }
        return nil
    }
}
