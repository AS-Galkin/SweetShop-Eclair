//
//  ProductViewModel.swift
//  SweetShop
//
//  Created by Александр Галкин on 25.12.2020.
//

import Foundation
final class ProductViewModel: ViewModelProtocol {
    
    weak var delegate: Downloadable?
    
    typealias DataType = DataStates<[ProductModel.ProductData]>
    
    var updateData: ((DataStates<[ProductModel.ProductData]>) -> Void)?
    
    init () {
        updateData?(.initial)
    }
    
    func downloadData() {
    }
    
    func downloadJson(parameters: [String : Any], url: String) {
        let network: Network = Network()
        guard let request = try? network.request(parameters: parameters, url: url) else {return}
        let response = try? network.response(urlRequest: request) { (data) in
            let decoder = JSONDecoder()
            print(String(data: data, encoding: .utf8))
            let model = try! decoder.decode([ProductModel.ProductData]?.self, from: data) as [ProductModel.ProductData]?
            print(model)
            //var images: [UIImage] = []
            
            //                DispatchQueue.main.async {[weak self] in
            //                    self?.updateData?(.success(model))
            //                    self?.updateImage?(images)
            //                }
        }
        
        
    }
}
