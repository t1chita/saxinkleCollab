//
//  WeatherPageModel.swift
//  TeamSaxinkleApp
//
//  Created by gvantsa gvagvalia on 5/17/24.
//

import Foundation

struct WeatherPageModel: Decodable {
    let list: [ListArray]
    let city: City
    
    struct City: Decodable {
        let name: String
        let country: String
    }
}

struct ListArray: Decodable {
    let main: WeatherMain
    let dt_txt: String
    
    var formattedDate: (dayOfWeek: String, timeOfDay: String) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        guard let date = dateFormatter.date(from: dt_txt) else {
            return ("", "")
        }
        dateFormatter.dateFormat = "EEEE"
        let dayOfWeek = dateFormatter.string(from: date)
        dateFormatter.dateFormat = "HH:mm"
        let timeOfDay = dateFormatter.string(from: date)
        return (dayOfWeek, timeOfDay)
    }
}

struct WeatherMain: Decodable {
    let temp: Double
}

