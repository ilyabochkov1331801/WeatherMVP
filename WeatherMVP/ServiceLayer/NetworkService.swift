//
//  NetworkService.swift
//  WeatherMVP
//
//  Created by Илья Бочков  on 6/14/20.
//  Copyright © 2020 Илья Бочков . All rights reserved.
//

import CoreLocation

class NetworkService: NetworkServiceProtocol {
    
    private let stringURL = "https://api.openweathermap.org/data/2.5/forecast?"
    private let apiKey = "2a6938098eb62bba02708327e9d0194e"
    
    func updateForecast(with coordinates: CLLocationCoordinate2D, completion: @escaping (Result<ApiResponse, Error>) -> ()) {
        guard var urlComponents = URLComponents(string: stringURL) else {
            return
        }
        urlComponents.queryItems = [
            URLQueryItem(name: "lat", value: String(coordinates.latitude)),
            URLQueryItem(name: "lon", value: String(coordinates.longitude)),
            URLQueryItem(name: "appid", value: apiKey)
        ]
        guard let url = urlComponents.url else {
            return
        }
        
        URLSession.shared.dataTask(with: url) {
            (data, _, error) in
            if let error = error {
                completion(.failure(error))
            }
            guard let data = data else {
                return
            }
            do {
                let response = try JSONDecoder().decode(ApiResponse.self, from: data)
                completion(.success(response))
            } catch {
                completion(.failure(error))
            }
        }
    }
}
