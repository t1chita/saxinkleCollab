//
//  WeatherPageViewModel.swift
//  TeamSaxinkleApp
//
//  Created by gvantsa gvagvalia on 5/18/24.
//

import Foundation
import NetworkingService


protocol WeatherPageViewModelDelegate: AnyObject {
    func weatherDataDidUpdate(groupedWeatherData: [String: [ListArray]], forecastModel: WeatherPageModel)
    func weatherDataFetchFailed(with error: Error)
}

final class WeatherPageViewModel {
// MARK: - Properties
    var service = NetworkService.networkService
    var groupedWeatherData: [String: [ListArray]] = [:]
    var forecastModel: WeatherPageModel?
    var dataIsLoaded = false
    weak var delegate: WeatherPageViewModelDelegate?
    
    // MARK: - LifeCycle
    func getSortedDays() -> [String] {
        getSortedDaysOfWeek()
    }
    
    // MARK: - fetchData
    func getWeatherData(latitude: Double, longitude: Double) {
        let urlString = "\(Constants.baseUrlString)?lat=\(latitude)&lon=\(longitude)&appid=\(Constants.apiKey)\(Constants.metricUnit)"
        
        NetworkService.networkService.getData(urlString: urlString) { (result: Result<WeatherPageModel, Error>) in
            switch result {
            case .success(let weatherModel):
                let groupedWeatherData = Dictionary(grouping: weatherModel.list, by: { $0.formattedDate.dayOfWeek })
                self.delegate?.weatherDataDidUpdate(groupedWeatherData: groupedWeatherData, forecastModel: weatherModel)
                
            case .failure(let error):
                self.delegate?.weatherDataFetchFailed(with: error)
            }
        }
    }
    // MARK: - SortDays
    private func getSortedDaysOfWeek() -> [String] {
        let dateFormatter = DateFormatter()
        let currentDay = Calendar.current.component(.weekday, from: Date())
        var weekdaySymbols = dateFormatter.weekdaySymbols
        let prefixIndex = currentDay - 1
        weekdaySymbols = Array(weekdaySymbols!.suffix(from: prefixIndex)) + Array(weekdaySymbols!.prefix(upTo: prefixIndex))
        return weekdaySymbols!
    }
}

