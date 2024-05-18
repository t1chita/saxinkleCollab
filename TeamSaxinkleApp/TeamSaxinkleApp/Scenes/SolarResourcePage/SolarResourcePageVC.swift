//
//  SolarResourcePageVC.swift
//  TeamSaxinkleApp
//
//  Created by Temur Chitashvili on 17.05.24.
//

import UIKit
//start working

protocol SolarResourcePageVCViewModelDelegate: SolarResourcePageViewDelegate {
    func didLoad(delegate: SolarResourcePageViewModelDelegate)
}

protocol SolarResourcePageVCViewDelegate: UIView, SolarResourcePageViewModelDelegate {
    
}

class SolarResourcePageVC: UIViewController {
    //MARK: - Properties
    var solarResourceView: SolarResourcePageVCViewDelegate?
    var solarResourceViewModel: SolarResourcePageVCViewModelDelegate?
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        solarResourceViewModel = SolarResourcePageViewModel()
        solarResourceView = SolarResourcePageView(delegate: solarResourceViewModel!)
        solarResourceViewModel?.didLoad(delegate: solarResourceView!)
        view = solarResourceView
    }
}
