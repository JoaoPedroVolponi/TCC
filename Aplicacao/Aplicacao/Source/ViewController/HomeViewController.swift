//
//  HomeViewController.swift
//  Aplicacao
//
//  Created by João PedroVolponi on 01/11/23.
//

import Foundation
import UIKit

class HomeViewController: UIViewController {
    
    //MARK: - Attributes
    
    let viewModel: ExchangeViewModel = ExchangeViewModel()
    var screenHome: HomeScreen?
    var screenExchange: ExchangeScreen?
    var wallet = Wallet()
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel.delegate(delegate: self)
    }
    
    override func loadView() {
        self.screenHome = HomeScreen()
        self.view = screenHome
        view.backgroundColor = .white
        title = "Moedas"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // View (Titulo)
        let titleView = UIView()
        
        // Imagem (Titulo)
        let iconImage = UIImage(named: "$Icone")
        let iconImageView = UIImageView(image: iconImage)
        iconImageView.contentMode = .scaleAspectFit
        titleView.addSubview(iconImageView)
        
        // Restrições
        let titleLabel = UILabel()
        titleLabel.text = "Moedas"
        titleLabel.textColor = .black
        titleLabel.textAlignment = .left
        titleView.addSubview(titleLabel)
        
        // Constraints
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            iconImageView.leadingAnchor.constraint(equalTo: titleView.leadingAnchor),
            iconImageView.centerYAnchor.constraint(equalTo: titleView.centerYAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 8),
            titleLabel.centerYAnchor.constraint(equalTo: titleView.centerYAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: titleView.trailingAnchor)
        ])
        
        navigationItem.titleView = titleView
        
        self.viewModel.request()
    }
}

//MARK: - TableView
extension HomeViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.returnCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: ExchangeTableViewCell.identifier, for: indexPath) as? ExchangeTableViewCell
        cell?.changeExchangeCell(exchange: self.viewModel.returnSigla(indexPath: indexPath.row))
        cell?.changeVaritionCell(varition: self.viewModel.returnVariationPercent(indexPath: indexPath.row), color: self.viewModel.returnVariationColor(indexPath: indexPath.row))
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let coordinator = Coordinator(navigationController: navigationController ?? nil)
        let rootExchange: ExchangeViewController = ExchangeViewController()
        
        coordinator.routeView(tableView, rootExchange, indexPath, viewModel, wallet)
        coordinator.goToBuyAndSellView(exchangeViewController: rootExchange)

    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 20
    }
}

//MARK: - Delegate: ExchangeViewModelDelegate
extension HomeViewController: ExchangeViewModelDelegate{
    func success() {
        self.screenHome?.delegateTableView(delegate: self, dataSource: self)
        self.screenHome?.tableView.reloadData()
    }
    
    func error(mensage: String) {
        print("Deu ruim")
    }
}
