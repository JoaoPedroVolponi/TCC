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

    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
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
        
        // Label (Titulo)
        let titleLabel = UILabel()
        titleLabel.text = "Moedas"
        titleLabel.textColor = .black
        titleLabel.textAlignment = .left
        titleView.addSubview(titleLabel)
        
        // Restrições
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // Constraints
        NSLayoutConstraint.activate([
            iconImageView.leadingAnchor.constraint(equalTo: titleView.leadingAnchor),
            iconImageView.centerYAnchor.constraint(equalTo: titleView.centerYAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 8),
            titleLabel.centerYAnchor.constraint(equalTo: titleView.centerYAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: titleView.trailingAnchor)
        ])
        
        navigationItem.titleView = titleView
    }
}
