//
//  CustomNavigationItemView.swift
//  MyWeather
//
//  Created by Илья Бочков  on 5/4/20.
//  Copyright © 2020 Илья Бочков . All rights reserved.
//

import UIKit

class CustomNavigationItemView: UIView {
    
    private let nibName = "CustomNavigationItemView"
    
    @IBOutlet weak var sunriseTimeLabel: UILabel!
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var sunsetTimeLabel: UILabel!
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var spinnerView: UIActivityIndicatorView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    func commonInit() {
        let bundle = Bundle(for: CustomNavigationItemView.self)
        bundle.loadNibNamed(nibName, owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [ .flexibleHeight, .flexibleWidth ]
        spinnerView.hidesWhenStopped = true
        cityNameLabel.adjustsFontSizeToFitWidth = true
    }
        
    func startUpdating() {
        sunsetTimeLabel.text = nil
        sunriseTimeLabel.text = nil
        cityNameLabel.text = nil
        spinnerView.startAnimating()
    }
    
    func updateData(with city: City) {
        sunsetTimeLabel.text = convertTime(from: city.sunset)
        sunriseTimeLabel.text = convertTime(from: city.sunrise)
        cityNameLabel.text = city.name
        spinnerView.stopAnimating()
    }
    
    func convertTime(from: Int) -> String {
        let date = Date(timeIntervalSince1970: TimeInterval(from))
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .none
        dateFormatter.timeStyle = .short
        return dateFormatter.string(from: date)
    }
}

