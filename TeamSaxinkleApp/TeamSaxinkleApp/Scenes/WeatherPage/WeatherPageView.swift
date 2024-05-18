//
//  WeatherPageView.swift
//  TeamSaxinkleApp
//
//  Created by gvantsa gvagvalia on 5/17/24.
//

import UIKit


class WeatherPageView: UIView {
    
    // MARK: - Properties
    public var weatherModel: [ListArray] = []
    
//    სქროლვიუ აღარრ მჭირდება - წავშალოო!!
    let weatherScrollView: UIScrollView = {
        let view = UIScrollView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isScrollEnabled = true
        view.showsVerticalScrollIndicator = true
        return view
    }()
    
    let weatherStackView: CustomVStackView = {
        let view = CustomVStackView()
        return view
    }()
    
    let latLabel: CustomLabel = {
        let title = CustomLabel()
        title.text = "Enter latitude"
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
        return title
    }()
    
    let longitudeTextField: CustomTextField = {
        let textField = CustomTextField()
        textField.attributedPlaceholder = NSAttributedString(string: "E.g. 44.8015")
        return textField
    }()
    
    let searchWeatherButton: CustomButton = {
        let view = CustomButton()
        view.setTitle("მოძებნე ... ", for: .normal)
        return view
    }()
    
    let weatherDetailsTableView: UITableView = {
        let view = UITableView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.register(CustomTableViewCell.self, forCellReuseIdentifier: CustomTableViewCell.cellIdentifier)
        view.separatorStyle = .none
        return view
    }()
    
    let forecastLocationLabel: CustomLabel = {
        let view = CustomLabel()
        view.textAlignment = .center
        view.font = UIFont.boldSystemFont(ofSize: 20)
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
        setupUI()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - SetupUI
    func setupUI() {
        setupScrollViewConstraints()
        setupStackViewConstraints()
        setupTableView()
    }
    
    // MARK: - Setup Views
    func setupScrollViewConstraints() {
        addSubview(weatherScrollView)
        addSubview(forecastLocationLabel)
        weatherScrollView.addSubview(weatherStackView)
        
        NSLayoutConstraint.activate([
            weatherScrollView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            weatherScrollView.topAnchor.constraint(equalTo: topAnchor, constant: 41),
            weatherScrollView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            weatherScrollView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -140),
        ])
    }
    
    func setupStackViewConstraints() {
        weatherStackView.addArrangedSubview(latLabel)
        weatherStackView.addArrangedSubview(latitudeTextField)
        weatherStackView.addArrangedSubview(longLabel)
        weatherStackView.addArrangedSubview(longitudeTextField)
        addSubview(searchWeatherButton)
        
        NSLayoutConstraint.activate([
            weatherStackView.leadingAnchor.constraint(equalTo: weatherScrollView.leadingAnchor, constant: 0),
            weatherStackView.topAnchor.constraint(equalTo: weatherScrollView.topAnchor, constant: 0),
            weatherStackView.trailingAnchor.constraint(equalTo: weatherScrollView.trailingAnchor, constant: 0),
            weatherStackView.bottomAnchor.constraint(equalTo: weatherScrollView.bottomAnchor, constant: 0),
            weatherStackView.widthAnchor.constraint(equalTo: weatherScrollView.widthAnchor),
            
            latitudeTextField.heightAnchor.constraint(equalToConstant: 45),
            longitudeTextField.heightAnchor.constraint(equalTo: latitudeTextField.heightAnchor),
            
            searchWeatherButton.leadingAnchor.constraint(equalTo: weatherStackView.leadingAnchor),
            searchWeatherButton.trailingAnchor.constraint(equalTo: weatherStackView.trailingAnchor),
            searchWeatherButton.topAnchor.constraint(equalTo: weatherStackView.bottomAnchor, constant: 25),
            searchWeatherButton.heightAnchor.constraint(equalTo: latitudeTextField.heightAnchor),
        ])
    }
    
    func setupTableView() {
        addSubview(weatherDetailsTableView)
        
        NSLayoutConstraint.activate([
            weatherDetailsTableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            weatherDetailsTableView.topAnchor.constraint(equalTo: forecastLocationLabel.bottomAnchor, constant: 20),
            weatherDetailsTableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            weatherDetailsTableView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -50),
            
            forecastLocationLabel.topAnchor.constraint(equalTo: searchWeatherButton.bottomAnchor, constant: 10),
            forecastLocationLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
    
}


