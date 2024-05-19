//
//  PopulationPageView.swift
//  TeamSaxinkleApp
//
//  Created by MacBook Air on 17.05.24.
//

import UIKit

class PopulationPageView: UIView {
    
    // MARK: - UI Components
   
    
    let countryTextField: CustomTextField = {
        let textField = CustomTextField()
        textField.attributedPlaceholder = NSAttributedString(string:"Enter Country Name")
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
    
     let todaysPopulationLabel: CustomLabel = {
         let title = CustomLabel()
         title.text = "Today's population"
         return title
     }()

    
    let todaysPopulationValueLabel: CustomLabel = {
        let title = CustomLabel()
        title.text = "Population:"
        return title
    }()

    
    let tomorrowsPopulationLabel: CustomLabel = {
        let title = CustomLabel()
        title.text = "Tomorrow's population:"
        return title
    }()

    
    let tomorrowsPopulationValueLabel: CustomLabel = {
        let title = CustomLabel()
        title.text = "Population"
        return title
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
        addSubview(fetchStackView)
        addSubview(populationStackView)
        
        NSLayoutConstraint.activate([
            
            fetchStackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
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
