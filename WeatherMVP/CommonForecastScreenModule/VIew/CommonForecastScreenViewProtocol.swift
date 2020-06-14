//
//  CommonForecastScreenViewProtocol.swift
//  WeatherMVP
//
//  Created by Илья Бочков  on 6/14/20.
//  Copyright © 2020 Илья Бочков . All rights reserved.
//

import Foundation

protocol CommonForecastScreenViewProtocol: class {
    func set(cityName: String)
    func successUpdate()
    func failureUpdate(with error: Error)
}
