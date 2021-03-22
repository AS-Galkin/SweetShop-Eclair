//
//  Tints.swift
//  SweetShop
//
//  Created by Александр Галкин on 17.03.2021.
//

import Foundation
import UIKit

extension UIColor {
    static var mainColor: UIColor { return UIColor(red: 88/255, green: 46/255, blue: 165/255, alpha: 1)}
    static var mainColorWithAplha: UIColor { return UIColor(red: 88/255, green: 46/255, blue: 165/255, alpha: 0.7)}
    static var alnileBoldColor: UIColor {return UIColor(red: 173/255, green: 173/255, blue: 173/255, alpha: 1)}
    static var cartCellColor: UIColor {return UIColor(red: 243/255, green: 180/255, blue: 196/255, alpha: 0.4)}
    static var buttonCellColor: UIColor {return UIColor(red: 173/255, green: 189/255, blue: 230/255, alpha: 1)}
    static var textFieldGray: UIColor {return UIColor(red: 230/255, green: 230/255, blue: 230/255, alpha: 1)}
}

extension UIFont {
    static var emptyCartFont: UIFont { return UIFont(name: "ChalkboardSE-Bold", size: 22) ?? UIFont()}
}
