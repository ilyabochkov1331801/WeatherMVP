//
//  DetailForecastScreenViewProtocol.swift
//  WeatherMVP
//
//  Created by Илья Бочков  on 6/14/20.
//  Copyright © 2020 Илья Бочков . All rights reserved.
//

import UIKit

protocol DetailForecastScreenViewProtocol: class {
    func set(detailForecast: DetailForecast)
    func set(picture: UIImage)
}
