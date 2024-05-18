//
//  AirQualityDetailViewModel.swift
//  TeamSaxinkleApp
//
//  Created by Default on 18.05.24.
//

import Foundation

class AirQualityDetailViewModel {
    
    var location: String = "Location"
    var temperature: String = "Temperature"
    var airQuality: String = "Air Quality"
    var airQualityIndex: String = "AQI"
    var airQualityProgress: Float = 0.0
    var farenhait: String = "N/A"
    var wind: String = "N/A"
    var humidity: String = "N/A"
    var pressure: String = "N/A"
    
    //MARK: - updateData
    func updateData(with data: [String: Any]) {
        if let city = data["city"] as? String,
           let current = data["current"] as? [String: Any],
           let weather = current["weather"] as? [String: Any],
           let pollution = current["pollution"] as? [String: Any]{
            
            self.location = city
            if let temperature = weather["tp"] as? Int {
                self.temperature = "\(temperature) °C"
                self.farenhait = "\(Int((Double(temperature) * 1.8) + 32)) F"
            }
            if let prs = weather["pr"] as? Int {
                self.pressure = "\(prs) hPa"
            }
            
            if let wd = weather["wd"] as? Int {
                self.wind = "\(wd) mph"
            }
            
            if let hu = weather["hu"] as? Int {
                self.humidity = "\(hu)%"
            }
            
            if let aqiUS = pollution["aqius"] as? Int {
                self.airQuality = getAirQualityDescription(for: aqiUS)
                self.airQualityIndex = "AQI: \(aqiUS)"
                self.airQualityProgress = Float(aqiUS) / 500.0
            }
        }
    }
    
    //MARK: - getAirQualityDescription
    private func getAirQualityDescription(for aqi: Int) -> String {
        switch aqi {
        case 0...50:
            return "Good"
        case 51...100:
            return "Moderate"
        case 101...150:
            return "Unhealthy for Sensitive Groups"
        case 151...200:
            return "Unhealthy"
        case 201...300:
            return "Very Unhealthy"
        case 301...500:
            return "Hazardous"
        default:
            return "Unknown"
        }
    }
}
