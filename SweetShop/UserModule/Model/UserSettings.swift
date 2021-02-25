//
//  UserSettings.swift
//  SweetShop
//
//  Created by Александр Галкин on 19.02.2021.
//

import Foundation

final class UserSettings {
    
    private enum SettingsKeys: String {
        case userName
    }
    
    static var userName: String! {
        get {
            return UserDefaults.standard.string(forKey: SettingsKeys.userName.rawValue)
        } set {
            let defaults = UserDefaults.standard
            if let name = newValue {
                defaults.set(name, forKey: SettingsKeys.userName.rawValue)
            } else {
                defaults.removeSuite(named: SettingsKeys.userName.rawValue)
            }
        }
    }
    
}
