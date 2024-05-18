//
//  AirQualityDetailView.swift
//  TeamSaxinkleApp
//
//  Created by Default on 18.05.24.
//

import UIKit

class AirQualityDetailView: UIView {
    
    let locationLabel: UILabel = {
        let label = UILabel()
        label.text = "Los Angeles"
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let temperatureLabel: UILabel = {
        let label = UILabel()
        label.text = "82 F"
        label.font = UIFont.systemFont(ofSize: 48, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let airQualityLabel: UILabel = {
        let label = UILabel()
        label.text = "Air Quality Index"
        label.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let airQualityValueLabel: UILabel = {
        let label = UILabel()
        label.text = "Moderate"
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let airQualityProgressView: UIProgressView = {
        let progressView = UIProgressView(progressViewStyle: .default)
        progressView.progress = 0.6
        progressView.translatesAutoresizingMaskIntoConstraints = false
        return progressView
    }()
    
    let airQualityIndexLabel: UILabel = {
        let label = UILabel()
        label.text = "AQI: 61"
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let weatherStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let temperatureView = UIView()
    let temperatureDetailLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 22, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let windView = UIView()
    let windDetailLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 22, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let humidityView = UIView()
    let humidityDetailLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 22, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let pressureView = UIView()
    let pressureDetailLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 22, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - setupUI
    private func setupUI() {
        backgroundColor = .white
        
        addSubview(locationLabel)
        addSubview(temperatureLabel)
        addSubview(airQualityLabel)
        addSubview(airQualityValueLabel)
        addSubview(airQualityProgressView)
        addSubview(airQualityIndexLabel)
        addSubview(weatherStackView)
        
        setupWeatherDetailView(view: temperatureView, imageName: "AirQualityImage1", label: temperatureDetailLabel)
        setupWeatherDetailView(view: windView, imageName: "AirQualityImage2", label: windDetailLabel)
        setupWeatherDetailView(view: humidityView, imageName: "AirQualityImage3", label: humidityDetailLabel)
        setupWeatherDetailView(view: pressureView, imageName: "AirQualityImage4", label: pressureDetailLabel)
        
        weatherStackView.addArrangedSubview(temperatureView)
        weatherStackView.addArrangedSubview(createSpacerView(height: 12))
        weatherStackView.addArrangedSubview(windView)
        weatherStackView.addArrangedSubview(createSpacerView(height: 12))
        weatherStackView.addArrangedSubview(humidityView)
        weatherStackView.addArrangedSubview(createSpacerView(height: 12))
        weatherStackView.addArrangedSubview(pressureView)
    
        NSLayoutConstraint.activate([
            locationLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            locationLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            temperatureLabel.topAnchor.constraint(equalTo: locationLabel.bottomAnchor, constant: 10),
            temperatureLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            airQualityLabel.topAnchor.constraint(equalTo: temperatureLabel.bottomAnchor, constant: 20),
            airQualityLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            airQualityValueLabel.topAnchor.constraint(equalTo: airQualityLabel.bottomAnchor, constant: 10),
            airQualityValueLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            airQualityProgressView.topAnchor.constraint(equalTo: airQualityValueLabel.bottomAnchor, constant: 8),
            airQualityProgressView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            airQualityProgressView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            airQualityIndexLabel.topAnchor.constraint(equalTo: airQualityProgressView.bottomAnchor, constant: 10),
            airQualityIndexLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            weatherStackView.topAnchor.constraint(equalTo: airQualityIndexLabel.bottomAnchor, constant: 35),
            weatherStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            weatherStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            weatherStackView.bottomAnchor.constraint(lessThanOrEqualTo: safeAreaLayoutGuide.bottomAnchor, constant: -16)
        ])
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
