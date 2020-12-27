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
        var productData: ProductInit?
        
        internal struct ProductInit: Decodable {
            
            var id: Int?
            var price: String?
            var manufacturer: ManufacturerData?
            var sweetness: SwetnessData?
            
        }
        internal struct ManufacturerData: Decodable {
            var manId: Int?
            var manName: String?
            var manDescription: String?
        }
        
        internal struct SwetnessData: Decodable {
            var swId: Int?
            var swName: String?
            var swDescription: String?
            var swShortDescription: String?
            var swWeight: String?
            var swImage: ImageData?
        }
        
        internal struct ImageData: Decodable {
            var imId: Int?
            var imName: String?
        }
    }
    
}


