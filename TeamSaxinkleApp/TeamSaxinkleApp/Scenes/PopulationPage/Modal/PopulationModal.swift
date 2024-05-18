//
//  PopulationModal.swift
//  TeamSaxinkleApp
//
//  Created by MacBook Air on 18.05.24.
//

import Foundation

struct TotalPopulation: Codable {
    let date: String
    let population: Int
}

struct TotalPopulations: Codable {
    let totalPopulation: [TotalPopulation]

    enum CodingKeys: String, CodingKey {
        case totalPopulation = "total_population"
    }
}
