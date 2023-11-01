//
//  ProtocolViewModel.swift
//  Aplicacao
//
//  Created by João PedroVolponi on 01/11/23.
//

import Foundation

protocol ExchangeViewModelDelegate: AnyObject {
    
    func success()
    func error(mensage: String)
}

