//
//  CustomLabel.swift
//  TeamSaxinkleApp
//
//  Created by gvantsa gvagvalia on 5/17/24.
//

import UIKit

final class CustomLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureLabel()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureLabel() {
        translatesAutoresizingMaskIntoConstraints = false
        textAlignment = .left
        font = UIFont.systemFont(ofSize: 16)
        textColor = .label
        numberOfLines = 0
    }
}
