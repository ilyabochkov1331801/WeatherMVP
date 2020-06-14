//
//  TemperatureConverterService.swift
//  WeatherMVP
//
//  Created by Илья Бочков  on 6/14/20.
//  Copyright © 2020 Илья Бочков . All rights reserved.
//

import Foundation

class TemperatureConverterService: TemperatureConverterServiceProtocol {
    func convertTemperature(kelvin: Double?) -> String? {
        guard let kelvin = kelvin else {
            return nil
        }
        return String(format:"%.1f", kelvin - 273.1) + " ℃"
    }
}

