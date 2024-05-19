//
//  PopulationPageView.swift
//  TeamSaxinkleApp
//
//  Created by MacBook Air on 17.05.24.
//

import UIKit

final class PopulationPageView: UIView {
    
    // MARK: - UI Components
    
    let countryTextField: CustomTextField = {
        let textField = CustomTextField()
        textField.attributedPlaceholder = NSAttributedString(string:"Enter Country Name")
        return textField
    }()
 
    
    let fetchButton: CustomButton = {
        let button = CustomButton()
        let attributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.white,
            .font: UIFont.systemFont(ofSize: 16, weight: .bold)
        ]
        let attributedTitle = NSAttributedString(string: "Fetch Population", attributes: attributes)
        button.setAttributedTitle(attributedTitle, for: .normal)
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
   
    private lazy var fetchStackView: CustomVStackView = {
        let view = CustomVStackView(arrangedSubviews: [countryTextField,fetchButton])
        view.spacing = 10
        view.distribution = .fillEqually
        return view
    }()
    
    private lazy var populationStackView: CustomVStackView = {
        let view = CustomVStackView(arrangedSubviews: [todaysPopulationLabel, todaysPopulationValueLabel,
                                                       tomorrowsPopulationLabel, tomorrowsPopulationValueLabel])
        view.spacing = 8
        view.alignment = .center
        view.distribution = .equalSpacing
        return view
    }()
    
    // MARK: - Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .systemGray5
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
