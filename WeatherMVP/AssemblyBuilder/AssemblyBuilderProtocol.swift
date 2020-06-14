//
//  AssemblyBuilder.swift
//  WeatherMVP
//
//  Created by Илья Бочков  on 6/14/20.
//  Copyright © 2020 Илья Бочков . All rights reserved.
//

import UIKit

protocol AssemblyBuilderProtocol {
    func createCommonForecastScreenModule(router: RouterProtocol) -> UIViewController
    func createDetailForecastScreenModule(detailForecast: DetailForecast, router: RouterProtocol) -> UIViewController
}
