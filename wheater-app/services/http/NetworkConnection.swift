//
//  networkConnection.swift
//  wheater-app
//
//  Created by Macvps on 4/24/23.
//

import Foundation
import Alamofire
import AlamofireImage
import SwiftyJSON

enum HttpMethods: Int {
    case GET = 0
    case POST = 1
}

class NetworkConnection {
    private var url: String!
    private var ImageURL: String!
    private var method: HttpMethods
    private var weather: Weather?
    
    init(url: String!, imageURL: String! , method: HttpMethods) {
        self.url = url
        self.ImageURL = imageURL
        self.method = method
    }
    
    func getResponse(completion: @escaping (_ response: Any) -> ()) {
        if (method == HttpMethods.GET) {
            AF.request(URL(string: url)!, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).response { response in
                    switch response.result {
                        case .success(_):
                        if let json = try? JSON(data: response.data!) {
                            self.weather = Weather(city: json["name"].stringValue, lat: json["coord"]["lat"].stringValue, lon: json["coord"]["lon"].stringValue, main: json["weather"][0]["main"].stringValue, temp: Float(json["main"]["temp"].stringValue), description: json["weather"][0]["description"].stringValue, icon: json["weather"][0]["icon"].stringValue)
                            
                            completion(self.weather!)
                        }
                        break
                        
                    case .failure(let AFError):
                        print("Api Error is : \(AFError)")
                        completion("")
                        break
                    }
            }
        }else{
            print("Get Api Method is wrong!!")
            completion("")
        }
    }
    
    func getWeatherImage(icon: String, complition: @escaping (_ image: UIImage) -> ()) {
        if !icon.isEmpty {
            let urlString = self.ImageURL + icon + "@2x.png"
            if let encoded = urlString.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed), let url = URL(string: encoded) {
                AF.request(url).responseImage { response in
                    switch response.result {
                        case .success(let image):
                            complition(image)
                            break
                        case .failure(let error):
                            print("Alamofire image error is : \(error)")
                            break
                    }
                }
            }
        }
    }
}
