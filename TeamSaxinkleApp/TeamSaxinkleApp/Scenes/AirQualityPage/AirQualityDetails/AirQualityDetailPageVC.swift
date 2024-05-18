//
//  AirQualityPageVC.swift
//  TeamSaxinkleApp
//
//  Created by Default on 18.05.24.
//

import UIKit

class AirQualityDetailPageVC: UIViewController {

    private var weatherView: AirQualityDetailView!
    private var viewModel: AirQualityDetailViewModel!
    var airQualityData: [String: Any]?
    
    //MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = AirQualityDetailViewModel()
        weatherView = AirQualityDetailView()
        self.view = weatherView
        
        view.backgroundColor = .white
        if let data = airQualityData {
            viewModel.updateData(with: data)
            updateUI()
        }
    }
    
    //MARK: - updateUI
    private func updateUI() {
        weatherView.locationLabel.text = viewModel.location
        weatherView.temperatureLabel.text = viewModel.temperature
        weatherView.airQualityValueLabel.text = viewModel.airQuality
        weatherView.airQualityIndexLabel.text = viewModel.airQualityIndex
        weatherView.airQualityProgressView.progress = viewModel.airQualityProgress
        weatherView.updateTemperatureDetail(text: viewModel.farenhait)
        weatherView.updateWindDetail(text: viewModel.wind)
        weatherView.updateHumidityDetail(text: viewModel.humidity)
        weatherView.updatePressureDetail(text: viewModel.pressure)
    }
}

