//
//  SpeciePageVC.swift
//  TeamSaxinkleApp
//
//  Created by Temur Chitashvili on 17.05.24.
//

import UIKit


class SpeciePageVC: UIViewController {
    //MARK: UIComponents-
    let searchController = UISearchController(searchResultsController: nil)
    //MARK: Properties-
    let speciePageView = SpeciePageView()
    let speciePageViewModel = SpeciePageViewModel()
    
    override func loadView() {
        view = speciePageView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSearchController()
        getData()
    }
    
    
    //MARK: Get Data From ViewModel
    
    private func getData() {
        speciePageViewModel.didLoad()
    }
    //MARK: setup Navigation SearchController
    private func setupSearchController() {
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.searchBar.placeholder = "Search City"
        
        navigationItem.searchController = searchController
        definesPresentationContext = false
        navigationItem.hidesSearchBarWhenScrolling = false
    }
}


extension SpeciePageVC: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        
    }
}
