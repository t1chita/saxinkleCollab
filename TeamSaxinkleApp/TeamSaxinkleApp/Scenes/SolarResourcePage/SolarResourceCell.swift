//
//  SolarResourceCell.swift
//  TeamSaxinkleApp
//
//  Created by nuca on 18.05.24.
//

import UIKit

class SolarResourceCell: UICollectionViewCell {
    //MARK: - Properties
    static let identifier = "SolarResourceCell"
    
    private var label: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.numberOfLines = 0
        label.textColor = UIColor.label
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //MARK: - Initializers
        override init(frame: CGRect) {
            super.init(frame: frame)
            setupUI()
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
    //MARK: - Setup UI Components
    private func setupUI() {
        backgroundColor = .clear
        setLabel()
    }
    
    private func setLabel() {
        addSubview(label)
        setConstraintsToLabel()
    }
    
    //MARK: - Set Constraints To UI Components
    private func setConstraintsToLabel() {
        NSLayoutConstraint.activate([
            label.widthAnchor.constraint(equalToConstant: 200),
            label.leadingAnchor.constraint(equalTo: leadingAnchor),
            label.trailingAnchor.constraint(equalTo: trailingAnchor),
            label.topAnchor.constraint(equalTo: topAnchor),
            label.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
    //MARK: - Helper Methods
    private func generateAttributedString(with title: String, and data: TimePeriod) -> NSAttributedString {
        let bigTitle = NSAttributedString(string: "Average \(title):\n", attributes: [
            .font: UIFont.systemFont(ofSize: 24, weight: .bold),
        ])
        
        let unit = title == "Tilt at Latitude" ? "degrees" : "W/m²"
        
        let subtitleAnnual = NSAttributedString(string: "Annual: ", attributes: [
            .font: UIFont.systemFont(ofSize: 20, weight: .semibold),
        ])
        
        let textAnnual = NSAttributedString(string: "\(data.annual) \(unit)\n", attributes: [
            .font: UIFont.systemFont(ofSize: 16),
        ])
        
        let subtitleMonthly = NSAttributedString(string: "Monthly:\n", attributes: [
            .font: UIFont.systemFont(ofSize: 20, weight: .semibold),
        ])
        let textMonthly = NSAttributedString(string: generateMonthlyText(with: data, and: unit), attributes: [
            .font: UIFont.systemFont(ofSize: 16),
        ])
        
        let combinedString = NSMutableAttributedString()
        combinedString.append(bigTitle)
        combinedString.append(subtitleAnnual)
        combinedString.append(textAnnual)
        combinedString.append(subtitleMonthly)
        combinedString.append(textMonthly)
        
        return combinedString
    }
    
    private func generateMonthlyText(with data: TimePeriod, and unit: String) -> String {
"""
January: \(data.monthly.jan) \(unit)
February: \(data.monthly.feb) \(unit)
March: \(data.monthly.mar) \(unit)
April: \(data.monthly.apr) \(unit)
May: \(data.monthly.may) \(unit)
June: \(data.monthly.jun) \(unit)
July: \(data.monthly.jul) \(unit)
August: \(data.monthly.aug) \(unit)
September: \(data.monthly.sep) \(unit)
October: \(data.monthly.oct) \(unit)
November: \(data.monthly.nov) \(unit)
December: \(data.monthly.dec) \(unit)
"""
    }
    
    //MARK: - Update
    func updateCell(with data: TimePeriod, and title: String) {
        label.attributedText = generateAttributedString(with: title, and: data)
        layoutIfNeeded()
    }
}
