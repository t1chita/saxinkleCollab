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

protocol PresentableVC: SolarResourcePageViewDelegate {
    func presentView(of: SolarInformation)
}

final class SolarResourcePageView: UIView {
    //MARK: - Properties
    private var delegate: PresentableVC
    
    private var data: SolarData?
    
    private var label: CustomLabel = {
        let label = CustomLabel()
        label.text = "Click On Boxes For Information"
        return label
    }()
    
    private var solarCollectionView: UICollectionView = {
        let collectionViewFlowLayout = UICollectionViewFlowLayout()
        collectionViewFlowLayout.scrollDirection = .vertical
        collectionViewFlowLayout.minimumLineSpacing = 10
        collectionViewFlowLayout.minimumInteritemSpacing = 10
        collectionViewFlowLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewFlowLayout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(SolarResourceCell.self, forCellWithReuseIdentifier: SolarResourceCell.identifier)
        collectionView.backgroundColor = .clear
        collectionView.isUserInteractionEnabled = true
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
    
    private var wholeStackViewBottomConstraint: NSLayoutConstraint?
    
    private var searchBar: UISearchBar = {
        let searchBar = CustomSearchBar()
        searchBar.placeholder = "Search address, get solar resource information"
        return searchBar
    }()
    
    private var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "SolarEnergyImage")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    //MARK: - initialisers
    init(delegate: PresentableVC) {
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
        backgroundColor = .systemGray5
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
        solarCollectionView.delegate = self
    }
    
    private func setLabel() {
        wholeStackView.addArrangedSubview(label)
    }

    //MARK: - Helper Methods
    
    //MARK: - Set Constraints To UI Components
    private func setConstraintsToWholeStackView() {
        wholeStackViewBottomConstraint = wholeStackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        NSLayoutConstraint.activate([
            wholeStackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
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

//MARK: - SolarResourcePageVCViewDelegate
extension SolarResourcePageView: SolarResourcePageVCViewDelegate {
    
    func dataFetched(data: SolarData) {
        //რათა collectionView-მ იცოდეს სიგანე რა აქვს
        wholeStackViewBottomConstraint?.isActive = true
        setLabel()
        setSolarCollectionView()
        self.data = data
        solarCollectionView.reloadData()
    }
    
    func dataDidNotFetch() {
        //რათა search bar იყოს ზევით
        wholeStackViewBottomConstraint?.isActive = false
        solarCollectionView.removeFromSuperview()
        label.removeFromSuperview()
        wholeStackView.layoutIfNeeded()
    }
}

//MARK: - UISearchBarDelegate
extension SolarResourcePageView: UISearchBarDelegate {
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        if let text = searchBar.text, text != "" {
            delegate.fetchData(with: text)
        }
        searchBar.resignFirstResponder()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            searchBar.searchTextField.layer.borderColor = UIColor.red.cgColor
        } else {
            searchBar.searchTextField.layer.borderColor = UIColor.clear.cgColor
        }
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
}

//MARK: - UICollectionViewDataSource
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

//MARK: -
extension SolarResourcePageView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch (indexPath.row) {
        case 0: delegate.presentView(of: .DNI)
        case 1: delegate.presentView(of: .GHI)
        case 2: delegate.presentView(of: .TAL)
        default: break
        }
    }
}
