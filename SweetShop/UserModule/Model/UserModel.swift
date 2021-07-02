//
//  ProductModel.swift
//  SweetShop
//
//  Created by Александр Галкин on 25.12.2020.
//

import Foundation

enum UserModel: DataStatesProtocol {
    
    typealias Nested = DataStates<UserData>
    
    internal struct UserData: Codable {
        var id: Int?
        var email: String?
        var password: String?
        var password_salt: String?
        var auth_token: String?
        var cookie_key: String?
        var f_name: String?
        var s_name: String?
        var l_name: String?
        var phone: String?
        var gender: String?
        var create_date_time: String?
        var birthday: Int?
        var address: String?
    }
}


