//
//  ClassNamePrintable.swift
//  SweetShop
//
//  Created by Александр Галкин on 02.12.2020.
//

import UIKit

protocol Printable {
    var typeName: String {get}
}

extension UIViewController: Printable {
    var typeName: String {
        let type = String(describing: self)
        return type
    }
}
