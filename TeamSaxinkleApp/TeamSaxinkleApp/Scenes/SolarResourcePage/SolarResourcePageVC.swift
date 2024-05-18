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
        solarResourceView = SolarResourcePageView(delegate: self)
        solarResourceViewModel?.didLoad(delegate: self)
        view = solarResourceView
    }
}

extension SolarResourcePageVC: SolarResourcePageViewModelDelegate {
    func dataFetched(data: SolarData) {
        solarResourceView?.dataFetched(data: data)
    }
    
    func dataDidNotFetch() {
        solarResourceView?.dataDidNotFetch()
    }
}

extension SolarResourcePageVC: PresentableVC {
    func presentView(of solarInformation: SolarInformation) {
        let model = SolarResourceInformationModel(solarInformation: solarInformation)
        let newView = SolarResourceInformationPageView(information: model)
        let newVC = SolarResourceInformationPageVC(solarResourceInformationPageVCView: newView)
        newVC.modalPresentationStyle = .formSheet
        present(newVC, animated: true, completion: nil)
    }
    
    func fetchData(with address: String) {
        solarResourceViewModel?.fetchData(with: address)
    }
}
