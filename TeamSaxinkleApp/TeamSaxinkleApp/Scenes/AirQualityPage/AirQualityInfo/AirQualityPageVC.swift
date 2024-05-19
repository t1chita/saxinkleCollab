//
//  AirQualityPageVC.swift
//  TeamSaxinkleApp
//
//  Created by Temur Chitashvili on 17.05.24.
//

import UIKit

final class AirQualityPageVC: UIViewController, UISearchBarDelegate {
    
    private var airQualityView: AirQualityView
    private var viewModel: AirQualityViewModel
    
    
    init(airQualityView: AirQualityView, viewModel: AirQualityViewModel) {
        self.airQualityView = airQualityView
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = airQualityView
        
        airQualityView.searchBar.delegate = self
        
        viewModel.airQualityData = { [weak self] data in
            self?.navigateToWeatherViewController(with: data)
        }
        
        viewModel.apiError = { error in
            print(error)
        }
    }
    
    //MARK: - searchBarSearchButtonClicked
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let query = searchBar.text, !query.isEmpty else {
            return
        }
        viewModel.fetchGeolocation(for: query)
        searchBar.resignFirstResponder()
    }
    
    //MARK: navigateToWeatherViewController
    private func navigateToWeatherViewController(with data: [String: Any]) {
        let weatherViewController = AirQualityDetailPageVC(weatherView: AirQualityDetailView(), viewModel: AirQualityDetailViewModel())
        weatherViewController.airQualityData = data
        self.navigationController?.pushViewController(weatherViewController, animated: true)
    }
}
