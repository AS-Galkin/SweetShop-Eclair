//
//  CartViewModel.swift
//  SweetShop
//
//  Created by Александр Галкин on 09.03.2021.
//

import Foundation
import UIKit

final class CartViewModel: ViewModelProtocol {

    internal var updateData: ((DataStates<[CartModel.CartData]>) -> Void)?
    internal var updateImage: (([UIImage]) -> Void)?
    internal var productsInCartArray: [CartModel.CartData]? {
        didSet {
            updateDataOnView()
        }
    }
    
    weak var parentVC: CartViewController?
    
    
    internal var images: [UIImage] = []
    
    
    func downloadData() {
    }
    
    func downloadJson(parameters: [String : Any], url: String) {
        guard let request = try? NetworkLoading.shared().request(parameters: parameters, url: url) else {
            return
        }
        
        let response = try? NetworkLoading.shared().response(urlRequest: request, completion: { (data) in
            self.images = []
            if let jsonCart = try? JSONDecoder().decode([CartModel.CartData].self, from: data) {
                self.productsInCartArray = []
                self.productsInCartArray = jsonCart
                for sweetness in jsonCart {
                    guard let image_name = sweetness.image_name,
                          let imageURL = URL(string: URIString.downloadURL.rawValue + image_name) else {return}
                    
                    if let image =  try? UIImage(data: Data(contentsOf: imageURL)) {
                        self.images.append(image)
                    }
                }
            }
        })
    }
    
    func updateDataOnView() {
        DispatchQueue.main.async {
            self.updateData?(.success(self.productsInCartArray!))
            self.updateImage?(self.images)
        }
    }
    
    func reloadData() {
        self.parentVC?.cartCount += 1
    }
}
