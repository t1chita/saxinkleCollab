////
////  WeatherPageVC.swift
////  TeamSaxinkleApp
////
////  Created by Temur Chitashvili on 17.05.24.
////
//
import UIKit
import NetworkingService

final class WeatherPageVC: UIViewController {
    
    // MARK: - Properties
    let weatherPageView: WeatherPageView
    let weatherPageViewModel: WeatherPageViewModel
    var forecastModel: WeatherPageModel?
    var groupedWeatherData: [String: [ListArray]] = [:]
    var service = NetworkService.networkService
    var dataIsLoaded = false
    
    init() {
        self.weatherPageView = WeatherPageView()
        self.weatherPageViewModel = WeatherPageViewModel()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        weatherPageViewModel.delegate = self
        setupUI()
    }
    
    // MARK: - SetupUI
    func setupUI() {
        view = weatherPageView
        weatherPageView.weatherDetailsTableView.dataSource = self
        weatherPageView.weatherDetailsTableView.delegate = self
        weatherPageView.searchWeatherButton.addAction(UIAction(title: "", handler: { [weak self] _ in
            self?.getWeather()
        }), for: .touchUpInside)
        
    }
    
    // MARK: - Get Weather
    func getWeather() {
        guard let lat = weatherPageView.latitudeTextField.text, let lon = weatherPageView.longitudeTextField.text, !lat.isEmpty, !lon.isEmpty else {
            print("Please enter latitude and longitude")
            return
        }
        weatherPageViewModel.getWeatherData(latitude: Double(lat) ?? 41.33, longitude: Double(lon) ?? 44.34)
        dataIsLoaded = true
    }
    
}

// MARK: - Extensions
extension WeatherPageVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 65
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataIsLoaded ? min(weatherPageViewModel.getSortedDays().count, 5) : 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sortedDays = weatherPageViewModel.getSortedDays()
        let day = sortedDays[section]
        return groupedWeatherData[day]?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.cellIdentifier, for: indexPath) as! CustomTableViewCell
        let sortedDays = weatherPageViewModel.getSortedDays()
        let sectionDate = sortedDays[indexPath.section]
        let weatherData = groupedWeatherData[sectionDate]?[indexPath.row]
        
        if let weatherData = weatherData {
            cell.currentTime.text = weatherData.formattedDate.timeOfDay
            cell.temperatureLabel.text = "\(weatherData.main.temp)°C"
            cell.weatherDescriptionLabel.text = weatherData.weather[0].description
        }
        return cell
    }
}

extension WeatherPageVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let sortedDays = weatherPageViewModel.getSortedDays()
        if section < sortedDays.count {
            return sortedDays[section]
        }
        return nil
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension WeatherPageVC: WeatherPageViewModelDelegate {
    func weatherDataDidUpdate(groupedWeatherData: [String : [ListArray]], forecastModel: WeatherPageModel) {
        self.groupedWeatherData = groupedWeatherData
        self.forecastModel = forecastModel
        DispatchQueue.main.async {
            self.weatherPageView.weatherDetailsTableView.reloadData()
            self.weatherPageView.forecastLocationLabel.text = "\(forecastModel.city.country) - \(forecastModel.city.name)"
        }
    }
    
    func weatherDataFetchFailed(with error: any Error) {
        print("Error fetching weather data: \(error)")
    }
    
}
