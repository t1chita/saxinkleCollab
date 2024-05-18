//
//  SpinningCircleView.swift
//  TeamSaxinkleApp
//
//  Created by Temur Chitashvili on 18.05.24.
//

import UIKit

final class SpinningCircleView: UIView {
    //MARK: - Properties
    let spinningCircle = CAShapeLayer()
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
        frame = CGRect(x: 0, y: 0, width: 56, height: 56)
        
        let rect = self.bounds
        let circularPath = UIBezierPath(ovalIn: rect)
        
        spinningCircle.path = circularPath.cgPath
        spinningCircle.fillColor = UIColor.clear.cgColor
        spinningCircle.strokeColor = UIColor.purple.withAlphaComponent(0.7).cgColor
        spinningCircle.lineWidth = 6
        spinningCircle.strokeEnd = 0.25
        spinningCircle.lineCap = .round
        
        layer.addSublayer(spinningCircle)
    }
    
    func animate() {
        UIView.animate(withDuration: 1, delay: 0, options: .curveLinear) { [weak self] in
            guard let self = self else { return }
            transform = CGAffineTransform(rotationAngle: .pi)
        } completion: { [weak self] _ in
            guard let self = self else { return }
            UIView.animate(withDuration: 1, delay: 0, options: .curveLinear) { [weak self]  in
                guard let self = self else { return }
                transform = CGAffineTransform(rotationAngle: 0)
            } completion: { [weak self] _ in
                guard let self = self else { return }
                animate()
            }
        }
    }
}


