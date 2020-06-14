//
//  DetailForecastScreenPresenter.swift
//  WeatherMVP
//
//  Created by Илья Бочков  on 6/14/20.
//  Copyright © 2020 Илья Бочков . All rights reserved.
//

import Foundation

class DetailForecastScreenPresenter: DetailForecastScreenPresenterProtocol {
    
    var router: RouterProtocol
    var detailForecast: DetailForecast
    let view: DetailForecastScreenViewProtocol
    let networkService: NetworkServiceProtocol
    
    required init(view: DetailForecastScreenViewProtocol, detailForecast: DetailForecast, networkService: NetworkServiceProtocol, router: RouterProtocol) {
        self.view = view
        self.detailForecast = detailForecast
        self.router = router
        self.networkService = networkService
    }
    
    func updateForecast() {
        
    }
}
