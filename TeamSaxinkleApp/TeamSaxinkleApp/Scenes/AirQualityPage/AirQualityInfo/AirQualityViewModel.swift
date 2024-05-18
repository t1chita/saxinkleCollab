//
//  AirQualityModelView.swift
//  TeamSaxinkleApp
//
//  Created by Default on 18.05.24.
//

import Foundation

class AirQualityViewModel {

    var airQualityData: (([String: Any]) -> Void)?
    var apiError: ((Error) -> Void)?

    //MARK: - fetchGeolocation
    func fetchGeolocation(for city: String) {
        let apiKey = "9132cd04aa5d007253e69c6f2b47668c"
        let urlString = "https://api.openweathermap.org/geo/1.0/direct?q=\(city)&limit=1&appid=\(apiKey)"
        guard let url = URL(string: urlString) else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                if let error = error {
                    self.apiError?(error)
                }
                return
            }
            
            do {
                if let result = try JSONSerialization.jsonObject(with: data, options: []) as? [[String: Any]],
                   let firstResult = result.first,
                   let lat = firstResult["lat"] as? Double,
                   let lon = firstResult["lon"] as? Double {
                    self.fetchAirQualityData(lat: lat, lon: lon)
                }
            } catch {
                self.apiError?(error)
            }
        }
        task.resume()
    }
    
    //MARK: - fetchAirQualityData
    private func fetchAirQualityData(lat: Double, lon: Double) {
        let apiKey = "b7cf8c77-d896-4d21-a4a4-0b87a677ae4c"
        let urlString = "https://api.airvisual.com/v2/nearest_city?lat=\(lat)&lon=\(lon)&key=\(apiKey)"
        guard let url = URL(string: urlString) else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                if let error = error {
                    self.apiError?(error)
                }
                return
            }
            
            do {
                if let result = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
                   let data = result["data"] as? [String: Any] {
                    DispatchQueue.main.async {
                        self.airQualityData?(data)
                    }
                }
            } catch {
                self.apiError?(error)
            }
        }
        task.resume()
    }
}
