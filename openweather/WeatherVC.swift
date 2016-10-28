//
//  WeatherVC.swift
//  openweather
//
//  Created by G on 27/10/2016.
//  Copyright © 2016 erdgabios. All rights reserved.
//

import UIKit
import Alamofire



class WeatherVC: UIViewController {
    
    var currentWeather = CurrentWeather()
    
    
    @IBOutlet weak var cityCountryCodeLbl: UILabel!
    @IBOutlet weak var weatherTime: UILabel!
    @IBOutlet weak var weatherTypeImage: UIImageView!
    @IBOutlet weak var currentTemp: UILabel!
    @IBOutlet weak var detailedWeatherTypeLbl: UILabel!
    @IBOutlet weak var cloudsLbl: UILabel!
    @IBOutlet weak var rainLbl: UILabel!
    @IBOutlet weak var humidityLbl: UILabel!
    @IBOutlet weak var pressureLbl: UILabel!
    @IBOutlet weak var windspLbl: UILabel!
    @IBOutlet weak var winddegLbl: UILabel!
    @IBOutlet weak var sunriseLbl: UILabel!
    @IBOutlet weak var sunsetLbl: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        currentWeather = CurrentWeather()
        
        
        currentWeather.downloadWeatherDetails {
            // Code to update UI
            
            self.updateUI()
            
        }
    }
    
    func updateUI() {
        
        cityCountryCodeLbl.text = currentWeather.cityName + ", " + currentWeather.countryCode
        weatherTime.text = currentWeather.date
        weatherTypeImage.image = UIImage(named: currentWeather.weatherType)
        currentTemp.text = "\(currentWeather.currentTemp) °C"
        detailedWeatherTypeLbl.text = currentWeather.detailedWeatherType
        cloudsLbl.text = "Clouds: \(currentWeather.cloudsPercent) %"
        rainLbl.text = "Rain: \(currentWeather.rain) mm"
        humidityLbl.text = "Humidity: \(currentWeather.humidity) %"
        pressureLbl.text = "Pressure: \(currentWeather.pressure) hpa"
        windspLbl.text = "Wind sp: \(currentWeather.winSpeed) km/h"
        winddegLbl.text = "Wind deg: \(currentWeather.windDeg) °"
        sunriseLbl.text = "Sunrise: \(currentWeather.sunrise)"
        sunsetLbl.text = "Sunset: \(currentWeather.sunset)"
    }
    
    
    
    
    
    
    
}

