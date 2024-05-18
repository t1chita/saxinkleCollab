//
//  SolarResourcePageViewModel.swift
//  TeamSaxinkleApp
//
//  Created by nuca on 17.05.24.
//

import Foundation
import NetworkingService

protocol SolarResourcePageViewModelDelegate {
    func dataFetched(data: SolarData)
    func dataDidNotFetch()
}

protocol modelProtocol {
    var outputs: SolarData {get}
}

final class SolarResourcePageViewModel {
    //MARK: - Properties
    private var delegate: SolarResourcePageViewModelDelegate?
    private var model: modelProtocol?
    private let urlString = "https://developer.nrel.gov/api/solar/solar_resource/v1.json?api_key=lbTrz5kfAud7PYhGhUOVsWaEMAMmm0o5s34sq581&address="
}

extension SolarResourcePageViewModel: SolarResourcePageVCViewModelDelegate {
    //MARK: - lifeCycle
    func didLoad(delegate: SolarResourcePageViewModelDelegate) {
        self.delegate = delegate
    }
    
    //MARK: - Methods
    func fetchData(with address: String) {
        var didNotFetch = true
        NetworkService.networkService.getData(urlString: urlString + address) { (result: Result<SolarResourcePageModel, Error>) in
            switch result {
            case .success(let success):
                self.model = success
                didNotFetch = false
                self.delegate?.dataFetched(data: self.model!.outputs)
            case .failure(let failure):
                //ერორის პრინტვა
                print(failure.localizedDescription)
                didNotFetch = true
            }
        }
        if didNotFetch {
            delegate?.dataDidNotFetch()
        }
    }
    
}
