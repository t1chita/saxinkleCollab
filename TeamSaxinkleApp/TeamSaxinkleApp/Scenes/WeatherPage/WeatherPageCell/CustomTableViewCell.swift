//
//  CustomTableViewCell.swift
//  TeamSaxinkleApp
//
//  Created by gvantsa gvagvalia on 5/17/24.
//

import UIKit

final class CustomTableViewCell: UITableViewCell {
    // MARK: - Properties
    static let cellIdentifier = "weatherCell"
    
    let containerView: UIView = {
        let containerView = UIView()
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.layer.cornerRadius = 25
        containerView.layer.masksToBounds = true
        containerView.backgroundColor = .systemGray5
        containerView.layer.borderColor = UIColor.label.cgColor
        containerView.layer.borderWidth = 1.0
        containerView.backgroundColor = .tertiarySystemFill
        return containerView
    }()
    
    let currentTime: CustomLabel = {
        let label = CustomLabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "day"
        label.textAlignment = .right
        return label
    }()
    
    let temperatureLabel: CustomLabel = {
        let view = CustomLabel()
        view.textAlignment = .right
        view.text = "temp"
        return view
    }()
    
    let weatherDescriptionLabel: CustomLabel = {
       let view = CustomLabel()
        return view
    }()
    
    let iconView: UIImageView = {
       let view = UIImageView(image: UIImage(systemName: "cloud.sun"))
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    // MARK: - LifeCycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - ConfigureWeather
    
    // MARK: - setupUI
    func setupUI() {
        selectionStyle = .none
        backgroundColor = .systemGray5
        addSubview(containerView)
        containerView.addSubview(currentTime)
        containerView.addSubview(iconView)
        containerView.addSubview(temperatureLabel)
        containerView.addSubview(weatherDescriptionLabel)
        
        NSLayoutConstraint.activate([
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            containerView.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
            
            iconView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 15),
            iconView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor, constant: 0),
            
            currentTime.leadingAnchor.constraint(equalTo: iconView.trailingAnchor, constant: 5),
            currentTime.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 7),

            weatherDescriptionLabel.leadingAnchor.constraint(equalTo: currentTime.leadingAnchor, constant: 0),
            weatherDescriptionLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -7),
            
            temperatureLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -15),
            temperatureLabel.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
        ])
    }
    
    // MARK: - UpdateBorderColor
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        if #available(iOS 13.0, *) {
            containerView.layer.borderColor = UIColor.label.cgColor
        } else {
            containerView.layer.borderColor = UIColor.label.cgColor
        }
    }
    
}
