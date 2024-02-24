//
//  doctorlistManager.swift
//  celeritasApp
//
//  Created by Muhammad Haris on 20/02/2024.
//

import Foundation
class NetworkService {
    func request(_ endpoint: String, completion: @escaping (Result<Data, Error>) -> Void) {
        guard let url = URL(string: endpoint) else {
            completion(.failure(NetworkError.invalidURL))
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            if let data = data {
                completion(.success(data))
            }
        }.resume()
    }
}

enum NetworkError: Error {
    case invalidURL
}


