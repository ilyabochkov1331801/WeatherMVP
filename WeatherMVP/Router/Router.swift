//
//  Router.swift
//  WeatherMVP
//
//  Created by Илья Бочков  on 6/14/20.
//  Copyright © 2020 Илья Бочков . All rights reserved.
//

import UIKit

class Router: RouterProtocol {
    
    var navigationController: UINavigationController?
    var assemblyBuilder: AssemblyBuilderProtocol?
    
    init(navigationController: UINavigationController, assemblyBuilder: AssemblyBuilderProtocol) {
        self.navigationController = navigationController
        self.assemblyBuilder = assemblyBuilder
    }
    
    func initialScreen() {
        guard let navigationController = navigationController,
            let commonForecastScreenModule = assemblyBuilder?.createCommonForecastScreenModule(router: self) else {
                return
        }
        navigationController.viewControllers = [ commonForecastScreenModule ]
    }
    
    func showDetailForecastScreen(detailForecast: DetailForecast) {
        guard let navigationController = navigationController,
            let detailForecastScreenModule = assemblyBuilder?.createDetailForecastScreenModule(detailForecast: detailForecast, router: self) else {
                return
        }
        navigationController.pushViewController(detailForecastScreenModule, animated: true)
    }
    
    func popToRoot() {
        guard let navigationController = navigationController else {
            return
        }
        navigationController.popToRootViewController(animated: true)
    }
}
