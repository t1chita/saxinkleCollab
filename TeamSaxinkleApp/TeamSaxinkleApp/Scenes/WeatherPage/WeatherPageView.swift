//
//  WeatherPageView.swift
//  TeamSaxinkleApp
//
//  Created by gvantsa gvagvalia on 5/17/24.
//

import UIKit


final class WeatherPageView: UIView {
    
    // MARK: - Properties
    public var weatherModel: [ListArray] = []
    
    let weatherStackView: CustomVStackView = {
        let view = CustomVStackView()
        return view
    }()
    
    let latLabel: CustomLabel = {
        let title = CustomLabel()
        title.text = "Enter latitude"
        title.font = UIFont.boldSystemFont(ofSize: title.font.pointSize)
        return title
    }()
    
    let latitudeTextField: CustomTextField = {
        let textField = CustomTextField()
        textField.attributedPlaceholder = NSAttributedString(string: "E.g. 41.6938")
        return textField
    }()
    
    let longLabel: CustomLabel = {
        let title = CustomLabel()
        title.text = "Enter longitude"
        title.font = UIFont.boldSystemFont(ofSize: title.font.pointSize)
        return title
    }()
    
    let longitudeTextField: CustomTextField = {
        let textField = CustomTextField()
        textField.attributedPlaceholder = NSAttributedString(string: "E.g. 44.8015")
        return textField
    }()
    
    let searchWeatherButton: CustomButton = {
        let view = CustomButton()
        view.setTitle("ძებნა ", for: .normal)
        return view
    }()
    
    let weatherDetailsTableView: UITableView = {
        let view = UITableView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.register(CustomTableViewCell.self, forCellReuseIdentifier: CustomTableViewCell.cellIdentifier)
        view.separatorStyle = .none
        view.backgroundColor = .systemBackground
        view.clipsToBounds = true
        return view
    }()
    
    let forecastLocationLabel: CustomLabel = {
        let view = CustomLabel()
        view.textAlignment = .center
        view.font = UIFont.boldSystemFont(ofSize: view.font.pointSize)
        view.text = "Location: Country - Place"
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - SetupUI
    func setupUI() {
        setupStackViewConstraints()
        setupTableView()
    }
    
    // MARK: - Setup Views
    
    func setupStackViewConstraints() {
        addSubview(weatherStackView)
        weatherStackView.addArrangedSubview(latLabel)
        weatherStackView.addArrangedSubview(latitudeTextField)
        weatherStackView.addArrangedSubview(longLabel)
        weatherStackView.addArrangedSubview(longitudeTextField)
        addSubview(searchWeatherButton)
        addSubview(forecastLocationLabel)
        
        NSLayoutConstraint.activate([
            weatherStackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            weatherStackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0),
            weatherStackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
            weatherStackView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.18),
            
            latitudeTextField.heightAnchor.constraint(equalToConstant: 45),
            longitudeTextField.heightAnchor.constraint(equalTo: latitudeTextField.heightAnchor),
            
            searchWeatherButton.topAnchor.constraint(equalTo: weatherStackView.bottomAnchor, constant: 10),
            searchWeatherButton.heightAnchor.constraint(equalTo: latitudeTextField.heightAnchor),
            searchWeatherButton.widthAnchor.constraint(equalTo: latitudeTextField.widthAnchor, multiplier: 0.7),
            searchWeatherButton.centerXAnchor.constraint(equalTo: centerXAnchor),
        ])
    }
    
    func setupTableView() {
        addSubview(weatherDetailsTableView)
        
        NSLayoutConstraint.activate([
            weatherDetailsTableView.leadingAnchor.constraint(equalTo: weatherStackView.leadingAnchor),
            weatherDetailsTableView.topAnchor.constraint(equalTo: forecastLocationLabel.bottomAnchor, constant: 0),
            weatherDetailsTableView.trailingAnchor.constraint(equalTo: weatherStackView.trailingAnchor),
            weatherDetailsTableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            
            forecastLocationLabel.topAnchor.constraint(equalTo: searchWeatherButton.bottomAnchor, constant: 10),
            forecastLocationLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
    
}


