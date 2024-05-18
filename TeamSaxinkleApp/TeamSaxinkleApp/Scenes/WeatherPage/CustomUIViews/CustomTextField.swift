//
//  CustomTextField.swift
//  TeamSaxinkleApp
//
//  Created by gvantsa gvagvalia on 5/17/24.
//

import UIKit

class CustomTextField: UITextField {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configure()
    }
    
    func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        font = UIFont.boldSystemFont(ofSize: 14)
        layer.cornerRadius = 20
        layer.borderWidth = 1.0
        leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: frame.height))
        leftViewMode = .always
        borderStyle = .none
        layer.borderColor = UIColor.label.cgColor
        backgroundColor = .quaternarySystemFill
        textColor = .label
        updatePlaceholderColor()
    }
    
    func updatePlaceholderColor() {
        let placeholderColor: UIColor = {
            if traitCollection.userInterfaceStyle == .dark {
                return UIColor.lightGray
            } else {
                return UIColor.darkGray
            }
        }()
        attributedPlaceholder = NSAttributedString(string: placeholder ?? "", attributes: [NSAttributedString.Key.foregroundColor: placeholderColor])
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        if previousTraitCollection?.userInterfaceStyle != traitCollection.userInterfaceStyle {
            updatePlaceholderColor()
        }
    }
}
