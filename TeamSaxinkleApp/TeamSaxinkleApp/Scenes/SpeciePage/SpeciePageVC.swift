//
//  SpeciePageVC.swift
//  TeamSaxinkleApp
//
//  Created by Temur Chitashvili on 17.05.24.
//

import UIKit


class SpeciePageVC: UIViewController {
    let speciePageView: SpeciePageView
    let speciePageViewModel: SpeciePageViewModel
    init(speciePageView: SpeciePageView, speciePageViewModel: SpeciePageViewModel) {
        self.speciePageView = speciePageView
        self.speciePageViewModel = speciePageViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = speciePageView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
