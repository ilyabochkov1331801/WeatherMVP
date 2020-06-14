//
//  DetailForecastScreenViewController.swift
//  WeatherMVP
//
//  Created by Илья Бочков  on 6/14/20.
//  Copyright © 2020 Илья Бочков . All rights reserved.
//

import UIKit

class DetailForecastScreenViewController: UIViewController {
    
    private let stringFormat = "%.1f"
    
    var presenter: DetailForecastScreenPresenterProtocol?
    
    @IBOutlet weak var windLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var iconImageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

        presenter?.updateForecast()
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension DetailForecastScreenViewController: DetailForecastScreenViewProtocol {
    func set(detailForecast: DetailForecast) {
        windLabel.text = String(format: stringFormat, detailForecast.wind.speed)
        temperatureLabel.text = (TemperatureConverterService().convertTemperature(kelvin: detailForecast.main.temp) ?? "") + " / " + (TemperatureConverterService().convertTemperature(kelvin: detailForecast.main.feels_like) ?? "")
        guard let iconId = detailForecast.weather.first?.icon else {
            return
        }
        presenter?.updateIcon(with: iconId)
    }
    
    func set(picture: UIImage) {
        iconImageView.image = picture
    }
}
