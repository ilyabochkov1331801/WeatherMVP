//
//  CommonForecastTableViewCell.swift
//  WeatherMVP
//
//  Created by Илья Бочков  on 6/14/20.
//  Copyright © 2020 Илья Бочков . All rights reserved.
//

import UIKit

class CommonForecastTableViewCell: UITableViewCell {

    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configure(with detailForecast: DetailForecast?) {
        timeLabel.text = detailForecast?.dt_txt
        temperatureLabel.text = TemperatureConverterService().convertTemperature(kelvin: detailForecast?.main.temp)
        descriptionLabel?.text = detailForecast?.weather.first?.description
    }
}
