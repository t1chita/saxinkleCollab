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
        stack.alignment = .fill
        stack.distribution = .fill
        stack.isUserInteractionEnabled = true
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = "Search"
        searchBar.isUserInteractionEnabled = true
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        //ხაზები რომ არ გამოჩნდეს
        searchBar.setBackgroundImage(UIImage(), for: .any, barMetrics: .default)
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
        backgroundColor = .white
        setWholeStackView()
        setSearchBar()
        setAverageDNI()
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
    
    private func setAverageDNI() {
        wholeStackView.addArrangedSubview(averageDNI)
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
            searchBar.heightAnchor.constraint(equalToConstant: 20),
        ])
    }
}

extension SolarResourcePageView: SolarResourcePageVCViewDelegate {
    
    func dataFetched(data: SolarData) {
        averageDNI.text = String(data.avg_dni.annual)
        layoutIfNeeded()
    }
    
    func dataDidNotFetch() {
        averageDNI.removeFromSuperview()
    }
}

extension SolarResourcePageView: UISearchBarDelegate {
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        delegate.fetchData(with: searchBar.text ?? "")
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.endEditing(true)
        super.touchesBegan(touches, with: event)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
}
