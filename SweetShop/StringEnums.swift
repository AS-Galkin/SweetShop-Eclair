//
//  Icons.swift
//  SweetShop
//
//  Created by Александр Галкин on 03.12.2020.
//

import UIKit

enum Titles: String, CaseIterable {
    case mainTitle = "Главная"
    case userTitle = "Личный кабинет"
    case cartTitle = "Корзина"
    case locationTitle = "Адреса"
    static var allCases: [Titles] {
        return [mainTitle, userTitle, cartTitle, locationTitle]
    }
}

enum Icons: String {
    case mainIcon = "main_icon"
    case userIcon = "user_icon"
    case cartIcon = "cart_icon"
    case locationIcon = "location_icon"
    static var allCases: [Icons] {
        return [mainIcon, userIcon, cartIcon, locationIcon]
    }
}
