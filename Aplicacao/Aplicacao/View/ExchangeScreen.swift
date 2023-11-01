//
//  ExchangeScreen.swift
//  Aplicacao
//
//  Created by João PedroVolponi on 01/11/23.
//

import Foundation
import UIKit

class ExchangeScreen: UIView {
    
    //MARK: - Elements
    
    lazy var coinsLabel: UILabel = {
        let coinsLabel = UILabel()
        coinsLabel.translatesAutoresizingMaskIntoConstraints = false
        coinsLabel.textColor = .black
        coinsLabel.textAlignment = .left
        coinsLabel.font = UIFont.boldSystemFont(ofSize: 23)
        return coinsLabel
    }()
    
    lazy var variationLabel: UILabel = {
        let variationLabel = UILabel()
        variationLabel.translatesAutoresizingMaskIntoConstraints = false
        variationLabel.textColor = .green
        variationLabel.textAlignment = .left
        variationLabel.font = UIFont.systemFont(ofSize: 20)
        return variationLabel
    }()
    
    lazy var compraLabel: UILabel = {
        let compraLabel = UILabel()
        compraLabel.translatesAutoresizingMaskIntoConstraints = false
        compraLabel.textColor = .black
        compraLabel.font = UIFont.systemFont(ofSize: 15)
        compraLabel.textAlignment = .left
        return compraLabel
    }()
    
    lazy var vendaLabel: UILabel = {
        let vendaLabel = UILabel()
        vendaLabel.translatesAutoresizingMaskIntoConstraints = false
        vendaLabel.textColor = .black
        vendaLabel.font = UIFont.systemFont(ofSize: 15)
        vendaLabel.textAlignment = .left
        return vendaLabel
    }()
    
    lazy var saldoLabel: UILabel = {
        let saldoLabel = UILabel()
        saldoLabel.translatesAutoresizingMaskIntoConstraints = false
        saldoLabel.textColor = .black
        saldoLabel.font = UIFont.systemFont(ofSize: 23)
        saldoLabel.textAlignment = .left
        return saldoLabel
    }()
    
    lazy var caixaLabel: UILabel = {
        let caixaLabel = UILabel()
        caixaLabel.translatesAutoresizingMaskIntoConstraints = false
        caixaLabel.textColor = .black
        caixaLabel.font = UIFont.systemFont(ofSize: 23)
        caixaLabel.textAlignment = .left
        return caixaLabel
    }()
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.addSubview(self.variationLabel)
        stackView.addSubview(self.coinsLabel)
        stackView.addSubview(self.compraLabel)
        stackView.addSubview(self.vendaLabel)
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.alignment = .center
        stackView.layer.borderColor = UIColor.lightGray.cgColor
        stackView.layer.borderWidth = 1
        stackView.layer.cornerRadius = 20
        
