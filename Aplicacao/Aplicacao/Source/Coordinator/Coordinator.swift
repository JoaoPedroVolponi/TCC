//
//  Coordinator.swift
//  Aplicacao
//
//  Created by João PedroVolponi on 01/11/23.
//

import Foundation
import UIKit

public protocol CoordinatorProtocol: AnyObject{
    
    func startHome()
    func goToBuyAndSellView(exchangeViewController: UIViewController)
    func goToCongratulation(buyAndSellViewController: UIViewController)
}

class Coordinator: CoordinatorProtocol {
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController?) {
        
        self.navigationController = navigationController ?? UINavigationController()
    }
    
    //MARK: - HOME
    func startHome() {
        
        let homeViewController = HomeViewController()
        navigationController.pushViewController(homeViewController, animated: true)
    }
    
}
