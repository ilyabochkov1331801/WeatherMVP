//
//  AssemblyBuilder.swift
//  WeatherMVP
//
//  Created by Илья Бочков  on 6/14/20.
//  Copyright © 2020 Илья Бочков . All rights reserved.
//

import UIKit

class AssemblyBuilder: AssemblyBuilderProtocol {
    func createCommonForecastScreenModule(router: RouterProtocol) -> UIViewController {
        let commonForecastScreenTableViewController = CommonForecastScreenTableViewController()
        let networkService = NetworkService()
        let commonForecastScreenPresenter = CommonForecastScreenPresenter(view: commonForecastScreenTableViewController,
                                                                          networkService: networkService,
                                                                          router: router)
        commonForecastScreenTableViewController.presenter = commonForecastScreenPresenter
        return commonForecastScreenTableViewController
    }
    
    func createDetailForecastScreenModule(detailForecast: DetailForecast, router: RouterProtocol) -> UIViewController {
        let detailForecastScreenViewController = DetailForecastScreenViewController()
        let networkService = NetworkService()
        let detailForecastScreenPresenter = DetailForecastScreenPresenter(view: detailForecastScreenViewController,
                                                                          detailForecast: detailForecast,
                                                                          networkService: networkService,
                                                                          router: router)
        detailForecastScreenViewController.presenter = detailForecastScreenPresenter
        return detailForecastScreenViewController
    }
}
