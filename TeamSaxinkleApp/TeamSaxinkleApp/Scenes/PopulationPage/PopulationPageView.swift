//
//  PopulationPageView.swift
//  TeamSaxinkleApp
//
//  Created by MacBook Air on 17.05.24.
//

import UIKit

class PopulationPageView: UIView {
    
    // MARK: - UI Components
    
    let countryDataLabel: UILabel = {
        let label = UILabel()
        label.text = "Country Data"
        label.font = UIFont.boldSystemFont(ofSize: 38)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let countryTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter country name"
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let fetchButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Fetch Population", for: .normal)
        button.backgroundColor = .black
        button.layer.cornerRadius = 10
        button.tintColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let todaysPopulationLabel: UILabel = {
        let label = UILabel()
        label.text = "Today's population"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let todaysPopulationValueLabel: UILabel = {
        let label = UILabel()
        label.text = "Population:"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let tomorrowsPopulationLabel: UILabel = {
        let label = UILabel()
        label.text = "Tomorrow's population"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let tomorrowsPopulationValueLabel: UILabel = {
        let label = UILabel()
        label.text = "Population:"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var fetchStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [countryTextField, fetchButton])
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var populationStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            todaysPopulationLabel, todaysPopulationValueLabel,
            tomorrowsPopulationLabel, tomorrowsPopulationValueLabel
        ])
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.distribution = .equalSpacing
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    // MARK: - Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI Setup
    
    private func setupUI() {
        addSubview(countryDataLabel)
        addSubview(fetchStackView)
        addSubview(populationStackView)
        
        NSLayoutConstraint.activate([
            countryDataLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            countryDataLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            fetchStackView.topAnchor.constraint(equalTo: countryDataLabel.bottomAnchor, constant: 20),
            fetchStackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            fetchStackView.heightAnchor.constraint(equalToConstant: 100),
            fetchStackView.widthAnchor.constraint(equalToConstant: 250),
            
            populationStackView.topAnchor.constraint(equalTo: fetchStackView.bottomAnchor, constant: 20),
            populationStackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            populationStackView.heightAnchor.constraint(equalToConstant: 120),
            populationStackView.widthAnchor.constraint(equalToConstant: 250)
        ])
    }
}
