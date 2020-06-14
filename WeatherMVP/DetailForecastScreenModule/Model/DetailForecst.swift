//
//  DetailForecast.swift
//  WeatherMVP
//
//  Created by Илья Бочков  on 6/14/20.
//  Copyright © 2020 Илья Бочков . All rights reserved.
//

import Foundation

struct DetailForecast: Codable {
    let main: Temperature
    let weather: Array<Weather>
    let wind: Wind
    let dt_txt: String
}


