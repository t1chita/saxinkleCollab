//
//  SolarResourcePageViewModel.swift
//  TeamSaxinkleApp
//
//  Created by nuca on 17.05.24.
//

import Foundation
import NetworkingService

protocol SolarResourcePageViewModelDelegate {
    func dataFetched()
    func dataDidNotFetch()
}

class SolarResourcePageViewModel {
    //MARK: - Properties
    private var delegate: SolarResourcePageViewModelDelegate?
    private var model: SolarResourcePageModel?
    private let urlString = "https://developer.nrel.gov/api/solar/solar_resource/v1.json?api_key=lbTrz5kfAud7PYhGhUOVsWaEMAMmm0o5s34sq581&address="
    
    //MARK: - lifeCycle
    func didLoad(delegate: SolarResourcePageViewModelDelegate) {
        self.delegate = delegate
    }
    
    //MARK: - Methods
    func fetchData(with address: String) {
        if address.isEmpty {
            delegate?.dataDidNotFetch()
        } else {
            NetworkService.networkService.getData(urlString: urlString + address) { (result: Result<SolarResourcePageModel, Error>) in
                switch result {
                case .success(let success):
                    self.model = success
                    self.delegate?.dataFetched()
                case .failure(let failure):
                    //ერორის პრინტვა
                    print(failure.localizedDescription)
                }
            }
        }
    }
    
}
