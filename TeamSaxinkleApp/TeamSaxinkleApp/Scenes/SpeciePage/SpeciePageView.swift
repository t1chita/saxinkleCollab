//
//  SpeciePageView.swift
//  TeamSaxinkleApp
//
//  Created by Temur Chitashvili on 17.05.24.
//

import UIKit
import NetworkingService

class SpeciePageView: UIView {
    //MARK: - UIComponents
    let name: UILabel = {
        let label = UILabel()
        label.text = "test"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        return label
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
        setName()
    }
    
    private func setName() {
        addSubview(name)
        setConstraintsToName()
    }
    //MARK: - Set Constrainst To UI Components
    private func setConstraintsToName() {
        NSLayoutConstraint.activate([
            name.centerXAnchor.constraint(equalTo: centerXAnchor),
            name.centerYAnchor.constraint(equalTo: centerYAnchor),
            name.heightAnchor.constraint(equalToConstant: 20),
            name.widthAnchor.constraint(equalToConstant: 50),
        ])
    }
}
