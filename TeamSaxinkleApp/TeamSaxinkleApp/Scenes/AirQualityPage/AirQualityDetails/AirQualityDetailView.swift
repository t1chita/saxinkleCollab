//
//  AirQualityDetailView.swift
//  TeamSaxinkleApp
//
//  Created by Default on 18.05.24.
//

import UIKit

final class AirQualityDetailView: UIView {
    
    //MARK: - locationLabel
    let locationLabel: CustomLabel = {
        let label = CustomLabel()
        label.text = "Los Angeles"
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        return label
    }()
    
    //MARK: - temperatureLabel
     let temperatureLabel: CustomLabel = {
        let label = CustomLabel()
        label.text = "82 F"
        label.font = UIFont.systemFont(ofSize: 48, weight: .bold)
        return label
    }()
    
    //MARK: - airQualityLabel
     let airQualityLabel: CustomLabel = {
        let label = CustomLabel()
        label.text = "Air Quality Index"
        label.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        return label
    }()
    
    //MARK: - airQualityValueLabel
     let airQualityValueLabel: CustomLabel = {
        let label = CustomLabel()
        label.text = "Moderate"
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        return label
    }()
    
    //MARK: - airQualityProgressView
     let airQualityProgressView: UIProgressView = {
        let progressView = UIProgressView(progressViewStyle: .default)
        progressView.progress = 0.6
        progressView.translatesAutoresizingMaskIntoConstraints = false
        return progressView
    }()
    
