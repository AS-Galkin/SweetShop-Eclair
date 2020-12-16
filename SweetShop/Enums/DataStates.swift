//
//  DataStates.swift
//  SweetShop
//
//  Created by Александр Галкин on 11.12.2020.
//

//MARK: - Состояния для viewModel о состоянии модели
import Foundation

enum DataStates<T> {
    case initial
    case loading(T)
    case success(T)
    case failure(T)
}
