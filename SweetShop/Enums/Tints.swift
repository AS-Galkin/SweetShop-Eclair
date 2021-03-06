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
    static var cartCellColor: UIColor {return UIColor(red: 234/255, green: 207/255, blue: 179/255, alpha: 0.9)}
    static var buttonCellColor: UIColor {return UIColor(red: 245/255, green: 66/255, blue: 96/255, alpha: 0.6)}
    static var textFieldGray: UIColor {return UIColor(red: 230/255, green: 230/255, blue: 230/255, alpha: 1)}
    static var categoryCollectionLayerColor: UIColor {return UIColor(red: 88/255, green: 46/255, blue: 165/255, alpha: 0.2)}
}

extension UIFont {
    static var emptyCartFont: UIFont { return UIFont(name: "ChalkboardSE-Bold", size: 22) ?? UIFont()}
    static var categoryFont: UIFont { return UIFont(name: "Copperplate", size: 16) ?? UIFont()}
    static var sortFont: UIFont { return UIFont(name: "AppleSDGothicNeo-Regular", size: 18) ?? UIFont()}
    static var lostPasswdFont: UIFont {return UIFont(name: "AlNile", size: 17) ?? UIFont()}
    static var tableHeaderFont: UIFont {return UIFont(name: "AlNile-Bold", size: 13) ?? UIFont()}
}
