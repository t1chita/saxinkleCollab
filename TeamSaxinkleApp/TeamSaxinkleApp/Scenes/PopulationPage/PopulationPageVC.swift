//
//  PopulationPageVC.swift
//  TeamSaxinkleApp
//
//  Created by Temur Chitashvili on 17.05.24.
//



import UIKit

final class PopulationPageVC: UIViewController {
    
    // MARK: - Properties
    
    private var viewModel = PopulationPageViewModel()
    private var populationView = PopulationPageView()
    
    // MARK: - Life Cycle
    
    override func loadView() {
        self.view = populationView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        populationView.fetchButton.addTarget(self, action: #selector(fetchPopulation), for: .touchUpInside)
        
        viewModel.populationData = { [weak self] todayPopulationString, tomorrowPopulationString in
            DispatchQueue.main.async {
                self?.populationView.todaysPopulationValueLabel.text = todayPopulationString
                self?.populationView.tomorrowsPopulationValueLabel.text = tomorrowPopulationString
            }
        }
        
        viewModel.onError = { [weak self] errorMessage in
            DispatchQueue.main.async {
                self?.presentAlert(title: "Error", message: errorMessage)
            }
        }
    }
    
    // MARK: - Fetch Population
    
    @objc private func fetchPopulation() {
        guard let country = populationView.countryTextField.text, !country.isEmpty else {
            presentAlert(title: "არიქცევი სწორად", message: "შეიყვანე  ქვეყანა!!!!!!!.")
            return
        }
        viewModel.fetchPopulation(for: country)
    }
    
    // MARK: - Alert Presentation
    
    private func presentAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "ბოდიში", style: .default, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
}
