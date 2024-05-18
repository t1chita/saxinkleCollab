//
//  CustomSearchBar.swift
//  TeamSaxinkleApp
//
//  Created by nuca on 18.05.24.
//

import UIKit

final class CustomSearchBar: UISearchBar {

    //MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSearchBar()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupSearchBar()
    }

    //MARK: - Setup UI
    private func setupSearchBar() {
        searchTextField.font = .systemFont(ofSize: 12)
        isUserInteractionEnabled = true
        translatesAutoresizingMaskIntoConstraints = false
        //ხაზები რომ არ გამოჩნდეს
        setBackgroundImage(UIImage(), for: .any, barMetrics: .default)
        layer.cornerRadius = 10
        searchTextField.borderStyle = .roundedRect
        searchTextField.layer.borderColor = UIColor.clear.cgColor
        searchTextField.layer.borderWidth = 1
        searchTextField.layer.cornerRadius = 10
    }
}
