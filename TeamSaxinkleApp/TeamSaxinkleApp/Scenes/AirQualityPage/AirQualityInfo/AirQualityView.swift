//
//  AirQualityModel.swift
//  TeamSaxinkleApp
//
//  Created by Default on 18.05.24.
//

import UIKit

class AirQualityView: UIView {

    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    let contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = "Search"
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        return searchBar
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Air Quality"
        label.font = UIFont.boldSystemFont(ofSize: 26)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = """
        Air quality refers to the condition of the air in our surroundings. It is essential to monitor and maintain good air quality as it directly impacts our health and the environment. Factors such as industrial emissions, vehicle exhaust, and natural phenomena can contribute to poor air quality. Simple measures like reducing energy consumption, using public transport, and planting trees can help improve air quality.
        """
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let factorsLabel: UILabel = {
        let label = UILabel()
        label.text = "Factors Affecting Air Quality"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let temperatureImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "AirQualityImage1")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let temperatureLabel: UILabel = {
        let label = UILabel()
        label.text = "Temperature"
        label.font = UIFont.systemFont(ofSize: 19)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let humidityImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "AirQualityImage2")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let humidityLabel: UILabel = {
        let label = UILabel()
        label.text = "Humidity"
        label.font = UIFont.systemFont(ofSize: 19)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let windImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "AirQualityImage3")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let windLabel: UILabel = {
        let label = UILabel()
        label.text = "Wind"
        label.font = UIFont.systemFont(ofSize: 19)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let tipsLabel: UILabel = {
        let label = UILabel()
        label.text = "Tips for Improving Air Quality"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let reduceEnergyHeading: UILabel = {
        let label = UILabel()
        label.text = "Reduce Energy Consumption"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let avoidIdlingHeading: UILabel = {
        let label = UILabel()
        label.text = "Avoid Vehicle Idling"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let usePublicTransportHeading: UILabel = {
        let label = UILabel()
        label.text = "Use Public Transport"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let plantTreesHeading: UILabel = {
        let label = UILabel()
        label.text = "Plant Trees"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let reduceEnergyLabel: UILabel = {
        let label = UILabel()
        label.text = "Use energy-efficient appliances and turn off electronics when not in use."
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let avoidIdlingLabel: UILabel = {
        let label = UILabel()
        label.text = "Turn off your vehicle's engine when parked for more than a minute."
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let usePublicTransportLabel: UILabel = {
        let label = UILabel()
        label.text = "Opt for buses, trains, or carpools to reduce individual vehicle emissions."
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let plantTreesLabel: UILabel = {
        let label = UILabel()
        label.text = "Trees absorb carbon dioxide and release oxygen, contributing to cleaner air."
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        contentView.addSubview(searchBar)
        contentView.addSubview(titleLabel)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(factorsLabel)
        
        contentView.addSubview(temperatureImageView)
        contentView.addSubview(temperatureLabel)
        
        contentView.addSubview(humidityImageView)
        contentView.addSubview(humidityLabel)
        
        contentView.addSubview(windImageView)
        contentView.addSubview(windLabel)
        
        contentView.addSubview(tipsLabel)
        
        contentView.addSubview(reduceEnergyHeading)
        contentView.addSubview(reduceEnergyLabel)
        
        contentView.addSubview(avoidIdlingHeading)
        contentView.addSubview(avoidIdlingLabel)
        
        contentView.addSubview(usePublicTransportHeading)
        contentView.addSubview(usePublicTransportLabel)
        
        contentView.addSubview(plantTreesHeading)
        contentView.addSubview(plantTreesLabel)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            searchBar.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor),
            searchBar.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            searchBar.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 18),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 18),
            descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            factorsLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 18),
            factorsLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            factorsLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            temperatureImageView.topAnchor.constraint(equalTo: factorsLabel.bottomAnchor, constant: 11),
            temperatureImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            temperatureImageView.widthAnchor.constraint(equalToConstant: 30),
            temperatureImageView.heightAnchor.constraint(equalToConstant: 30),
            
            temperatureLabel.centerYAnchor.constraint(equalTo: temperatureImageView.centerYAnchor),
            temperatureLabel.leadingAnchor.constraint(equalTo: temperatureImageView.trailingAnchor, constant: 8),
            
            humidityImageView.topAnchor.constraint(equalTo: temperatureImageView.bottomAnchor, constant: 11),
            humidityImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            humidityImageView.widthAnchor.constraint(equalToConstant: 30),
            humidityImageView.heightAnchor.constraint(equalToConstant: 30),
            
            humidityLabel.centerYAnchor.constraint(equalTo: humidityImageView.centerYAnchor),
            humidityLabel.leadingAnchor.constraint(equalTo: humidityImageView.trailingAnchor, constant: 8),
            
            windImageView.topAnchor.constraint(equalTo: humidityImageView.bottomAnchor, constant: 11),
            windImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            windImageView.widthAnchor.constraint(equalToConstant: 30),
            windImageView.heightAnchor.constraint(equalToConstant: 30),
            windLabel.centerYAnchor.constraint(equalTo: windImageView.centerYAnchor),
            windLabel.leadingAnchor.constraint(equalTo: windImageView.trailingAnchor, constant: 8),
            
            tipsLabel.topAnchor.constraint(equalTo: windLabel.bottomAnchor, constant: 19),
            tipsLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            tipsLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            reduceEnergyHeading.topAnchor.constraint(equalTo: tipsLabel.bottomAnchor, constant: 11),
            reduceEnergyHeading.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            reduceEnergyHeading.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            reduceEnergyLabel.topAnchor.constraint(equalTo: reduceEnergyHeading.bottomAnchor, constant: 4),
            reduceEnergyLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            reduceEnergyLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            avoidIdlingHeading.topAnchor.constraint(equalTo: reduceEnergyLabel.bottomAnchor, constant: 11),
            avoidIdlingHeading.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            avoidIdlingHeading.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            avoidIdlingLabel.topAnchor.constraint(equalTo: avoidIdlingHeading.bottomAnchor, constant: 4),
            avoidIdlingLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            avoidIdlingLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            usePublicTransportHeading.topAnchor.constraint(equalTo: avoidIdlingLabel.bottomAnchor, constant:11),
            usePublicTransportHeading.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            usePublicTransportHeading.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            usePublicTransportLabel.topAnchor.constraint(equalTo: usePublicTransportHeading.bottomAnchor, constant: 4),
            usePublicTransportLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            usePublicTransportLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            plantTreesHeading.topAnchor.constraint(equalTo: usePublicTransportLabel.bottomAnchor, constant: 11),
            plantTreesHeading.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            plantTreesHeading.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            plantTreesLabel.topAnchor.constraint(equalTo: plantTreesHeading.bottomAnchor, constant: 4),
            plantTreesLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            plantTreesLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            plantTreesLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16)
        ])
    }
}
