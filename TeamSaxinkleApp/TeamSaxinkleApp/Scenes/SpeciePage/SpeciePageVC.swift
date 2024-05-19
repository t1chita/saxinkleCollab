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

protocol SpinningCircleViewDelegate: AnyObject {
    func animateSpinningCircle()
    func stopAnimatingSpinningCircle()
}
protocol AlertDelegate: AnyObject {
    func presentAlert()
}

final class SpeciePageVC: UIViewController {
    //MARK: Properties-
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
        getDelegatesFromViewToViewModel()
        getDelegatesFromViewAndViewModel()
    }
    
    //MARK: Get Delegates From ViewModel And View
    private func getDelegatesFromViewAndViewModel() {
        speciePageViewModel.reloadTableViewDelegate = speciePageView
        speciePageViewModel.spinningCircleViewDelegate = self
        speciePageViewModel.alertDelegate = self
        speciePageView.natureTableView.dataSource = self
    }
    
    //MARK: Get Data From ViewModel
    private func getDelegatesFromViewToViewModel() {
        speciePageView.viewModelLoadDelegate = speciePageViewModel
    }
}

//MARK: Handle AlertAction
extension SpeciePageVC: AlertDelegate {
     func presentAlert() {
        let alertController = UIAlertController(title: "არასწორი ინფო", message: "გაჩე ბიჭო,თავიდან!", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "ბოდიში", style: .default, handler: nil)
        alertController.addAction(cancelAction)
        present(alertController, animated: true, completion: nil)
    }
}

//MARK: Handle Spinning Circle
extension SpeciePageVC: SpinningCircleViewDelegate {
    func animateSpinningCircle() {
        speciePageView.spinningCircleView.animate()
        speciePageView.spinningCircleView.isHidden = false
    }
    
    func stopAnimatingSpinningCircle() {
        speciePageView.spinningCircleView.isHidden = true
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


