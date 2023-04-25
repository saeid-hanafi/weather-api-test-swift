//
//  AppDelegate.swift
//  wheater-app
//
//  Created by Macvps on 4/19/23.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    static let APIKEY: String = "9fe18980b36576bfc51c0ee5196293cf"
    static let WEATHERURL: String = "https://api.openweathermap.org/data/2.5/weather?"
    static let IMGURL = "https://openweathermap.org/img/wn/"

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
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


}

