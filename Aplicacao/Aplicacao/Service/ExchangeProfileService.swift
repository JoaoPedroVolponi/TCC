//
//  ExchangeProfileService.swift
//  Aplicacao
//
//  Created by João PedroVolponi on 01/11/23.
//

import Foundation

enum ServiceError: Error {
    case noData
}

class ExchangeProfileService{
    
    func getExchange(completion: @escaping (Result<ExchangeGroup, Error>) -> Void) {
        
        guard let url = URL(string: "https://api.hgbrasil.com/finance?key=748e24c7") else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            DispatchQueue.main.async {
                
                guard let data = data else {
                    completion(.failure(error ?? ServiceError.noData))
                    return
                }
                
                do {
                    let object = try JSONDecoder().decode(ExchangeGroup.self, from: data)
                    completion(.success(object))
                    print(object)
                } catch {
                    completion(.failure(error))
                    Logger.log("Falha ao decodificar os dados")
                    print(error)
                }
            }
        }.resume()
    }
}
