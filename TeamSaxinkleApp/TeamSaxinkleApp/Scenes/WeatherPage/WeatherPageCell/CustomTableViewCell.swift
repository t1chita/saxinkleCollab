//
//  CustomTableViewCell.swift
//  TeamSaxinkleApp
//
//  Created by gvantsa gvagvalia on 5/17/24.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    // MARK: - Properties
    static let cellIdentifier = "weatherCell"
    
    let containerView: UIView = {
        let containerView = UIView()
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.layer.cornerRadius = 25
        containerView.layer.masksToBounds = true
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
        backgroundColor = .tertiarySystemBackground
        addSubview(containerView)
        containerView.addSubview(currentTime)
        containerView.addSubview(temperatureLabel)
        
        NSLayoutConstraint.activate([
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            containerView.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
            
            currentTime.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            currentTime.trailingAnchor.constraint(equalTo: temperatureLabel.leadingAnchor, constant: -34),
            currentTime.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            
            temperatureLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: 0),
            temperatureLabel.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
        ])
    }
    
    // MARK: - UpdateBorderColor
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        if #available(iOS 13.0, *) {
            containerView.layer.borderColor = UIColor.label.cgColor
        } else {
            containerView.layer.borderColor = UIColor.black.cgColor
        }
    }
    
}
