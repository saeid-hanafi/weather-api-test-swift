//
//  CustomLocation.swift
//  wheater-app
//
//  Created by Macvps on 4/26/23.
//

import Foundation
import CoreLocation
import SwiftLocation

class CustomLocationManager {
    func getCurrentLoc(completion: @escaping (_ loc: CLLocationCoordinate2D) -> ()) {
        
        /*
         Use CoreLocation
         */
//        completion(CLLocationManager().location!.coordinate)
        
        /*
         Use Location By SwiftLocation Library
         */
        completion(SwiftLocation.lastKnownGPSLocation!.coordinate)
        
//        SwiftLocation.gpsLocation().then { result in
//            switch result {
//            case .success(let data):
//                completion(data.coordinate)
//                break
//            case .failure(let error):
//                let msg = "Swift Location Error is : \(error)"
//                print(msg)
//                self.weatherDelegate?.getWeatherError(error: msg)
//                break
//            }
//        }
    }
}
