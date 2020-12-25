//
//  ProductModel.swift
//  SweetShop
//
//  Created by Александр Галкин on 25.12.2020.
//

import Foundation

enum ProductModel: DataStatesProtocol {
    
    typealias Nested = DataStates<ProductData>
    
    internal struct ProductData: Decodable {
        
        var id: Int?
        var price: Float?
        
        internal struct SwetnessData: Decodable {
            var id: Int?
            var name: String?
            var shortDescription: String?
            var description: String?
            var weight: Float?
        }
    }
}
