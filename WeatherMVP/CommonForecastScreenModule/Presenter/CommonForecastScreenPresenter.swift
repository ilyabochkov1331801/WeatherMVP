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
    var detailForecastList: Array<DetailForecast>?
    
    required init(view: CommonForecastScreenViewProtocol, networkService: NetworkServiceProtocol, router: RouterProtocol) {
        self.view = view
        self.networkService = networkService
        self.router = router
    }
    
    func updateForecast(with coordinates: CLLocationCoordinate2D?) {
        guard let coordinates = coordinates else {
            return
        }
        networkService.updateForecast(with: coordinates) {
            [weak self] (result) in
            DispatchQueue.main.async {
                guard let self = self else {
                    return
                }
                switch result {
                case .success(let response):
                    self.detailForecastList = response.list
                    self.view?.set(city: response.city)
                    self.view?.successUpdate()
                case .failure(let error):
                    self.view?.failureUpdate(with: error)
                }
            }
        }
    }
    
    func updateForecast(with cityName: String) {
        
    }
    
    func show(detailForecast: DetailForecast?) {
        guard let detailForecast = detailForecast else {
            return
        }
        router.showDetailForecastScreen(detailForecast: detailForecast)
    }
}
