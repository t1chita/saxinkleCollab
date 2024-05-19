//
//  SpeciePageView.swift
//  TeamSaxinkleApp
//
//  Created by Temur Chitashvili on 17.05.24.
//

import UIKit

final class SpeciePageView: UIView {
    let spinningCircleView: SpinningCircleView = {
        let spView = SpinningCircleView()
        spView.isHidden = true
        spView.translatesAutoresizingMaskIntoConstraints = false
        return spView
    }()
    //MARK: - UIComponents
    private let searchCityBar: CustomSearchBar = {
        let srbar = CustomSearchBar()
        return srbar
    }()
    
    private let headerLabel: CustomLabel = {
        let lbl = CustomLabel ()
        lbl.text = "Popular Species In Searched Area"
        lbl.font = UIFont.systemFont(ofSize: 16)
        return lbl
    }()
    
    let natureTableView: UITableView = {
        let tbv = UITableView()
        tbv.separatorStyle = .none
        tbv.translatesAutoresizingMaskIntoConstraints = false
        tbv.backgroundColor = .systemGray5
        tbv.register(NatureCell.self, forCellReuseIdentifier: NatureCell.identifier)
        return tbv
    }()
    
    //MARK: Delegates
    weak var viewModelLoadDelegate: ViewModelLoadDelegate?
    
    //MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Setup UI Components
    private func setUp() {
        backgroundColor = .systemGray5
        setsearchCityBar()
        setHeaderLabel()
        setCountriesTableView()
        setSpinningCircleView()
        searchCityBar.delegate = self
    }
    
    private func setsearchCityBar() {
        addSubview(searchCityBar)
        setConstraintsToSearchCityBar()
    }
    
    private func setHeaderLabel() {
        addSubview(headerLabel)
        setConstraintsToHeaderLabel()
    }
    
    private func setCountriesTableView() {
        addSubview(natureTableView)
        setConstraintsToNatureTableView()
    }
    
    private func setSpinningCircleView() {
        addSubview(spinningCircleView)
        setConstraintsToSpinningCircleView()
    }
    
    //MARK: - Set Constrainst To UI Components
    private func setConstraintsToSearchCityBar() {
        NSLayoutConstraint.activate([
            searchCityBar.topAnchor.constraint(equalTo: topAnchor, constant: 110),
            searchCityBar.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            searchCityBar.heightAnchor.constraint(equalToConstant: 30),
            searchCityBar.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
        ])
    }
    
    private func setConstraintsToHeaderLabel() {
        NSLayoutConstraint.activate([
            headerLabel.topAnchor.constraint(equalTo: searchCityBar.bottomAnchor, constant: 10),
            headerLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            headerLabel.heightAnchor.constraint(equalToConstant: 30),
            headerLabel.widthAnchor.constraint(equalToConstant: 300),
        ])
    }

    private func setConstraintsToSpinningCircleView() {
        NSLayoutConstraint.activate([
            spinningCircleView.centerXAnchor.constraint(equalTo: centerXAnchor),
            spinningCircleView.centerYAnchor.constraint(equalTo: centerYAnchor),
            spinningCircleView.widthAnchor.constraint(equalToConstant: 56),
            spinningCircleView.heightAnchor.constraint(equalToConstant: 56),
        ])
    }
    
    private func setConstraintsToNatureTableView() {
        NSLayoutConstraint.activate([
            natureTableView.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: 10),
            natureTableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            natureTableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            natureTableView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}

//MARK: Reload Data For ViewModel
extension SpeciePageView: ReloadTableViewDelegate {
    func reloadData() {
        DispatchQueue.main.async { [weak self] in
            self?.natureTableView.reloadData()
        }
    }
}

//MARK: Extension For Text Input In SearchBar
extension SpeciePageView: UISearchBarDelegate {
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        guard let unwrappedText = searchBar.text else { return }
        viewModelLoadDelegate?.didLoad(with: unwrappedText)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.endEditing(true)
        super.touchesBegan(touches, with: event)
        searchCityBar.resignFirstResponder()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
}
