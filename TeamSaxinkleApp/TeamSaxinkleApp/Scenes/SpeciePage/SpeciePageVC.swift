//
//  SpeciePageVC.swift
//  TeamSaxinkleApp
//
//  Created by Temur Chitashvili on 17.05.24.
//

import UIKit


class SpeciePageVC: UIViewController {
    let speciePageView = SpeciePageView()
    let speciePageViewModel = SpeciePageViewModel()
    
    override func loadView() {
        view = speciePageView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
