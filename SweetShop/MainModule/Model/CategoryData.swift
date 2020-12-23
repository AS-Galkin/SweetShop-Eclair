//
//  Category.swift
//  SweetShop
//
//  Created by Александр Галкин on 11.12.2020.
//

import Foundation

enum CategoryData: DataStatesProtocol {
    
    typealias Nested = DataStates<Data>
    
    internal struct Data {
        var id: String?
        var name: String?
        var description: String?
        var image: String?
    }
}

class CategoryModel {
    weak var delegate: Downloadable?
    
}

//extension Category {
//    func getAllProperties() throws -> [String: Any] {
//        var result: [String: Any] = [:]
//        let mirror = Mirror(reflecting: self)
//        guard let style = mirror.displayStyle, style == .struct || style == .class else {
//            return NSError(domain: "human.io", code: 1, userInfo: nil) as! [String : Any]
//        }
//        for (leftValue, rightValue) in mirror.children {
//            guard let leftValue = leftValue else {
//                continue
//            }
//            result[leftValue] = rightValue
//        }
//        return result
//    }
//}
