//
//  SpeciePageView.swift
//  TeamSaxinkleApp
//
//  Created by Temur Chitashvili on 17.05.24.
//

import UIKit

class SpeciePageView: UIView {
    //MARK: - UIComponents
    let headerLabel: UILabel = {
        let lbl = UILabel ()
        lbl.text = "Popular Species In Searched Area"
        lbl.textColor = .label
        lbl.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    let natureTableView: UITableView = {
        let tbv = UITableView()
        tbv.separatorStyle = .none
        tbv.translatesAutoresizingMaskIntoConstraints = false
        tbv.register(NatureCell.self, forCellReuseIdentifier: NatureCell.identifier)
        return tbv
    }()
    
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
        backgroundColor = .systemBackground
        setHeaderLabel()
        setCountriesTableView()
    }
    
    private func setHeaderLabel() {
        addSubview(headerLabel)
        setConstraintsToHeaderLabel()
    }
    
    private func setCountriesTableView() {
        addSubview(natureTableView)
        setConstraintsToNatureTableView()
    }
    //MARK: - Set Constrainst To UI Components
    private func setConstraintsToHeaderLabel() {
        NSLayoutConstraint.activate([
            headerLabel.topAnchor.constraint(equalTo: topAnchor, constant: 150),
            headerLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            headerLabel.heightAnchor.constraint(equalToConstant: 30),
            headerLabel.widthAnchor.constraint(equalToConstant: 300),
        ])
    }
    
    private func setConstraintsToNatureTableView() {
        NSLayoutConstraint.activate([
            natureTableView.topAnchor.constraint(equalTo: topAnchor, constant: 50),
            natureTableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            natureTableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            natureTableView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -100)
        ])
    }
}
