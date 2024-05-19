//
//  PopulationPageViewModel.swift
//  TeamSaxinkleApp
//
//  Created by MacBook Air on 17.05.24.
//

import Foundation
import NetworkingService

final class PopulationPageViewModel {
    
    // MARK: - Properties
    
    private var networkService = NetworkService.networkService
    var populationData: ((String, String) -> Void)?
    var onError: ((String) -> Void)?
    var populationArray: [TotalPopulation] = []
    
    // MARK: - Fetch Population Func
    
    func fetchPopulation(for country: String) {
        let formattedCountry = country.capitalized
        let urlString = "https://d6wn6bmjj722w.population.io:443/1.0/population/\(formattedCountry)/today-and-tomorrow/"
        
        networkService.getData(urlString: urlString) { [weak self] (result: Result<TotalPopulations, Error>) in
            switch result {
            case .success(let data):
                self?.populationArray = data.totalPopulation
                self?.updatePopulationData()
            case .failure(let error):
                print("Failed to fetch data: \(error)")
                self?.onError?("Wrong wrong")
            }
        }
    }

    
    // MARK: - Update Information
    
    private func updatePopulationData() {
        guard populationArray.count >= 2 else {
            populationData?("No data", "No data")
            return
        }
        
        let todayPopulation = populationArray[0]
        let tomorrowPopulation = populationArray[1]
        
        populationData?("Population: \(todayPopulation.population)", "Population: \(tomorrowPopulation.population)")
    }
}
