//
//  BuyAndSellViewController.swift
//  Aplicacao
//
//  Created by João PedroVolponi on 01/11/23.
//

import Foundation
import UIKit

class BuyAndSellViewController: UIViewController {

    //MARK: - Attributes
    
    var screenBuyAndSell: BuyAndSellScreen?
    var titleScreen: String?
    var labelText: String?
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func loadView() {
        screenBuyAndSell = BuyAndSellScreen()
        self.view = screenBuyAndSell
    }
    
    override func viewWillAppear(_ animated: Bool) {
        title = self.titleScreen
        view.backgroundColor = .white
        
        screenBuyAndSell?.labelFinal.text = labelText
        
        self.screenBuyAndSell?.changeData(label: labelText ?? "")
        self.screenBuyAndSell?.buttonHome.addTarget(self, action: #selector(tappedBackHome), for: .touchUpInside)
    }
    
    //MARK: - Methods
   
    @objc func tappedBackHome(){
        let coordinator = Coordinator(navigationController: navigationController ?? nil)
        coordinator.returnRootViewController()
    }
    
    
}


