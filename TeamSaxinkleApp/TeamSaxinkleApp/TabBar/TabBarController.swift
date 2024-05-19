//
//  TabBarController.swift
//  TeamSaxinkleApp
//
//  Created by Temur Chitashvili on 17.05.24.
//

import UIKit

final class TabBarController: UITabBarController {
    //MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setTabBar()
        setupTabs()
    }
    
    //MARK: - Tab Setup
    private func setTabBar() {
        tabBar.backgroundColor = .systemGray5
        tabBar.tintColor = .purple
        tabBar.unselectedItemTintColor = .orange
    }
    
    private func setupTabs() {
        let airQualityVC = AirQualityPageVC(airQualityView: AirQualityView(), viewModel: AirQualityViewModel())
        let airQuality = self.createNav(with: "Air Quality", and: .airQuality, vc: airQualityVC)
        
        let weather = self.createNav(with: "Weather", and: .weather, vc: WeatherPageVC())
        
        let speciePageVC = SpeciePageVC(speciePageView: SpeciePageView(), speciePageViewModel: SpeciePageViewModel())
        let speciePage = self.createNav(with: "Discoveries", and: .exploreSpecies, vc: speciePageVC)

        let solarEnergy = self.createNav(with: "Solar Energy", and: .solarEnergy, vc: SolarResourcePageVC())
        
        let populationVC = PopulationPageVC(viewModel: PopulationPageViewModel(), populationView: PopulationPageView())
        let population = self.createNav(with: "Population", and: .population, vc: populationVC)
        setViewControllers([airQuality,weather,speciePage,solarEnergy,population], animated: true)
    }
    
    private func createNav(with title: String, and image: UIImage?, vc: UIViewController) -> UINavigationController {
        let nav = UINavigationController(rootViewController: vc)
        nav.tabBarItem.title = title
        nav.tabBarItem.image = image
        nav.viewControllers.first?.navigationItem.title = title
        return nav
    }
}
