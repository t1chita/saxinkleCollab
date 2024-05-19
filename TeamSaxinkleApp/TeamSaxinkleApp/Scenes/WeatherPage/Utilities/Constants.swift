//
//  Constants.swift
//  TeamSaxinkleApp
//
//  Created by gvantsa gvagvalia on 5/17/24.
//

import Foundation
import NetworkingService

struct Constants {
    static let baseUrlString = "https://api.openweathermap.org/data/2.5/forecast"
    static let apiKey = "f85f73a76a70699a5b4b531a115e1e99"
    static let metricUnit = "&units=metric"
    static let networkingService = NetworkService.networkService
}
