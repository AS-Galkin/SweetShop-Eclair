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
        guard let request = try? NetworkLoading.shared().request(parameters: parameters, url: url) else {
            return
        }
        let response = try? NetworkLoading.shared().response(urlRequest: request, completion: { (data) in
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
    
    internal func uploadData(parameters: [String : Any], url: String, completion: @escaping (Data) -> Void) {
        
        guard let request = try? NetworkUploading.shared().request(parameters: parameters, url: url) else {return}
        
        let response = try? NetworkUploading.shared().response(urlRequest: request, completion: completion)
    }
    
    internal func savePersonToUserDefaults(fields: [String : String?]) {
        let encodedPerson = NSMutableData()
        
        guard var model = model else {return}
        
        model[0].address = fields["address"]!
        model[0].f_name = fields["f_name"]!
        model[0].s_name = fields["s_name"]!
        model[0].phone = fields["phone"]!
        model[0].birthday = Int(fields["birthday"]! ?? "0")
        model[0].gender = fields["gender"]!

        for i in model {
            guard let encodedJson = try? JSONEncoder().encode(i) else { return }
            encodedPerson.append(encodedJson)
        }
        UserDefaults.standard.set(encodedPerson, forKey: "SavedPerson")
    }
}
