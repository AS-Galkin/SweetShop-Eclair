//
//  UserViewModel.swift
//  SweetShop
//
//  Created by Александр Галкин on 25.02.2021.
//

import UIKit
import Foundation

final class UserViewModel: ViewModelProtocol {
    
    var updateData: ((DataStates<[UserModel.UserData]>) -> Void)?
    var model: [UserModel.UserData]?
    var modelData: Data?
    
    init() {
        updateData?(.initial)
    }
    
    func downloadData() {
    }
    
    func downloadJson(parameters: [String : Any], url: String) {
        guard let request = try? Network.shared().request(parameters: parameters, url: url) else {
            return
        }
        let response = try? Network.shared().response(urlRequest: request, completion: { (data) in
            self.modelData = data
            let decoder = JSONDecoder()
            self.model = try? decoder.decode([UserModel.UserData]?.self, from: data) as [UserModel.UserData]?
        })
        DispatchQueue.main.async {[weak self] in
            if let model = self?.model {
                if !model.isEmpty {
                    self?.updateData?(.success(model))
                } else {
                    self?.updateData?(.failure(model))
                }
            }
        }
    }
}
