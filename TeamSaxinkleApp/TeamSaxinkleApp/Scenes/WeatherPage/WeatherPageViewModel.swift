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
    weak var delegate: WeatherPageViewModelDelegate?
    private var service = NetworkService.networkService
    private var groupedWeatherData: [String: [ListArray]] = [:]
    private var dataIsLoaded = false
    var forecastModel: WeatherPageModel?
    
    var countryName: String {
        forecastModel?.city.country ?? ""
    }
    
    var cityName: String {
        forecastModel?.city.name ?? ""
    }
    
    // MARK: - LifeCycle
    func getWeatherData(latitude: Double, longitude: Double) {
        getWeather(latitude: latitude, longitude: longitude)
    }
    
    func getSortedDays() -> [String] {
        getSortedDaysOfWeek()
    }
    
    func getRowsCount(section: Int) -> Int {
        numberOfRows(inSection: section)
    }
    
    func getCellConfigure(cell: CustomTableViewCell, index: IndexPath) {
        configureCell(cell, at: index)
    }
    
    func getHeaderTitle(section: Int) -> String? {
        return titleForHeader(section: section)
    }
    // MARK: - fetchData
    private func getWeather(latitude: Double, longitude: Double) {
        let urlString = "\(Constants.baseUrlString)?lat=\(latitude)&lon=\(longitude)&appid=\(Constants.apiKey)\(Constants.metricUnit)"
        
        NetworkService.networkService.getData(urlString: urlString) { (result: Result<WeatherPageModel, Error>) in
            switch result {
            case .success(let weatherModel):
                let groupedWeatherData = Dictionary(grouping: weatherModel.list, by: { $0.formattedDate.dayOfWeek })
                self.groupedWeatherData = groupedWeatherData
                self.forecastModel = weatherModel
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
    
    // MARK: - count of rows
    private func numberOfRows(inSection section: Int) -> Int {
        let sortedDays = getSortedDays()
        let day = sortedDays[section]
        return groupedWeatherData[day]?.count ?? 0
    }
    
    // MARK: - Cell Configuration
    private func configureCell(_ cell: CustomTableViewCell, at indexPath: IndexPath) {
        let sortedDays = getSortedDays()
        let sectionDate = sortedDays[indexPath.section]
        if let weatherData = groupedWeatherData[sectionDate]?[indexPath.row] {
            cell.currentTime.text = weatherData.formattedDate.timeOfDay
            cell.temperatureLabel.text = "\(weatherData.main.temp)°C"
            cell.weatherDescriptionLabel.text = weatherData.weather[0].description
        }
    }
    
    // MARK: - Header Title
    private func titleForHeader(section: Int) -> String? {
        let sortedDays = getSortedDays()
        return section < sortedDays.count ? sortedDays[section] : nil
    }
}

