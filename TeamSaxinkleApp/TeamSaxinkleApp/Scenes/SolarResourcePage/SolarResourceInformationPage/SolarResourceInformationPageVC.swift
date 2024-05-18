//
//  SolarResourceInformationPageVC.swift
//  TeamSaxinkleApp
//
//  Created by nuca on 18.05.24.
//

import UIKit

//view-სთან გატოლება რომ შევძლო
protocol SolarResourceInformationPageVCDelegate: UIView {
    
}

final class SolarResourceInformationPageVC: UIViewController {
    //MARK: - Properties
    var solarResourceInformationPageVCView: SolarResourceInformationPageVCDelegate
    
    //MARK: - initialisers
    init(solarResourceInformationPageVCView: SolarResourceInformationPageVCDelegate) {
        self.solarResourceInformationPageVCView = solarResourceInformationPageVCView
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view = solarResourceInformationPageVCView
    }
}
