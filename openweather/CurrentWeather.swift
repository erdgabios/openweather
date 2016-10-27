//
//  CurrentWeather.swift
//  openweather
//
//  Created by G on 27/10/2016.
//  Copyright © 2016 erdgabios. All rights reserved.
//

import UIKit
import Alamofire


class CurrentWeather {
    
    var _cityName: String!
    var _date: String!
    var _weatherType: String!
    var _currentTemp: Int!
    var _detailedWeatherType: String!
    var _icon: String!
    
    
    var cityName: String {
        if _cityName == nil {
            _cityName = ""
        }
        return _cityName
    }
    
    var date: String {
        if _date == nil {
            _date = ""
        }
        return _date
    }
    
    var weatherType: String {
        if _weatherType == nil{
            _weatherType = ""
        }
        return _weatherType
    }
    
    var currentTemp: Int {
        if _currentTemp == nil {
            _currentTemp = -500
        }
        return _currentTemp
    }
    
    var detailedWeatherType: String {
        if _detailedWeatherType == nil {
            _detailedWeatherType = ""
        }
        return _detailedWeatherType
    }
    
    var icon: String {
        if _icon == nil {
            _icon = ""
        }
        return _icon
    }
    
    
    func downloadWeatherDetails(completed: @escaping DownloadComplete) {
      
        let currentWeatherURL = URL(string: STATIC_URL)!
        Alamofire.request(currentWeatherURL).responseJSON { response in
            
            let result = response.result
            
            if let dict = result.value as? Dictionary<String, AnyObject> {
                
                if let name = dict["name"] as? String {
                    
                    self._cityName = name
                    
                    print("CITY NAME: \(self.cityName)")
                }
                
                if let weather = dict["weather"] as? [Dictionary<String, AnyObject>] {
                    
                    if let main = weather[0]["main"] as? String {
                        
                        self._weatherType = main
                        
                        print("WEATHERTYPE: \(self._weatherType)")
                    }
                    
                    if let description = weather[0]["description"] as? String {
                        
                        self._detailedWeatherType = description
                        
                        print("Detailed weather type: \(self.detailedWeatherType)")
                    }
                    
                    if let iconAbbr = weather[0]["icon"] as? String {
                        
                        self._icon = iconAbbr
                        
                        print("Icon: \(self._icon)")
                    }
                }
                
                if let main = dict["main"] as? Dictionary<String, AnyObject> {
                    
                    if let temp = main["temp"] as? Double {
                        
                        let kelvinToCelsius = Int(temp - 273.15)
                        
                        self._currentTemp = kelvinToCelsius
                        
                        print(temp)
                        print("CURRENTTEMP: \(self._currentTemp)")
                        
                    }
                }
                
                if let dt = dict["dt"] as? Double {
                    
                    
                    let dtLocalTime = dt
                    
                    
                    let date = NSDate(timeIntervalSince1970: dtLocalTime)
                    
                    let dateFormatter = DateFormatter()

                    let myLocale = Locale(identifier: "en_GB")


                    dateFormatter.locale = myLocale
                    dateFormatter.dateStyle = .long
                    dateFormatter.timeStyle = .none
                    let currentDate = dateFormatter.string(from: date as Date)
                    
                    print(currentDate)
                }
            }
        
        }
        completed()
    }
}
    
    
    
    

