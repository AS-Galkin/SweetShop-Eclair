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
}

extension ProductViewController: UICollectionViewDelegate {
    
}
