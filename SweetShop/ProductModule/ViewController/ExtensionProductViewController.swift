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
        
        self.present(detailProductViewController, animated: true, completion: nil)
    }
    
    internal func cellPriceButtonHandler() {
        countTabBarItemBadge += 1
        cartTabBarItem?.badgeValue = String(countTabBarItemBadge)
        view.setNeedsLayout()
    }
}

extension ProductViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        showDetailProductView(productData: self.productViewModel.model?[indexPath.row], productImage: self.typeCastView().viewImages[indexPath.row])
    }
}
