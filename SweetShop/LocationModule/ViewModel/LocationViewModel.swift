//
//  LocationViewModel.swift
//  SweetShop
//
//  Created by Александр Галкин on 04.05.2021.
//

import Foundation

final class LocationViewModel: ViewModelProtocol {
    var updateData: ((DataStates<[LocationModel.LocationData]>) -> Void)?
    
    func downloadData() {
    }
    
    func downloadJson(parameters: [String : Any], url: String) {
        guard let request = try? NetworkLoading.shared().request(parameters: parameters, url: url) else {return}
        let response = try! NetworkLoading.shared().response(urlRequest: request, completion: { data in
            if let jsonData = try? JSONDecoder().decode([LocationModel.LocationData]?.self, from: data) {
                self.updateData!(.success(jsonData))
            }
        })
    }
    
    
}
