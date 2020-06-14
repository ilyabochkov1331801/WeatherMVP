//
//  DetailForecastScreenViewController.swift
//  WeatherMVP
//
//  Created by Илья Бочков  on 6/14/20.
//  Copyright © 2020 Илья Бочков . All rights reserved.
//

import UIKit

class DetailForecastScreenViewController: UIViewController {
    
    var presenter: DetailForecastScreenPresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
        
    }
    
    func set(picture: UIImage) {
        
    }
}
