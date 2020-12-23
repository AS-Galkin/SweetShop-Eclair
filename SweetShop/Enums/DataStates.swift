//
//  DataStates.swift
//  SweetShop
//
//  Created by Александр Галкин on 11.12.2020.
//

//MARK: - Состояния для viewModel о состоянии модели. Связывание через связанные типы.
import Foundation

enum DataStates<T>: DataStatesProtocol {
    typealias Nested = DataStates<T>
    
    case initial
    case loading(T)
    case success(T)
    case failure(T)
}

protocol DataStatesProtocol {
    associatedtype Nested
}
