//
//  WeatherVC.swift
//  openweather
//
//  Created by G on 27/10/2016.
//  Copyright © 2016 erdgabios. All rights reserved.
//

import UIKit


class WeatherVC: UIViewController {
    
    let date = NSDate(timeIntervalSince1970: 1477579920)
    
    var currentWeather = CurrentWeather()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(STATIC_URL)
        print(CITY_URL)
    
        //let date = NSDate(timeIntervalSince1970: 1477579920)
        print("Az ido: \(date)")
        
        currentWeather.downloadWeatherDetails() {
            
        }
        
        
    }

 

}

