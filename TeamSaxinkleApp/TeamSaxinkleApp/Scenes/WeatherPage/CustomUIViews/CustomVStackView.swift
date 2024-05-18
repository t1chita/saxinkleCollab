//
//  CustomVStackView.swift
//  TeamSaxinkleApp
//
//  Created by gvantsa gvagvalia on 5/18/24.
//

import UIKit

class CustomVStackView: UIStackView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        configure()
    }
    
    func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        axis = .vertical
        spacing = 0
        distribution = .fillProportionally
        backgroundColor = .lightGray
    }

}
