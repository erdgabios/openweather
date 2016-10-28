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
    var _humidity: Double!
    var _pressure: Double!
    var _windSpeed: Double!
    var _windDeg: Double!
    var _countryCode: String!
    var _sunrise: String!
    var _sunset: String!
    
    
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
    
    var humidity: Double {
        if _humidity == nil {
            _humidity = -3000.00
        }
        return _humidity
    }
    
    var pressure: Double {
        if _pressure == nil {
            _pressure = -3000.00
        }
        return _pressure
    }
    
    var winSpeed: Double {
        if _windSpeed == nil {
            _windSpeed = 1000.0
        }
        return _windSpeed
    }
    
    var windDeg: Double {
        if _windDeg == nil {
            _windDeg = 1000.0
        }
        return _windDeg
    }
    
    var countryCode: String {
        if _countryCode == nil {
            _countryCode = ""
        }
        return _countryCode
    }
    
    var sunrise: String {
        if _sunrise == nil {
            _sunrise = ""
        }
        return _sunrise
    }
    
    var sunset: String {
        if _sunset == nil {
            _sunset = ""
        }
        return _sunset
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
                    
                    if let pressure = main["pressure"] as? Double {
                        
                        self._pressure = pressure
                        
                        print("PRESSURE: \(self._pressure)")
                    }
                    
                    if let humidity = main["humidity"] as? Double {
                        
                        self._humidity = humidity
                        
                        print("HUMIDITY: \(self._humidity)")
                    }
                }
                
                if let wind = dict["wind"] as? Dictionary<String, AnyObject> {
                    
                    if let speed = wind["speed"] as? Double {
                        
                        self._windSpeed = speed
                        
                        print("WIND SPEED: \(self._windSpeed)")
                    }
                    
                    if let deg = wind["deg"] as? Double {
                        
                        self._windDeg = deg
                        
                        print("WIND DEG: \(self._windDeg)")
                    }
                }
                
                if let sys = dict["sys"] as? Dictionary<String, AnyObject> {
                    
                    if let country = sys["country"] as? String {
                        
                        self._countryCode = country
                        
                        print("COUNTRY: \(self._countryCode)")
                    }
                    
                    if let sunrise = sys["sunrise"] as? Double {
                        
                        let sunrise = NSDate(timeIntervalSince1970: sunrise)
                        
                        let dateFormatter = DateFormatter()
                        
                        let myLocale = Locale(identifier: "en_GB")
                        
                        
                        dateFormatter.locale = myLocale
                        dateFormatter.dateStyle = .none
                        dateFormatter.timeStyle = .short
                        let sunriseTime = dateFormatter.string(from: sunrise as Date)
                        self._sunrise = sunriseTime
                        
                        print("SUNRISE TIME: \(self._sunrise)")
                    }
                    
                    if let sunset = sys["sunset"] as? Double {
                        
                        let sunset = NSDate(timeIntervalSince1970: sunset)
                        
                        let dateFormatter = DateFormatter()
                        
                        let myLocale = Locale(identifier: "en_GB")
                        
                        
                        dateFormatter.locale = myLocale
                        dateFormatter.dateStyle = .none
                        dateFormatter.timeStyle = .short
                        let sunsetTime = dateFormatter.string(from: sunset as Date)
                        self._sunset = sunsetTime
                        
                        print("SUNSET TIME: \(self._sunset)")
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
                    self._date = currentDate
                    
                    print("CURRENT DATE: \(self._date)")
                    
                }
            }
        
        }
        completed()
    }
}
    
