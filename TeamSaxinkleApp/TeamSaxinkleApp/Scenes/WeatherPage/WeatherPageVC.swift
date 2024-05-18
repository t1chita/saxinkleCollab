////
////  WeatherPageVC.swift
////  TeamSaxinkleApp
////
////  Created by Temur Chitashvili on 17.05.24.
////
//
import UIKit
import NetworkingService

class WeatherPageVC: UIViewController {
    
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
        setupUI()
    }
    
    // MARK: - SetupUI
    func setupUI() {
        view = weatherPageView
        weatherPageView.weatherDetailsTableView.dataSource = self
        weatherPageView.weatherDetailsTableView.delegate = self
        weatherPageView.searchWeatherButton.addTarget(self, action: #selector(getWeather), for: .touchUpInside)
    }
    
    @objc func getWeather() {
        guard let lat = weatherPageView.latitudeTextField.text, let lon = weatherPageView.longitudeTextField.text, !lat.isEmpty, !lon.isEmpty else {
            print("Please enter latitude and longitude")
            return
        }
        getWeatherData(latitude: Double(lat) ?? 41.33, longitude: Double(lon) ?? 44.34)
    }
    
    func getWeatherData(latitude: Double, longitude: Double) {
        let urlString = "\(Constants.baseUrlString)?lat=\(latitude)&lon=\(longitude)&appid=\(Constants.apiKey)\(Constants.metricUnit)"
        
        NetworkService.networkService.getData(urlString: urlString) { (result: Result<WeatherPageModel, Error>) in
            switch result {
            case .success(let weatherModel):
                self.groupedWeatherData = Dictionary(grouping: weatherModel.list, by: { $0.formattedDate.dayOfWeek })
                self.forecastModel = weatherModel
                self.dataIsLoaded = true
                
                DispatchQueue.main.async {
                    self.weatherPageView.weatherDetailsTableView.reloadData()
                    if let city = self.forecastModel?.city {
                        self.weatherPageView.forecastLocationLabel.text = "\(city.country) - \(city.name)"
                    }
                }
                
            case .failure(let error):
                print("Error fetching weather data: \(error)")
            }
        }
    }
    
    func getSortedDaysOfWeek() -> [String] {
        let dateFormatter = DateFormatter()
        let currentDay = Calendar.current.component(.weekday, from: Date())
        var weekdaySymbols = dateFormatter.weekdaySymbols
        let prefixIndex = currentDay - 1
        weekdaySymbols = Array(weekdaySymbols!.suffix(from: prefixIndex)) + Array(weekdaySymbols!.prefix(upTo: prefixIndex))
        return weekdaySymbols!
    }
    
}

extension WeatherPageVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 25
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataIsLoaded ? min(getSortedDaysOfWeek().count, 5) : 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sortedDays = getSortedDaysOfWeek()
        let day = sortedDays[section]
        return groupedWeatherData[day]?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.cellIdentifier, for: indexPath) as! CustomTableViewCell
        let sortedDays = getSortedDaysOfWeek()
        let sectionDate = sortedDays[indexPath.section]
        let weatherData = groupedWeatherData[sectionDate]?[indexPath.row]
        
        if let weatherData = weatherData {
            cell.currentTime.text = weatherData.formattedDate.timeOfDay
            cell.temperatureLabel.text = "\(weatherData.main.temp)°C"
        }
        return cell
    }
}

extension WeatherPageVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let sortedDays = getSortedDaysOfWeek()
        if section < sortedDays.count {
            return sortedDays[section]
        }
        return nil
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
