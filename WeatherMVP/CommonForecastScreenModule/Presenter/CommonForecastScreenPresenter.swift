//
//  CommonForecastScreenPresenter.swift
//  WeatherMVP
//
//  Created by Илья Бочков  on 6/14/20.
//  Copyright © 2020 Илья Бочков . All rights reserved.
//

import CoreLocation

class CommonForecastScreenPresenter: CommonForecastScreenPresenterProtocol {
    
    var router: RouterProtocol
    weak var view: CommonForecastScreenViewProtocol?
    let networkService: NetworkServiceProtocol
    var apiResponse: ApiResponse?
    
    required init(view: CommonForecastScreenViewProtocol, networkService: NetworkServiceProtocol, router: RouterProtocol) {
        self.view = view
        self.networkService = networkService
        self.router = router
    }
    
    func updateForecast(with coordinates: CLLocationCoordinate2D) {
        
    }
    
    func updateForecast(with cityName: String) {
        
    }
    
    func show(detailForecast: DetailForecast) {
        
    }
}
