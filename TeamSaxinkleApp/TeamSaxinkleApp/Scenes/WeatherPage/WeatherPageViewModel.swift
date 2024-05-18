//
//  WeatherPageViewModel.swift
//  TeamSaxinkleApp
//
//  Created by gvantsa gvagvalia on 5/18/24.
//

import Foundation
import NetworkingService


//protocol weatherPageProtocol {
//    func fetchWeatherData(latitude: Double, longitude: Double)
//}
final class WeatherPageViewModel {
    
    public var weatherModel: WeatherPageModel? {
        didSet { weatherUpdated?() }
    }
//    public var weatherModel: WeatherPageModel?
    var weatherUpdated: (() -> Void)?
    var service = NetworkService.networkService

    // MARK: - LifeCycle

    func viewDidLoad() {
//        fetchWeatherData(latitude: latitude, longitude: longitude)
    }
    
    // MARK: - fetchData
//     func fetchWeatherData(latitude: Double, longitude: Double) {
//        let urlString = "\(baseUrlString)?lat=\(latitude)&lon=\(longitude)&appid=\(apiKey)&units=metric"
//                service.getData(urlString: urlString) { (result: Result<WeatherPageModel, Error>) in
//                    switch result {
//                    case .success(let weatherModel):
//                        self.weatherModel = weatherModel
//                    case .failure(let error):
//                        print("Error fetching weather data: \(error)")
//                    }
//        }
//    }
//    
    // MARK: - numberOfRawsInSection
  
//    // MARK: - cellForRawAt

}
