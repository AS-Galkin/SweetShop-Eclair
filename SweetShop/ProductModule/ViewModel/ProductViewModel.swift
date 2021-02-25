//
//  ProductViewModel.swift
//  SweetShop
//
//  Created by Александр Галкин on 25.12.2020.
//

import Foundation
import UIKit

final class ProductViewModel: ViewModelProtocol {
    
    
    weak var delegate: Downloadable?
    
    typealias DataType = DataStates<[ProductModel.ProductData]>
    
    var updateData: ((DataStates<[ProductModel.ProductData]>) -> Void)?
    
    var model: [ProductModel.ProductData]?
    
    var updateImages: (([UIImage]) -> Void)?
    
    init () {
        updateData?(.initial)
    }
    
    func downloadData() {
    }
    
    func downloadJson(parameters: [String : Any], url: String) {
        //let network: Network = Network()
        guard let request = try? Network.shared().request(parameters: parameters, url: url) else {return}
        let response = try? Network.shared().response(urlRequest: request) { (data) in
            let decoder = JSONDecoder()
            self.model = try? decoder.decode([ProductModel.ProductData]?.self, from: data) as [ProductModel.ProductData]?
            
            var images: [UIImage] = []
            
            if let model = self.model {
                for i in model {
                    let imageURL = URL(string: URIString.downloadURL.rawValue + (i.productData?.sweetness?.swImage?.imName)!)!
                    print(imageURL)
                    let image = try? UIImage(data: Data(contentsOf: imageURL))
                    if let image = image {
                        images.append(image)
                    }
                }
                
                DispatchQueue.main.async {[weak self] in
                    self?.updateData?(.success(model))
                    self?.updateImages?(images)
                }
            }
        }
    }
}
