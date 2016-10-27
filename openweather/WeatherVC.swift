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
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(CONCAT_URL)
        print(URL)
    
        //let date = NSDate(timeIntervalSince1970: 1477579920)
        print("Az ido: \(date)")
        
        
    }

 

}

