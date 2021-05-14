//
//  LocationModel.swift
//  SweetShop
//
//  Created by Александр Галкин on 04.05.2021.
//

import Foundation

enum LocationModel: DataStatesProtocol {
    
    typealias Nested = DataStates<LocationData>
    
    internal struct LocationData: Codable {
        var id: Int?
        var coordinate_latitude: String?
        var coordinate_longitude: String?
        var name: String?
        var open_time: String?
        var close_time: String?
        var phone: String?
    }
}
