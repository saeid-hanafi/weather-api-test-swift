//
//  AppDelegate.swift
//  wheater-app
//
//  Created by Macvps on 4/19/23.
//

import UIKit
import CoreLocation

@main
class AppDelegate: UIResponder, UIApplicationDelegate, CLLocationManagerDelegate {

    static let APIKEY: String = "9fe18980b36576bfc51c0ee5196293cf"
    static let WEATHERURL: String = "https://api.openweathermap.org/data/2.5/weather?"
    static let IMGURL = "https://openweathermap.org/img/wn/"

    let locationManager = CLLocationManager()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        if let keys = launchOptions?.keys {
            if keys.contains(.location) {
                locationManager.delegate = self
                locationManager.startMonitoringVisits()
            }
        }
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }

    func application(_ application: UIApplication, shouldSaveSecureApplicationState coder: NSCoder) -> Bool {
        coder.encode(1.0, forKey: "MyAppVersion")
        
        return true
    }
    
    func application(_ application: UIApplication, shouldRestoreSecureApplicationState coder: NSCoder) -> Bool {
        let version = coder.decodeFloat(forKey: "MyAppVersion")
        if version == 1.0 {
            return true
        }
        
        return false
    }

}

