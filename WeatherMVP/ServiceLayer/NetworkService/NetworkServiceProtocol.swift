//
//  NetworkServiceProtocol.swift
//  WeatherMVP
//
//  Created by Илья Бочков  on 6/14/20.
//  Copyright © 2020 Илья Бочков . All rights reserved.
//

import CoreLocation
import UIKit

protocol NetworkServiceProtocol {
    func updateForecast(with coordinates: CLLocationCoordinate2D, completion: @escaping (Result<ApiResponse, Error>) -> ())
    func getIcon(with iconName: String, completion: @escaping (Result<UIImage, Error>) -> ())
}
