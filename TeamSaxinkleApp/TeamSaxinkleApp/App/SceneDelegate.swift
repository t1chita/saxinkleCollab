//
//  SceneDelegate.swift
//  TeamSaxinkleApp
//
//  Created by Temur Chitashvili on 17.05.24.
//
import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: scene)
        let speciePageVC = SpeciePageVC(speciePageView: SpeciePageView(), speciePageViewModel: SpeciePageViewModel())
        let navigatorController = UINavigationController(rootViewController: speciePageVC)
        window?.rootViewController = navigatorController
        window?.makeKeyAndVisible()
    }
}


