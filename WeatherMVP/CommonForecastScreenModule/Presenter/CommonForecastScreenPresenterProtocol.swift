//
//  CommonForecastScreenPresenterProtocol.swift
//  WeatherMVP
//
//  Created by Илья Бочков  on 6/14/20.
//  Copyright © 2020 Илья Бочков . All rights reserved.
//

import CoreLocation

protocol CommonForecastScreenPresenterProtocol {
    var detailForecastList: Array<DetailForecast>? { get }
    var router: RouterProtocol { get }
    init(view: CommonForecastScreenViewProtocol, networkService: NetworkServiceProtocol, router: RouterProtocol)
    func updateForecast(with coordinates: CLLocationCoordinate2D?)
    func updateForecast(with cityName: String)
    func show(detailForecast: DetailForecast?)
}
