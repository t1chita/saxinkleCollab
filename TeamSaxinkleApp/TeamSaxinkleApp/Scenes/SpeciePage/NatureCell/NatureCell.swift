//
//  NatureCell.swift
//  TeamSaxinkleApp
//
//  Created by Temur Chitashvili on 17.05.24.
//

import UIKit
import ImageService
class NatureCell: UITableViewCell {
    static let identifier = "NatureCell"
    //MARK: - UIComponents
    private let rectangleView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemBackground
        view.clipsToBounds = true
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.label.cgColor
        view.layer.cornerRadius = 30
        view.layer.masksToBounds = true
        return view
    }()
    
    private let image: UIImageView = {
        let iv = UIImageView()
        iv.clipsToBounds = true
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.layer.cornerRadius = 30
        iv.image = .airQuality
        return iv
    }()
    
    private let nameOfObjectLabel: CustomLabel = {
        let lbl = CustomLabel()
        lbl.font = UIFont.systemFont(ofSize: 14)
        return lbl
    }()
    
    private let nameOfDiscovererLabel: CustomLabel = {
        let lbl = CustomLabel()
        lbl.font = UIFont.systemFont(ofSize: 14)
        return lbl
    }()
    
    private let wikipediaLinkLabel: CustomLabel = {
        let lbl = CustomLabel()
        lbl.font = UIFont.systemFont(ofSize: 12)
        return lbl
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUp()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Configuration
    func configure(imageUrl: String?, objectName: String?, discovererName: String?, wikipediaLink: String?) {
        ImageService.imageService.loadImageFromURL(imageUrl ?? "") { [weak self] image in
            self?.image.image = image
        }
        nameOfObjectLabel.text = objectName
        nameOfDiscovererLabel.text = discovererName
        wikipediaLinkLabel.text = wikipediaLink
    }
    
    //MARK: - Setup UI Components
    private func setUp() {
        setRectangleView()
        setImage()
        setNameOfObjectLabel()
        setNameOfDiscovererLabel()
        setWikipediaLinkLabel()
        selectionStyle = .none
    }
    
    private func setRectangleView() {
        addSubview(rectangleView)
        setConstraintsToRectangleView()
    }
    
    private func setImage() {
        rectangleView.addSubview(image)
        setConstraintsToImage()
    }
    
    private func setNameOfObjectLabel() {
        rectangleView.addSubview(nameOfObjectLabel)
        setConstraintsToNameOfObjectLabel()
    }
    
    private func setNameOfDiscovererLabel() {
        rectangleView.addSubview(nameOfDiscovererLabel)
        setConstraintsToNameOfDiscovererLabel()
    }
    
    private func setWikipediaLinkLabel() {
        rectangleView.addSubview(wikipediaLinkLabel)
        setConstraintsToWikipediaLinkLabel()
    }
    
    //MARK: - Set Constrainst To UI Components
    private func setConstraintsToRectangleView() {
        NSLayoutConstraint.activate([
            rectangleView.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            rectangleView.leadingAnchor.constraint(equalTo: leadingAnchor),
            rectangleView.trailingAnchor.constraint(equalTo: trailingAnchor),
            rectangleView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            rectangleView.heightAnchor.constraint(equalToConstant: 100),
        ])
    }
    
    private func setConstraintsToImage() {
        NSLayoutConstraint.activate([
            image.heightAnchor.constraint(equalToConstant: 80),
            image.widthAnchor.constraint(equalToConstant: 80),
            image.topAnchor.constraint(equalTo: rectangleView.topAnchor, constant: 10),
            image.leadingAnchor.constraint(equalTo: rectangleView.leadingAnchor, constant: 10),
        ])
    }
    
    private func setConstraintsToNameOfObjectLabel() {
        NSLayoutConstraint.activate([
            nameOfObjectLabel.trailingAnchor.constraint(equalTo: rectangleView.trailingAnchor),
            nameOfObjectLabel.topAnchor.constraint(equalTo: rectangleView.topAnchor, constant: 3),
            nameOfObjectLabel.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 10),
        ])
    }
    
    private func setConstraintsToNameOfDiscovererLabel() {
        NSLayoutConstraint.activate([
            nameOfDiscovererLabel.trailingAnchor.constraint(equalTo: rectangleView.trailingAnchor),
            nameOfDiscovererLabel.topAnchor.constraint(equalTo: nameOfObjectLabel.bottomAnchor, constant: 3),
            nameOfDiscovererLabel.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 10),
        ])
    }
    
    private func setConstraintsToWikipediaLinkLabel() {
        NSLayoutConstraint.activate([
            wikipediaLinkLabel.trailingAnchor.constraint(equalTo: rectangleView.trailingAnchor),
            wikipediaLinkLabel.bottomAnchor.constraint(equalTo: rectangleView.bottomAnchor, constant: -3),
            wikipediaLinkLabel.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 10),
        ])
    }
}
