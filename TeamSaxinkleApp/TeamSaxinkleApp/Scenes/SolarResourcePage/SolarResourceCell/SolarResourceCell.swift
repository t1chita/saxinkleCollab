//
//  SolarResourceCell.swift
//  TeamSaxinkleApp
//
//  Created by nuca on 18.05.24.
//

import UIKit

final class SolarResourceCell: UICollectionViewCell {
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
        setBackgroundColor()
        setContentView()
        setLabel()
    }
    
    private func setBackgroundColor() {
        backgroundColor = .clear
    }
    
    private func setContentView() {
        contentView.backgroundColor = .label.withAlphaComponent(0.1)
        contentView.layer.masksToBounds = true
        contentView.layer.cornerRadius = 20
        contentView.layer.borderColor = UIColor.black.cgColor
        contentView.layer.borderWidth = 2
    }
    
    private func setLabel() {
        addSubview(label)
        setConstraintsToLabel()
    }
    
    //MARK: - Set Constraints To UI Components
    private func setConstraintsToLabel() {
        NSLayoutConstraint.activate([
            label.widthAnchor.constraint(equalToConstant: window?.screen.bounds.width ?? 300),
            label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            label.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            label.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
        ])
    }
    
    //MARK: - Helper Methods
    private func generateAttributedString(with title: String, and data: TimePeriod) -> NSAttributedString {
        let combinedString = NSMutableAttributedString()
        //ერთეული რომელიც ამ მონაცემს შეესადაგება
        let unit = title == "Tilt at Latitude" ? "degrees" : "W/m²"
        
        //გავაერთიანოთ ტექსტი
        [
            ("Average \(title):\n", 24, UIFont.Weight.bold),
            ("Annual: ", 20, UIFont.Weight.semibold),
            ("\(data.annual) \(unit)\n", 16, UIFont.Weight.regular),
            ("Monthly:\n", 20, UIFont.Weight.semibold),
            (generateMonthlyText(with: data.monthly, and: unit), 16, UIFont.Weight.regular),
        ].forEach {
            let line = NSAttributedString(string: $0.0, attributes: [
                .font: UIFont.systemFont(ofSize: $0.1, weight: $0.2),
            ])
            combinedString.append(line)
        }
        
        return combinedString
    }
    
    private func generateMonthlyText(with data: MonthlyData, and unit: String) -> String {
"""
January: \(data.jan) \(unit)
February: \(data.feb) \(unit)
March: \(data.mar) \(unit)
April: \(data.apr) \(unit)
May: \(data.may) \(unit)
June: \(data.jun) \(unit)
July: \(data.jul) \(unit)
August: \(data.aug) \(unit)
September: \(data.sep) \(unit)
October: \(data.oct) \(unit)
November: \(data.nov) \(unit)
December: \(data.dec) \(unit)
"""
    }
    
    //MARK: - Update
    func updateCell(with data: TimePeriod, and title: String) {
        label.attributedText = generateAttributedString(with: title, and: data)
        layoutIfNeeded()
    }
}
