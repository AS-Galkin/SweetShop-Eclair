//
//  File.swift
//  SweetShop
//
//  Created by Александр Галкин on 05.03.2021.
//

import Foundation

enum CartModel: DataStatesProtocol {
    typealias Nested = DataStates<CartData>
    
    internal struct CartData: Codable {
        var id: Int?
        var product_id: Int?
        var name: String?
        var short_description: String?
        var description: String?
        var weight: String?
        var price: String?
        var amount: Int?
        var image_name: String?
    }
}

extension CartModel.CartData {
    static func ==(lhs: CartModel.CartData, rhs: CartModel.CartData) -> Bool {
        return lhs.name == rhs.name &&
        lhs.weight == rhs.weight &&
        lhs.price == rhs.price;
    }
}
