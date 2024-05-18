//
//  SolarResourceInformationPageView.swift
//  TeamSaxinkleApp
//
//  Created by nuca on 18.05.24.
//

import UIKit

final class SolarResourceInformationPageView: UIView, SolarResourceInformationPageVCDelegate {
    private var information: SolarResourceInformationModel
    
    private var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private var wholeStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 20.0
        stack.alignment = .center
        stack.distribution = .fill
        stack.isUserInteractionEnabled = true
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private var label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0
        label.textColor = UIColor.label
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //MARK: - initialisers
    init(information: SolarResourceInformationModel) {
        self.information = information
        super.init(frame: .zero)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    //MARK: - Setup UI Components
    private func setupUI() {
        backgroundColor = .systemBackground
        setWholeStackView()
        setImageView()
        setLabel()
    }
    
    private func setWholeStackView() {
        addSubview(wholeStackView)
        setConstraintsToWholeStackView()
    }
    
    private func setImageView() {
        imageView.image = UIImage(named: information.imageString)
        wholeStackView.addArrangedSubview(imageView)
        setConstraintsToImageView()
    }
    
    private func setLabel() {
        label.text = information.information
        wholeStackView.addArrangedSubview(label)
    }
    
    //MARK: - Set Constraints To UI Components
    private func setConstraintsToWholeStackView() {
        NSLayoutConstraint.activate([
            wholeStackView.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            wholeStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            wholeStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            wholeStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20)
        ])
    }
    
    private func setConstraintsToImageView() {
        NSLayoutConstraint.activate([
            imageView.heightAnchor.constraint(equalToConstant: (window?.screen.bounds.width ?? 220) - 20)
        ])
    }
}
