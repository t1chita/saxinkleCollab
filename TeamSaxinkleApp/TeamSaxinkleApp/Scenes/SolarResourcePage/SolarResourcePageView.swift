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
    
    private var data: SolarData?
    
    private var solarCollectionView: UICollectionView = {
        let collectionViewFlowLayout = UICollectionViewFlowLayout()
        collectionViewFlowLayout.scrollDirection = .horizontal
        collectionViewFlowLayout.minimumLineSpacing = 1
        collectionViewFlowLayout.minimumInteritemSpacing = 1
        collectionViewFlowLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewFlowLayout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(SolarResourceCell.self, forCellWithReuseIdentifier: SolarResourceCell.identifier)
        collectionView.backgroundColor = .clear
        return collectionView
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
    
    private func setSolarCollectionView() {
        wholeStackView.addArrangedSubview(solarCollectionView)
        solarCollectionView.dataSource = self
    }
    
    //MARK: - Helper Methods
    
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
        setSolarCollectionView()
        self.data = data
        solarCollectionView.reloadData()
    }
    
    func dataDidNotFetch() {
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

extension SolarResourcePageView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SolarResourceCell.identifier, for: indexPath) as! SolarResourceCell
        switch (indexPath.row) {
        case 0: cell.updateCell(with: data!.avg_dni, and: "Direct Normal Irradiance")
        case 1: cell.updateCell(with: data!.avg_ghi, and: "Global Horizontal Irradiance")
        case 2: cell.updateCell(with: data!.avg_lat_tilt, and: "Tilt at Latitude")
        default: break
        }
        return cell
    }
}
