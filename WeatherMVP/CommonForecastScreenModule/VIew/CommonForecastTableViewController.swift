//
//  CommonForecastTableViewController.swift
//  WeatherMVP
//
//  Created by Илья Бочков  on 6/14/20.
//  Copyright © 2020 Илья Бочков . All rights reserved.
//

import UIKit
import CoreLocation

class CommonForecastScreenTableViewController: UITableViewController {
    
    private let cellNibName = "CommonForecastTableViewCell"
    private let cellIdentifier = "Cell"
    
    var presenter: CommonForecastScreenPresenterProtocol?
    private var locationManager: CLLocationManager!
    private var customNavigationItemView: CustomNavigationItemView!

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(UINib(nibName: cellNibName, bundle: nil), forCellReuseIdentifier: cellIdentifier)
        tableView.rowHeight = 60
        
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        locationManager.requestLocation()
        
        self.clearsSelectionOnViewWillAppear = true
        
        customNavigationItemView = CustomNavigationItemView()
        customNavigationItemView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 0)
        let navigationItemTupGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(navigationItemTupped))
        navigationItemTupGestureRecognizer.delegate = self
        customNavigationItemView.addGestureRecognizer(navigationItemTupGestureRecognizer)
        navigationItem.titleView = customNavigationItemView

    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.detailForecastList?.count ?? 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! CommonForecastTableViewCell
        cell.configure(with: presenter?.detailForecastList?[indexPath.row])
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.show(detailForecast: presenter?.detailForecastList?[indexPath.row])
    }

    private func configureAlert(with error: Error) {
        let errorAlert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
        let okErrorAlertAction = UIAlertAction(title: "OK", style: .default)
        errorAlert.addAction(okErrorAlertAction)
        present(errorAlert, animated: true)
    }
    
    private func configureCityNameAlert() {
        let cityNameAlert = UIAlertController(title: nil, message: "Enter city name", preferredStyle: .alert)
        let cityNameAlertCancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let cityNameAlertReloadAction = UIAlertAction(title: "Reload", style: .default) {
            [weak self] (_) in
            guard let self = self else {
                return
            }
            guard let cityName = cityNameAlert.textFields?.first?.text, cityName != "" else {
                return
            }
            self.customNavigationItemView.startUpdating()
            self.presenter?.updateForecast(with: cityName)
        }
        cityNameAlert.addTextField(configurationHandler: nil)
        cityNameAlert.addAction(cityNameAlertCancelAction)
        cityNameAlert.addAction(cityNameAlertReloadAction)
        present(cityNameAlert, animated: true)
    }
    
    @objc func navigationItemTupped() {
        configureCityNameAlert()
    }
    
}

extension CommonForecastScreenTableViewController: CommonForecastScreenViewProtocol {
    
    func set(city: City) {
        customNavigationItemView.updateData(with: city)
    }
    
    func successUpdate() {
        tableView.reloadData()
    }
    
    func failureUpdate(with error: Error) {
        configureAlert(with: error)
    }
}

extension CommonForecastScreenTableViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        customNavigationItemView.startUpdating()
        presenter?.updateForecast(with: locationManager.location?.coordinate)
    }
     
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        configureAlert(with: error)
    }
}

extension CommonForecastScreenTableViewController: UIGestureRecognizerDelegate {
    
}
