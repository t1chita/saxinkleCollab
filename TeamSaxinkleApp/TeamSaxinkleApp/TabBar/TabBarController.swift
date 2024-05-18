//
//  TabBarController.swift
//  TeamSaxinkleApp
//
//  Created by Temur Chitashvili on 17.05.24.
//

import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTabBar()
        setupTabs()
    }
    
    //MARK: - Tab Setup
    
    private func setTabBar() {
        tabBar.backgroundColor = .black.withAlphaComponent(0.7)
        tabBar.tintColor = .purple
        tabBar.unselectedItemTintColor = .orange
    }
    
    private func setupTabs() {
        let airQuality = self.createNav(with: "Air Quality", and: .airQuality, vc: AirQualityPageVC())
        
        let weather = self.createNav(with: "Weather", and: .weather, vc: WeatherPageVC())
        
        let speciePage = self.createNav(with: "Discoveries", and: .exploreSpecies, vc: SpeciePageVC())
        
        let solarEnergy = self.createNav(with: "Solar Energy", and: .solarEnergy, vc: SolarResourcePageVC())
        
        let population = self.createNav(with: "Population", and: .population, vc: PopulationPageVC())
        
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
