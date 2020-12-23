//
//  Downloadable.swift
//  SweetShop
//
//  Created by Александр Галкин on 11.12.2020.
//

import Foundation

protocol Downloadable: class {
    func didReceiveData(data: Any)
}
