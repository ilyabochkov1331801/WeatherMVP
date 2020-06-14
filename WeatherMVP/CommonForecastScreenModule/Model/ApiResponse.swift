//
//  ApiResponse.swift
//  WeatherMVP
//
//  Created by Илья Бочков  on 6/14/20.
//  Copyright © 2020 Илья Бочков . All rights reserved.
//

import Foundation

struct ApiResponse: Codable {
    let city: City
    let list: Array<DetailForecast>
}
