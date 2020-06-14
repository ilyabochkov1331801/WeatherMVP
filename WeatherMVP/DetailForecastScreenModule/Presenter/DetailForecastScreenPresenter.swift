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
    
    func updateIcon(with id: String) {
        networkService.getIcon(with: id) {
            [weak self] (result) in
            guard let self = self else {
                return
            }
            DispatchQueue.main.async {
                switch result {
                case .success(let image):
                    self.view.set(picture: image)
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
    
    func updateForecast() {
        view.set(detailForecast: detailForecast)
    }
}