        return stackView
    }()
    
    lazy var textField: UITextField = {
        var textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Quantidade"
        textField.layer.borderWidth = 1
        textField.returnKeyType = .done
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.cornerRadius = 15
        textField.textColor = .black
        textField.backgroundColor = .white
        textField.attributedPlaceholder = NSAttributedString(string: "Quantidade", attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        textField.textAlignment = .left
  
        textField.keyboardType = .numberPad

        return textField
    }()
    
    lazy var buttonVender: UIButton = {
        let btnVender = UIButton()
        btnVender.translatesAutoresizingMaskIntoConstraints = false
        btnVender.layer.borderColor = UIColor.white.cgColor
        btnVender.layer.cornerRadius = 8
        btnVender.setTitle("Vender", for: .normal)
        btnVender.setImage(UIImage(named: "sellIcon"), for: .normal)
        btnVender.imageView?.contentMode = .scaleAspectFit
        btnVender.titleEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
        btnVender.tag = 0
        btnVender.backgroundColor = UIColor(hex: "CD3F2C").withAlphaComponent(0.5)
        return btnVender
    }()
    
    lazy var buttonComprar: UIButton = {
        let btnComprar = UIButton()
        btnComprar.translatesAutoresizingMaskIntoConstraints = false
        btnComprar.layer.borderColor = UIColor.white.cgColor
        btnComprar.layer.cornerRadius = 8
        btnComprar.setTitle("Comprar", for: .normal)
        btnComprar.setImage(UIImage(named: "buyIcon"), for: .normal)
        btnComprar.imageView?.contentMode = .scaleAspectFit
        btnComprar.titleEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
        btnComprar.tag = 1
        btnComprar.setTitleColor(UIColor(hex: "35373C"), for: .normal)
        btnComprar.backgroundColor = UIColor(hex: "2CCD4F").withAlphaComponent(0.5)
        return btnComprar
    }()
    
    lazy var stackViewButton: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.addArrangedSubview(self.buttonVender)
        stack.addArrangedSubview(self.buttonComprar)
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.alignment = .center
        return stack
    }()
    
    lazy var body: UIView = {
        let body = UIView()
        body.translatesAutoresizingMaskIntoConstraints = false
        body.addSubview(self.stackView)
        body.addSubview(self.saldoLabel)
        body.addSubview(self.caixaLabel)
        body.addSubview(self.textField)
        body.addSubview(self.stackViewButton)
        return body
    }()
    
    //MARK: - Contructs
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(body)
        self.configConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Methods
    
    public func changeLabels(coins: String, variation: String, compra: String, venda: String, saldo: String, caixa: String, color: UIColor){
        self.coinsLabel.text = coins
        self.variationLabel.text = variation
        self.variationLabel.textColor = color
        self.compraLabel.text = compra
        self.vendaLabel.text = venda
        self.saldoLabel.text = saldo
        self.caixaLabel.text = caixa

    }
    
    func configConstraints() {
        NSLayoutConstraint.activate([
        
            //body
            self.body.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            self.body.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
            self.body.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            self.body.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
            
            //StackView
            self.stackView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            self.stackView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            self.stackView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor,constant: -20),
            self.stackView.bottomAnchor.constraint(equalTo: self.vendaLabel.bottomAnchor, constant: 20), //a
        
            //MoedaLabel
            self.coinsLabel.topAnchor.constraint(equalTo: self.stackView.topAnchor),
            self.coinsLabel.bottomAnchor.constraint(equalTo: self.variationLabel.topAnchor),
            self.coinsLabel.leadingAnchor.constraint(equalTo: self.stackView.leadingAnchor, constant: 20),
            self.coinsLabel.trailingAnchor.constraint(equalTo: self.stackView.trailingAnchor),
            self.coinsLabel.heightAnchor.constraint(equalToConstant: 50),
            
            //VariaçãoLabel
            self.variationLabel.topAnchor.constraint(equalTo: self.coinsLabel.bottomAnchor),
            self.variationLabel.bottomAnchor.constraint(equalTo: self.compraLabel.topAnchor),
            self.variationLabel.leadingAnchor.constraint(equalTo: self.stackView.leadingAnchor, constant: 20),
            self.variationLabel.trailingAnchor.constraint(equalTo: self.stackView.trailingAnchor),
            self.variationLabel.heightAnchor.constraint(equalToConstant: 40),
            
            //CompraLabel
            self.compraLabel.topAnchor.constraint(equalTo: self.variationLabel.bottomAnchor),
            self.compraLabel.bottomAnchor.constraint(equalTo: self.vendaLabel.topAnchor),
            self.compraLabel.leadingAnchor.constraint(equalTo: self.stackView.leadingAnchor, constant: 20),
            self.compraLabel.trailingAnchor.constraint(equalTo: self.stackView.trailingAnchor),
            self.compraLabel.heightAnchor.constraint(equalToConstant: 30),
            
            //VendaLabel
            self.vendaLabel.topAnchor.constraint(equalTo: self.compraLabel.bottomAnchor),
            self.vendaLabel.bottomAnchor.constraint(equalTo: self.stackView.bottomAnchor, constant: 20),
            self.vendaLabel.leadingAnchor.constraint(equalTo: self.stackView.leadingAnchor, constant: 20),
            self.vendaLabel.trailingAnchor.constraint(equalTo: self.stackView.trailingAnchor),
            self.vendaLabel.heightAnchor.constraint(equalToConstant: 30),
            
            //SaldoLabel
            self.saldoLabel.topAnchor.constraint(equalTo: self.stackView.bottomAnchor, constant: 40),
            self.saldoLabel.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            self.saldoLabel.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            self.saldoLabel.bottomAnchor.constraint(equalTo: self.caixaLabel.topAnchor, constant: -20),
            
            //CaixaLabel
            self.caixaLabel.topAnchor.constraint(equalTo: self.saldoLabel.bottomAnchor),
            self.caixaLabel.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            self.caixaLabel.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            self.caixaLabel.bottomAnchor.constraint(equalTo: self.textField.topAnchor, constant: -20),
            
            //TextField
            self.textField.topAnchor.constraint(equalTo: self.caixaLabel.bottomAnchor),
            self.textField.heightAnchor.constraint(equalToConstant: 60),
            self.textField.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            self.textField.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            
            //StackView (Botões)
            self.stackViewButton.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            self.stackViewButton.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            self.stackViewButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            self.stackViewButton.heightAnchor.constraint(equalToConstant: 50),
            
            //BotaoVender
            self.buttonVender.topAnchor.constraint(equalTo: self.stackViewButton.topAnchor),
            self.buttonVender.bottomAnchor.constraint(equalTo: self.stackViewButton.bottomAnchor),
            self.buttonVender.leadingAnchor.constraint(equalTo: self.stackViewButton.leadingAnchor),
            self.buttonVender.trailingAnchor.constraint(equalTo: self.buttonComprar.leadingAnchor, constant: -20),

            
            //BotaoComprar
            self.buttonComprar.topAnchor.constraint(equalTo: self.stackViewButton.topAnchor),
            self.buttonComprar.bottomAnchor.constraint(equalTo: self.stackViewButton.bottomAnchor),
            self.buttonComprar.leadingAnchor.constraint(equalTo: self.buttonVender.trailingAnchor),
            self.buttonComprar.trailingAnchor.constraint(equalTo: self.stackViewButton.trailingAnchor),

        ])
    }
}

    //Formatador Hexadecimal em UIColor
extension UIColor {
    convenience init(hex: String, alpha: CGFloat = 1.0) {
        var hexFormatted: String = hex.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).uppercased()

        if hexFormatted.hasPrefix("#") {
            hexFormatted.remove(at: hexFormatted.startIndex)
        }

        assert(hexFormatted.count == 6, "Cor hexadecimal inválida")

        var rgbValue: UInt64 = 0
        Scanner(string: hexFormatted).scanHexInt64(&rgbValue)

        self.init(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: alpha
        )
    }
}
