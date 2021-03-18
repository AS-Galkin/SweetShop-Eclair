//
//  ExtensionProductViewController.swift
//  SweetShop
//
//  Created by Александр Галкин on 25.12.2020.
//

import UIKit

extension ProductViewController {
    
    //MARK: - CONNECTION
    func downloadJsonData() {
        let param = ["name":selectedProduct?.name ?? "Cakes"]
        productViewModel.downloadJson(parameters: param, url: URIString.downloadURL.rawValue + URIString.apiGetProductDataURN.rawValue)
    }
    
    //MARK: - Cast of type UIView
    func typeCastView() -> ProductView {
        return self.view as! ProductView
    }
    
    func bindCollectionViewDelegate () {
        self.typeCastView().productCollectionView.delegate = self
    }
    
    func updateProductView() {
        productViewModel.updateData = {[weak self] viewData in
            self?.typeCastView().viewData = viewData
        }
        
        productViewModel.updateImages = {[weak self] viewImages in
            self?.typeCastView().viewImages = viewImages
        }
    }
    
    internal func showDetailProductView(productData: ProductModel.ProductData? = nil, productImage: UIImage? = nil) {
        
        detailProductViewController = DetailProductViewController()
        guard let productData = productData,
              let productImage = productImage else {return}
        detailProductViewController.typeCastDetailProductView().product = productData
        detailProductViewController.typeCastDetailProductView().imageView.image = productImage
        detailProductViewController.typeCastDetailProductView().addToCartView.buttonDelegate = self
        detailProductViewController.typeCastDetailProductView().addToCartView.cartData = productViewModel.createCartProduct(productModel: productData)
        
        self.present(detailProductViewController, animated: true, completion: nil)
    }
}

extension ProductViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        showDetailProductView(productData: self.productViewModel.model?[indexPath.row], productImage: self.typeCastView().viewImages[indexPath.row])
    }
}

extension ProductViewController: AddProductToCart {
    func addProduct(product: CartModel.CartData) {
        if let count = cartVC?.viewModel.productsInCartArray?.count {
            productViewModel.addProductToCart(product: product) { (products) -> Bool in
                var pos = -1
                for i in products {
                    pos += 1
                    if i == product {
                        products[pos].amount! += 1
                        if let request = try? NetworkUploading.shared().request(parameters: ["product_id":products[pos].product_id, "user_id":cartVC!.userId,"amount":products[pos].amount!], url: URIString.downloadURL.rawValue + URIString.apiUpdateCartDataURN.rawValue) {
                            
                            let response = try? NetworkUploading.shared().response(urlRequest: request) { (data) in
                                print(String(data: data, encoding: .utf8))
                            }
                        }
                        return true
                    }
                }
                return false
            }
            cartTabBarItem?.badgeValue = String(count)
        }
        view.setNeedsLayout()
    }
}
