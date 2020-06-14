//
//  TemperatureConverterServiceProtocol.swift
//  WeatherMVP
//
//  Created by Илья Бочков  on 6/14/20.
//  Copyright © 2020 Илья Бочков . All rights reserved.
//

import Foundation

protocol TemperatureConverterServiceProtocol {
    func convertTemperature(kelvin: Double?) -> String?
}
