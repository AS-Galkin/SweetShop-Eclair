//
//  ProductViewModel.swift
//  SweetShop
//
//  Created by Александр Галкин on 25.12.2020.
//

import Foundation
import UIKit

final class ProductViewModel: ViewModelProtocol {
    
    
    weak var delegate: Downloadable?
    typealias DataType = DataStates<[ProductModel.ProductData]>
    var updateData: ((DataStates<[ProductModel.ProductData]>) -> Void)?
    var model: [ProductModel.ProductData]?
    var updateImages: (([UIImage]) -> Void)?
    var parentVC: ProductViewController?
    
    init () {
        updateData?(.initial)
    }
    
    func downloadData() {
    }
    
    func downloadJson(parameters: [String : Any], url: String) {
        
        DispatchQueue.main.async {
            self.updateData?(.loading([] as! [ProductModel.ProductData]))
        }
        
        guard let request = try? NetworkLoading.shared().request(parameters: parameters, url: url) else {return}
        let response = try? NetworkLoading.shared().response(urlRequest: request) { (data) in
            let decoder = JSONDecoder()
            self.model = try? decoder.decode([ProductModel.ProductData]?.self, from: data) as [ProductModel.ProductData]?
            
            var images: [UIImage] = []
            
            if let model = self.model {
                for i in model {
                    let imageURL = URL(string: URIString.downloadURL.rawValue + (i.productData?.sweetness?.swImage?.imName)!)!
                    let image = try? UIImage(data: Data(contentsOf: imageURL))
                    if let image = image {
                        images.append(image)
                    }
                }
                DispatchQueue.main.async {[weak self] in
                    self?.updateData?(.success(model))
                    self?.updateImages?(images)
                }
            } else {
                DispatchQueue.main.async {
                    self.updateData?(.failure([] as! [ProductModel.ProductData]))
                }
            }
        }
    }
    
    func sortModel(sortClosure: (_ leftValue: ProductModel.ProductData, _ rightValue: ProductModel.ProductData) -> Bool) -> [ProductModel.ProductData]? {
        DispatchQueue.main.async {
            self.updateData?(.loading([] as! [ProductModel.ProductData]))
        }
        var images: [UIImage] = []
        let sortModel = model?.sorted(by: sortClosure)
        if let model = sortModel {
            for i in model {
                let imageURL = URL(string: URIString.downloadURL.rawValue + (i.productData?.sweetness?.swImage?.imName)!)!
                let image = try? UIImage(data: Data(contentsOf: imageURL))
                if let image = image {
                    images.append(image)
                }
            }
            DispatchQueue.main.async {[weak self] in
                self?.updateData?(.success(model))
                self?.updateImages?(images)
            }
        }
        return model
    }
    
    func addProductToCart(product: CartModel.CartData?, searchProduct: (_ product: inout [CartModel.CartData]) -> Bool) {
        guard product != nil,
              parentVC?.cartVC?.viewModel.productsInCartArray != nil else {return}
        
        if !searchProduct(&parentVC!.cartVC!.viewModel.productsInCartArray!) {
            if let request = try? NetworkUploading.shared().request(parameters: ["product_id":product!.product_id, "user_id":parentVC!.cartVC!.userId,
                                                                                 "amount":product!.amount],
                                                                                 url: URIString.downloadURL.rawValue + URIString.apiInsertCartDataURN.rawValue) {
                
                let response = try? NetworkUploading.shared().response(urlRequest: request) { (data) in
                    self.parentVC!.cartVC?.viewModel.reloadData()
                }
            }
        }
    }

    func createCartProduct(productModel: ProductModel.ProductData) -> CartModel.CartData {
        var cartProduct = CartModel.CartData()
        cartProduct.id = productModel.productData?.id
        cartProduct.name = productModel.productData?.sweetness?.swName
        cartProduct.short_description = productModel.productData?.sweetness?.swShortDescription
        cartProduct.image_name = productModel.productData?.sweetness?.swImage?.imName
        cartProduct.amount = 1
        cartProduct.description = productModel.productData?.sweetness?.swDescription
        cartProduct.price = productModel.productData?.price
        cartProduct.weight = productModel.productData?.sweetness?.swWeight
        cartProduct.product_id = productModel.productData?.id
        return cartProduct
    }
}
