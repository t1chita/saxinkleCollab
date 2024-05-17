//
//  SpeciePageViewModel.swift
//  TeamSaxinkleApp
//
//  Created by Temur Chitashvili on 17.05.24.
//

import Foundation
import NetworkingService

protocol ViewModelLoadDelegate: AnyObject {
    func didLoad(with: String)
}


class SpeciePageViewModel: ViewModelLoadDelegate {
    //MARK: Properties
    var cityID: Int = 0
    var cityName: String = ""
    var natureArray: [NatureResults] = []
    
    //MARK: Delegates
    weak var reloadTableViewDelegate:  ReloadTableViewDelegate?
    
    //MARK: Methods
    func didLoad(with city: String) {
        fetchData(cityName: city){ [weak self] success in
            if success {
                self?.fetchSecondData()
            } else {
                print("Failed to fetch city ID")
            }
        }
    }
    
    //MARK: Child Methods
    private func fetchData(cityName: String, completion: @escaping (Bool) -> Void) {
        let apiForCityID = "https://api.inaturalist.org/v1/places/autocomplete?q=\(cityName)"
        NetworkService.networkService.getData(urlString: apiForCityID) { [weak self] (result: Result<City,Error>) in
            switch result {
            case .success(let success):
                self?.cityID = success.results[0].id ?? 0
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
            self?.reloadTableViewDelegate?.reloadData()
        }
    }
}

