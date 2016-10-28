//
//  Constants.swift
//  openweather
//
//  Created by G on 27/10/2016.
//  Copyright © 2016 erdgabios. All rights reserved.
//

import Foundation


let BASE_URL = "http://api.openweathermap.org/data/2.5/weather?q="

let CITY_NAME = "Kosice"

let TAIL_URL = "&appid=a59ceb219a3a03f8bc25ede69cfaf865"

let STATIC_URL = "http://api.openweathermap.org/data/2.5/weather?q=Lisbon&appid=a59ceb219a3a03f8bc25ede69cfaf865"

let CITY_URL = "\(BASE_URL)\(CITY_NAME)\(TAIL_URL)"


typealias DownloadComplete = () -> ()











