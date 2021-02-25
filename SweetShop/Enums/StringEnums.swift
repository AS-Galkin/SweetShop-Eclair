//
//  Icons.swift
//  SweetShop
//
//  Created by Александр Галкин on 03.12.2020.
//

import UIKit

enum Titles: String, CaseIterable {
    case categoryTitle = "Главная"
    case userTitle = "Личный кабинет"
    case cartTitle = "Корзина"
    case locationTitle = "Адреса"
    static var allCases: [Titles] {
        return [categoryTitle, userTitle, cartTitle, locationTitle]
    }
}

enum Icons: String {
    case categoryIcon = "category_icon"
    case userIcon = "user_icon"
    case cartIcon = "cart_icon"
    case locationIcon = "location_icon"
    case settingsIcon = "settings"
    case profileIcon = "profile"
    static var allCases: [Icons] {
        return [categoryIcon, userIcon, cartIcon, locationIcon]
    }
}


