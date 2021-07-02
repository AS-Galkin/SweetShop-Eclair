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
    internal var productsInCartArray: [CartModel.CartData]?
    
    weak var parentVC: CartViewController?

    internal var images: [UIImage] = []
    
    init() {
        self.productsInCartArray = []
    }
    
    func downloadData() {
    }
    
    func downloadJson(parameters: [String : Any], url: String) {
        
        DispatchQueue.main.async {
            self.updateData?(.loading([] as! [CartModel.CartData]))
        }
        
        guard let request = try? NetworkLoading.shared().request(parameters: parameters, url: url) else {
            return
        }
        
        let _ = try? NetworkLoading.shared().response(urlRequest: request, completion: { (data) in
            self.images = []
            if let jsonCart = try? JSONDecoder().decode([CartModel.CartData].self, from: data) {
                //self.productsInCartArray = []
                self.productsInCartArray = jsonCart
                for sweetness in jsonCart {
                    guard let image_name = sweetness.image_name,
                          let imageURL = URL(string: URIString.downloadURL.rawValue + image_name) else {return}
                    
                    if let image =  try? UIImage(data: Data(contentsOf: imageURL)) {
                        self.images.append(image)
                    }
                }
                self.updateDataOnView()
            } else {
                DispatchQueue.main.async {
                    self.updateData?(.failure([] as! [CartModel.CartData]))
                }
            }
        })
    }
    
    func updateDataOnView() {

        DispatchQueue.main.async {
            guard let _ = self.productsInCartArray?.count else {
                self.parentVC?.emptycartIsHidden = false

                return
            }
            
            if self.productsInCartArray!.count > 0 {
                self.parentVC?.emptycartIsHidden = true
                self.parentVC?.chooseButtonIsEnable = true
                self.updateData?(.success(self.productsInCartArray!))
                self.updateImage?(self.images)
                self.parentVC?.badgeCount = self.productsInCartArray!.count
            } else {
//                if ((self.parentVC?.typeCastCartView().loadingView.isDescendant(of: self.parentVC!.typeCastCartView())) != nil) {
//                    self.parentVC?.typeCastCartView().loadingView.removeFromSuperview()
//                }
                self.updateData?(.success([] as! [CartModel.CartData]))
                self.parentVC?.emptycartIsHidden = false
                self.parentVC?.typeCastCartView().collectionViewIsInEditing = false
            }
        }
    }
    
    func reloadData() {
        self.parentVC?.cartCount += 1
    }
}
