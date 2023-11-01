//
//  SceneDelegate.swift
//  Aplicacao
//
//  Created by João PedroVolponi on 31/10/23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        
        let navigation = UINavigationController()
        let coordinator = Coordinator(navigationController: navigation)
        let textAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        
        navigation.navigationBar.barTintColor = .white // o que arrasta
        navigation.navigationBar.barStyle = .default
        navigation.navigationBar.isTranslucent = true
        
        navigation.navigationBar.titleTextAttributes = textAttributes
        coordinator.startHome()
        
        window?.rootViewController = navigation
        window?.makeKeyAndVisible()
        
    }
}
