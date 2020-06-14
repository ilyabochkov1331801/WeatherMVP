//
//  DetailForecastScreenPresenterProtocol.swift
//  WeatherMVP
//
//  Created by Илья Бочков  on 6/14/20.
//  Copyright © 2020 Илья Бочков . All rights reserved.
//

import Foundation

protocol DetailForecastScreenPresenterProtocol: class {
    var router: RouterProtocol { get }
    init(view: DetailForecastScreenViewProtocol, detailForecast: DetailForecast, networkService: NetworkServiceProtocol, router: RouterProtocol)
    func updateForecast()
}
