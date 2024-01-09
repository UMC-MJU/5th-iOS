//
//  ViewController.swift
//  APITest
//
//  Created by 김도경 on 11/6/23.
//

import UIKit
import Alamofire


class ViewController: UIViewController {
    
    let url = "https://api.openweathermap.org/data/2.5/weather?lat=44.34&lon=10.99&appid=\(APIKey.key.rawValue)"
    
    var weather : WeatherModel?
    
    let stackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.distribution = .fillEqually
        stack.axis = .vertical
        return stack
    }()
    
    let currentWeather = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 15, weight: .bold)
        return label
    }()
    
    let temp = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 15, weight: .bold)
        return label
    }()
    
    let humidity = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 15, weight: .bold)
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(stackView)
        
        stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true        
        stackView.addArrangedSubview(currentWeather)
        stackView.addArrangedSubview(temp)
        stackView.addArrangedSubview(humidity)

        AF.request(url)
            .responseDecodable(of:WeatherModel.self) { response in
                        switch response.result {
                        case .success(let result):
                            self.currentWeather.text = "Current weather is  \(result.weather[0].main)"
                            self.temp.text = "The temperature is \(result.main.temp) F"
                            self.humidity.text = "The humidity is 73"
                            print(result)
                        case .failure(let error):
                            print(error.localizedDescription, error)
                        }
                }

    }
    
    
    


}