    //MARK: - airQualityIndexLabel
     let airQualityIndexLabel: CustomLabel = {
        let label = CustomLabel()
        label.text = "AQI: 61"
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    //MARK: - weatherStackView
    private let weatherStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    //MARK: - temperatureDetailLabel
    private let temperatureView = UIView()
    private let temperatureDetailLabel: CustomLabel = {
        let label = CustomLabel()
        label.font = UIFont.systemFont(ofSize: 22, weight: .regular)
        return label
    }()
    
    //MARK: - windDetailLabel
    private let windView = UIView()
    private let windDetailLabel: CustomLabel = {
        let label = CustomLabel()
        label.font = UIFont.systemFont(ofSize: 22, weight: .regular)
        return label
    }()
    
    //MARK: - humidityDetailLabel
    private let humidityView = UIView()
    private let humidityDetailLabel: CustomLabel = {
        let label = CustomLabel()
        label.font = UIFont.systemFont(ofSize: 22, weight: .regular)
        return label
    }()
    
    //MARK: - pressureDetailLabel
    private let pressureView = UIView()
    private let pressureDetailLabel: CustomLabel = {
        let label = CustomLabel()
        label.font = UIFont.systemFont(ofSize: 22, weight: .regular)
        return label
    }()
    
    //MARK: - init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - setupUI
    private func setupUI() {
        backgroundColor = .systemGray5
        
        addSubview(locationLabel)
        addSubview(temperatureLabel)
        addSubview(airQualityLabel)
        addSubview(airQualityValueLabel)
        addSubview(airQualityProgressView)
        addSubview(airQualityIndexLabel)
        addSubview(weatherStackView)
        
        setupWeatherView()
        addInstackView()
        constraintsForUi()
    }
    
    //MARK: - constraintsForUi
    private func constraintsForUi() {
        setConstraintsToLocationLabel()
        setConstraintsToTemperatureLabel()
        setConstraintsToAirQualityLabel()
        setConstraintsToAirQualityValueLabel()
        setConstraintsToAirQualityProgressView()
        setConstraintsToAirQualityIndexLabel()
        setConstraintsToWeatherStackView()
    }
    
    private func setConstraintsToLocationLabel() {
        NSLayoutConstraint.activate([
            locationLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            locationLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
        ])
    } 
    
    private func setConstraintsToTemperatureLabel() {
        NSLayoutConstraint.activate([
            temperatureLabel.topAnchor.constraint(equalTo: locationLabel.bottomAnchor, constant: 10),
            temperatureLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
             ])
    }
    
    private func setConstraintsToAirQualityLabel() {
        NSLayoutConstraint.activate([
            airQualityLabel.topAnchor.constraint(equalTo: temperatureLabel.bottomAnchor, constant: 20),
            airQualityLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
             ])
    }
    
    private func setConstraintsToAirQualityValueLabel() {
        NSLayoutConstraint.activate([
            airQualityValueLabel.topAnchor.constraint(equalTo: airQualityLabel.bottomAnchor, constant: 10),
            airQualityValueLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            ])
    }
    
    private func setConstraintsToAirQualityProgressView() {
        NSLayoutConstraint.activate([
            airQualityProgressView.topAnchor.constraint(equalTo: airQualityValueLabel.bottomAnchor, constant: 8),
            airQualityProgressView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            airQualityProgressView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
             ])
    } 
    
    private func setConstraintsToAirQualityIndexLabel() {
        NSLayoutConstraint.activate([
            airQualityIndexLabel.topAnchor.constraint(equalTo: airQualityProgressView.bottomAnchor, constant: 10),
            airQualityIndexLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            ])
    }
    
    private func setConstraintsToWeatherStackView() {
        NSLayoutConstraint.activate([
            weatherStackView.topAnchor.constraint(equalTo: airQualityIndexLabel.bottomAnchor, constant: 35),
            weatherStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            weatherStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            weatherStackView.bottomAnchor.constraint(lessThanOrEqualTo: safeAreaLayoutGuide.bottomAnchor, constant: -16)
        ])
    }
    
    //MARK: - addInstackView
    private func addInstackView() {
        weatherStackView.addArrangedSubview(temperatureView)
        weatherStackView.addArrangedSubview(createSpacerView(height: 12))
        weatherStackView.addArrangedSubview(windView)
        weatherStackView.addArrangedSubview(createSpacerView(height: 12))
        weatherStackView.addArrangedSubview(humidityView)
        weatherStackView.addArrangedSubview(createSpacerView(height: 12))
        weatherStackView.addArrangedSubview(pressureView)
    }
    
    //MARK: - setupWeatherView
    private  func setupWeatherView() {
        setupWeatherDetailView(view: temperatureView, imageName: "AirQualityImage1", label: temperatureDetailLabel)
        setupWeatherDetailView(view: windView, imageName: "AirQualityImage2", label: windDetailLabel)
        setupWeatherDetailView(view: humidityView, imageName: "AirQualityImage3", label: humidityDetailLabel)
        setupWeatherDetailView(view: pressureView, imageName: "AirQualityImage4", label: pressureDetailLabel)
    }
    
    //MARK: - setupWeatherDetailView
    private func setupWeatherDetailView(view: UIView, imageName: String, label: UILabel) {
        view.translatesAutoresizingMaskIntoConstraints = false
        
        let imageView = UIImageView(image: UIImage(named: imageName))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(imageView)
        view.addSubview(label)
        
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 50),
            imageView.heightAnchor.constraint(equalToConstant: 50),
            
            label.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 8),
            label.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    //MARK: - createSpacerView
    private func createSpacerView(height: CGFloat) -> UIView {
        let spacerView = UIView()
        spacerView.translatesAutoresizingMaskIntoConstraints = false
        spacerView.heightAnchor.constraint(equalToConstant: height).isActive = true
        return spacerView
    }
    
    //MARK: - updateTemperatureDetail
    func updateTemperatureDetail(text: String) {
        temperatureDetailLabel.text = text
    }
    
    //MARK: - updateWindDetail
    func updateWindDetail(text: String) {
        windDetailLabel.text = text
    }
    
    //MARK: - updateHumidityDetail
    func updateHumidityDetail(text: String) {
        humidityDetailLabel.text = text
    }
    
    //MARK: - updatePressureDetail
    func updatePressureDetail(text: String) {
        pressureDetailLabel.text = text
    }
}
