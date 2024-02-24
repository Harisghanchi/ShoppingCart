//
//  productListViewModel.swift
//  ShoppingCart
//
//  Created by Muhammad Haris on 24/02/2024.
//


import Foundation

class ProductListViewModel {
    private var networkService: NetworkService
    
    init(networkService: NetworkService = NetworkService()) {
        self.networkService = networkService
    }
    
    func fetchProductList(completion: @escaping (Result<productListModel, Error>) -> Void) {

        let apiEndpoint = "https:https://drive.google.com/file/d/19loNC7birAB4mjsFJbZ1GMSLA2gviEf3/view"
        
        networkService.request(apiEndpoint) { result in
            switch result {
            case .success(let data):
                do {
                    let productList = try JSONDecoder().decode(productListModel.self, from: data)
                    completion(.success(productList))
                } catch {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
