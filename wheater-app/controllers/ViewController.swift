//
//  ViewController.swift
//  wheater-app
//
//  Created by Macvps on 4/19/23.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    let locationManager = CLLocationManager()
    @IBOutlet var locNameLabel: UILabel!
    
    @IBOutlet var weatherStatusImg: UIImageView!
    
    @IBOutlet var progressBar: UIActivityIndicatorView!
    
    private let weatherModel: WeatherInfoModel = WeatherInfoModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        locationManager.startMonitoringVisits()
        
        weatherModel.weatherDelegate = self
        self.progressBar.isHidden = true
        self.progressBar.stopAnimating()
    }

    private func getWeatherInfoForView() {
        self.progressBar.isHidden = false
        self.progressBar.startAnimating()
        
        weatherModel.getWeatherInfo()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.getWeatherInfoForView()
    }
    
    
    @IBAction func refreshBtnAction(_ sender: Any) {
        self.progressBar.isHidden = false
        self.progressBar.startAnimating()
        self.getWeatherInfoForView()
    }
}

extension ViewController: Weatherdelegate {
    func getWeather(weather: Weather, image: UIImage) {
        let city: String = weather.getCityName()
        let main: String = weather.getMain()
        let des: String = weather.getDescription()
        
        if (!city.isEmpty && !main.isEmpty && !des.isEmpty) {
            self.locNameLabel.text = city + "\n" + main + "\n" + des
        }
        
        self.weatherStatusImg.image = image
        self.progressBar.isHidden = true
        self.progressBar.stopAnimating()
    }
    
    func getWeatherError(error: String) {
        print(error)
    }
}

