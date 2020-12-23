//
//  ViewModelProtocol.swift
//  SweetShop
//
//  Created by Александр Галкин on 22.12.2020.
//

import Foundation

protocol ViewModelProtocol {
    associatedtype DataType = Any
    
    var updateData: ((DataType) -> Void)? {get set}
    func downloadData()
    func downloadJson(parameters: [String: Any], url: String)
}
