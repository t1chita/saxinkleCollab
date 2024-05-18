//
//  SpeciePageVC.swift
//  TeamSaxinkleApp
//
//  Created by Temur Chitashvili on 17.05.24.
//

import UIKit

protocol ReloadTableViewDelegate: AnyObject {
    func reloadData()
}

class SpeciePageVC: UIViewController {
    //MARK: Properties-
    let speciePageView = SpeciePageView()
    let speciePageViewModel = SpeciePageViewModel()
    
    override func loadView() {
        view = speciePageView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getDelegatesFromViewToViewModel()
        getDelegatesFromViewAndViewModel()
    }
    
    //MARK: Get Delegates From ViewModel And View
    private func getDelegatesFromViewAndViewModel() {
        speciePageViewModel.reloadTableViewDelegate = speciePageView
        speciePageView.natureTableView.dataSource = self
    }
    
    //MARK: Get Data From ViewModel
    private func getDelegatesFromViewToViewModel() {
        speciePageView.viewModelLoadDelegate = speciePageViewModel
    }
}

//MARK: TableView DataSource Extensions
extension SpeciePageVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        speciePageViewModel.natureArrayCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: NatureCell.identifier, for: indexPath) as? NatureCell else { return UITableViewCell() }
        cell.configure(imageUrl: speciePageViewModel.natureArray[indexPath.row].taxon?.defaultPhoto?.url,
                       objectName: speciePageViewModel.natureArray[indexPath.row].taxon?.name,
                       discovererName: speciePageViewModel.natureArray[indexPath.row].taxon?.defaultPhoto?.attribution,
                       wikipediaLink: speciePageViewModel.natureArray[indexPath.row].taxon?.wikipediaUrl)
        return cell
    }
}


