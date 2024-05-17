//
//  SpeciePageViewModel.swift
//  TeamSaxinkleApp
//
//  Created by Temur Chitashvili on 17.05.24.
//

import Foundation
import NetworkingService

class SpeciePageViewModel {
    var cityID: Int = 0
    var cityName: String = "Tbilisi"
    var natureArray: [NatureResults] = []
    
    
    
    func didLoad() {
        fetchData { [weak self] success in
            if success {
                self?.fetchSecondData()
            } else {
                print("Failed to fetch city ID")
            }
        }
    }
    
    private func fetchData(completion: @escaping (Bool) -> Void) {
        let apiForCityID = "https://api.inaturalist.org/v1/places/autocomplete?q=\(cityName)"
        NetworkService.networkService.getData(urlString: apiForCityID) { [weak self] (result: Result<City,Error>) in
            switch result {
            case .success(let success):
                self?.cityID = success.results[0].id
                completion(true)
            case .failure(let failure):
                print(failure.localizedDescription)
                completion(false)
            }
        }
    }
    
    private func fetchSecondData() {
        let apiForNatureData = "https://api.inaturalist.org/v1/observations/species_counts?place_id=\(cityID)"
        NetworkService.networkService.getData(urlString: apiForNatureData) { [weak self] (result: Result<NatureInfo,Error>) in
            switch result {
            case .success(let success):
                self?.natureArray = success.results
            case .failure(let failure):
                print(failure.localizedDescription)
            }
        }
    }
}




extension SpeciePageViewModel {
    func updateSearchResults(for searchText: String?) {
        
    }
}
