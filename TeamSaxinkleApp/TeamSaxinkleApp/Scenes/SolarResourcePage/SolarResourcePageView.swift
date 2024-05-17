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
    
    private var averageDNI: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = UIColor.label
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var wholeStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 20.0
        stack.alignment = .leading
        stack.distribution = .fill
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = "Search"
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        //ხაზები რომ არ გამოჩნდეს
        searchBar.setBackgroundImage(UIImage(), for: .any, barMetrics: .default)
        searchBar.barTintColor = UIColor(named: "Background Color")
        return searchBar
    }()
    
    //MARK: - initialisers
    init(delegate: SolarResourcePageViewDelegate) {
        self.delegate = delegate
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    //MARK: - Methods
    
    //MARK: - Setup UI Components
    private func setupUI() {
        setWholeStackView()
        setSearchBar()
        setAverageDNI()
    }
    
    private func setWholeStackView() {
        addSubview(wholeStackView)
        setConstraintsToWholeStackView()
    }
    
    private func setSearchBar() {
        wholeStackView.addArrangedSubview(averageDNI)
        searchBar.delegate = self
        setConstraintsToSearchBar()
    }
    
    private func setAverageDNI() {
        wholeStackView.addArrangedSubview(averageDNI)
    }
    //MARK: - Set Constraints To UI Components
    private func setConstraintsToWholeStackView() {
        NSLayoutConstraint.activate([
            wholeStackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            wholeStackView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    private func setConstraintsToSearchBar() {
        NSLayoutConstraint.activate([
            searchBar.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
}

extension SolarResourcePageView: SolarResourcePageViewModelDelegate {
    
    func dataFetched(data: SolarData) {
        averageDNI.text = String(data.avg_dni.annual)
        layoutIfNeeded()
    }
    
    func dataDidNotFetch() {
        averageDNI.removeFromSuperview()
    }
}

extension SolarResourcePageView: UISearchBarDelegate {
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
    }

    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        delegate.fetchData(with: searchBar.text ?? "")
    }

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
    }
}
