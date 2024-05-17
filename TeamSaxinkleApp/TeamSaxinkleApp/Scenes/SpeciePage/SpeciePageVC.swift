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
        getDelegatesFromView()
    }
    
    
    private func getDelegatesFromView() {
        speciePageView.natureTableView.dataSource = self
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



extension SpeciePageVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: NatureCell.identifier, for: indexPath) as? NatureCell else { return UITableViewCell() }
        
        return cell
    }
    
    
}



extension SpeciePageVC: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        
    }
}


