//
//  SolarResourcePageView.swift
//  TeamSaxinkleApp
//
//  Created by nuca on 17.05.24.
//

import UIKit

protocol SolarResourcePageViewDelegate {
    func fetchData(with: String)
}
class SolarResourcePageView: UIView {
    //MARK: - Properties
    private var delegate: SolarResourcePageViewDelegate
    
    private var labelArray: [UILabel] = {
        var array = [UILabel]()
        for _ in stride(from: 0, to: 3, by: 1) {
            let label = UILabel()
            label.textAlignment = .left
            label.numberOfLines = 0
            label.textColor = UIColor.label
            label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
            label.translatesAutoresizingMaskIntoConstraints = false
            array.append(label)
        }
        return array
    }()
    
    private var wholeStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 20.0
        stack.alignment = .fill
        stack.distribution = .fill
        stack.isUserInteractionEnabled = true
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = "Search address, get solar resource information"
        searchBar.searchTextField.font = .systemFont(ofSize: 12)
        searchBar.isUserInteractionEnabled = true
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        //ხაზები რომ არ გამოჩნდეს
        searchBar.setBackgroundImage(UIImage(), for: .any, barMetrics: .default)
        searchBar.layer.cornerRadius = 10
        return searchBar
    }()
    
    //MARK: - initialisers
    init(delegate: SolarResourcePageViewDelegate) {
        self.delegate = delegate
        super.init(frame: .zero)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    //MARK: - Methods
    
    //MARK: - Setup UI Components
    private func setupUI() {
        backgroundColor = .systemBackground
        setWholeStackView()
        setSearchBar()
        setLabels()
    }
    
    private func setWholeStackView() {
        addSubview(wholeStackView)
        setConstraintsToWholeStackView()
    }
    
    private func setSearchBar() {
        wholeStackView.addArrangedSubview(searchBar)
        searchBar.delegate = self
        setConstraintsToSearchBar()
    }
    
    private func setLabels() {
        for label in labelArray {
            wholeStackView.addArrangedSubview(label)
        }
    }
    
    //MARK: - Helper Methods
    private func generateAttributedString(with title: String, and data: TimePeriod) -> NSAttributedString {
        let title = NSAttributedString(string: "Average \(title):\n", attributes: [
            .font: UIFont.systemFont(ofSize: 24, weight: .bold),
        ])
        
        let subtitleAnnual = NSAttributedString(string: "Annual: ", attributes: [
            .font: UIFont.systemFont(ofSize: 20, weight: .semibold),
        ])
        
        let textAnnual = NSAttributedString(string: "\(data.annual) W/m²\n", attributes: [
            .font: UIFont.systemFont(ofSize: 16),
        ])
        
        let subtitleMonthly = NSAttributedString(string: "Monthly:\n", attributes: [
            .font: UIFont.systemFont(ofSize: 20, weight: .semibold),
        ])
        let textMonthly = NSAttributedString(string: generateMonthlyText(with: data), attributes: [
            .font: UIFont.systemFont(ofSize: 16),
        ])
        
        let combinedString = NSMutableAttributedString()
        combinedString.append(title)
        combinedString.append(subtitleAnnual)
        combinedString.append(textAnnual)
        combinedString.append(subtitleMonthly)
        combinedString.append(textMonthly)
        
        return combinedString
    }
    
    private func generateMonthlyText(with data: TimePeriod) -> String {
"""
January: \(data.monthly.jan) W/m²
February: \(data.monthly.feb) W/m²
March: \(data.monthly.mar) W/m²
April: \(data.monthly.apr) W/m²
May: \(data.monthly.may) W/m²
June: \(data.monthly.jun) W/m²
July: \(data.monthly.jul) W/m²
August: \(data.monthly.aug) W/m²
September: \(data.monthly.sep) W/m²
October: \(data.monthly.oct) W/m²
November: \(data.monthly.nov) W/m²
December: \(data.monthly.dec) W/m²
"""
    }
    
    //MARK: - Set Constraints To UI Components
    private func setConstraintsToWholeStackView() {
        NSLayoutConstraint.activate([
            wholeStackView.topAnchor.constraint(equalTo: topAnchor, constant: 100),
            wholeStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            wholeStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            wholeStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
        ])
    }
    
    private func setConstraintsToSearchBar() {
        NSLayoutConstraint.activate([
            searchBar.heightAnchor.constraint(equalToConstant: 40),
        ])
    }
}

extension SolarResourcePageView: SolarResourcePageVCViewDelegate {
    
    func dataFetched(data: SolarData) {
        labelArray[0].attributedText = generateAttributedString(with: "DNI", and: data.avg_dni)
        layoutIfNeeded()
    }
    
    func dataDidNotFetch() {
//        averageDNI.removeFromSuperview()
//        wholeStackView.layoutIfNeeded()
    }
}

extension SolarResourcePageView: UISearchBarDelegate {
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        delegate.fetchData(with: searchBar.text ?? "")
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.endEditing(true)
        super.touchesBegan(touches, with: event)
        searchBar.resignFirstResponder()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
}
