//
//  ProductListViewController.swift
//  ShoppingCart
//
//  Created by Muhammad Haris on 24/02/2024.
//

import UIKit

class ProductListViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    
    let viewModel = ProductListViewModel()
    
    var prodListData: productListModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "ProductCollectionViewCell", bundle: nil),forCellWithReuseIdentifier: "ProductCollectionViewCell")
        
        
        
        
        viewModel.fetchProductList { result in
            switch result {
            case .success(let productList):
                //  self.prodListData?.data?.cart  = productList
                
                print(productList)
            case .failure(let error):
                
                print(error)
            }
        }
    }
    
    
}

extension ProductListViewController:UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCollectionViewCell", for: indexPath) as! ProductCollectionViewCell
      
        let data = prodListData?.data?.cart?.products?[indexPath.row]
        cell.productName.text = data?.name
    
        
        if let imageUrl = URL(string: data?.thumb ?? "") {
            let imageDownloader = ImageDownloader()

            imageDownloader.downloadImage(from: imageUrl) { image in
        
                if let image = image {
                 
                    DispatchQueue.main.async {
                        cell.productimage.image = image
                    }
                }
            }
        } else {
            print("Invalid URL")
        }
        return cell
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return prodListData?.data?.cart?.products?.count ?? 0
    }
    

    
    
}

class ImageDownloader {

    func downloadImage(from url: URL, completion: @escaping (UIImage?) -> Void) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            // Check for errors
            guard let data = data, error == nil else {
                print("Error downloading image: \(error?.localizedDescription ?? "Unknown error")")
                completion(nil)
                return
            }
            
            // Check for valid response status code
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                print("Invalid response status code")
                completion(nil)
                return
            }
            
            // Create UIImage from data
            if let image = UIImage(data: data) {
                completion(image)
            } else {
                print("Error creating UIImage from data")
                completion(nil)
            }
            
        }.resume()
    }
}
