//
//  SolarResourcePageModel.swift
//  TeamSaxinkleApp
//
//  Created by nuca on 17.05.24.
//

import Foundation

struct SolarResourcePageModel: Decodable, modelProtocol{
    var warnings: [String]
    var errors: [String]
    var outputs: SolarData
    
}
struct SolarData: Decodable {
    var avg_dni: TimePeriod
    var avg_ghi: TimePeriod
    var avg_lat_tilt: TimePeriod
}

struct TimePeriod: Decodable {
    var annual: Double
    var monthly: MonthlyData
}

struct MonthlyData: Decodable {
    var jan: Double
    var feb: Double
    var mar: Double
    var apr: Double
    var may: Double
    var jun: Double
    var aug: Double
    var sep: Double
    var oct: Double
    var nov: Double
    var dec: Double
}
