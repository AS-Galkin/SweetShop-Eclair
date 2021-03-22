//
//  ExtensionCartViewController.swift
//  SweetShop
//
//  Created by Александр Галкин on 09.03.2021.
//

import UIKit

extension CartViewController {
    internal func downloadCartData(userID: Int?) {
        guard let userID = userID else {return}
        viewModel.downloadJson(parameters: ["user_id":userID], url: URIString.downloadURL.rawValue + URIString.apiGetCartSweetnessURN.rawValue)
    }
    
    internal func typeCastEmptyCartView() -> EmptyCartView {
        return self.view as? EmptyCartView ?? EmptyCartView()
    }
    
    internal func typeCastCartView() -> CartView {
        return self.view as? CartView ?? CartView()
    }
    
    internal func verbButtonHandler(sender: UIButton) {
        verbVC = VerbViewController()
        navigationController?.pushViewController(verbVC ?? VerbViewController(), animated: true)
    }
    
    internal func setHowUpdateCartViewData() {
        viewModel.updateData = { [weak self] viewData in
            self?.typeCastCartView().viewData = viewData
        }
        
        viewModel.updateImage = {[weak self] images in
            self?.typeCastCartView().images = images
        }
    }
    
    internal func updateViewData() {
        viewModel.updateDataOnView()
    }
    
    internal func cellButtonHandler(productId: Int, amount: Int) {
        if let request = try? NetworkUploading.shared().request(parameters: ["product_id":productId, "amount":amount, "user_id":userId], url: URIString.downloadURL.rawValue + URIString.apiUpdateCartDataURN.rawValue) {
            
            let response = try? NetworkUploading.shared().response(urlRequest: request) { (data) in
                print(data)
            }
        }
    }
    
    internal func showCategoryViewController() {
        if categoryVC != nil {
            tabBarController?.selectedIndex = 0
        }
    }
}

extension CartViewController: CartCellDelegate {
    func deleteCell(cell: UICollectionViewCell) {
        if let indexPath = typeCastCartView().cartCollectionView.indexPath(for: cell) {
            typeCastCartView().cartCollectionView.deleteItems(at: [indexPath])
            typeCastCartView().cartCollectionView.reloadData()
            viewModel.images.remove(at: indexPath.item)
            viewModel.updateDataOnView()
            let deletedItem = viewModel.productsInCartArray?.remove(at: indexPath.item)
            if let user = userId {
                if let request = try? NetworkUploading.shared().request(parameters: ["user_id":user, "product_id":deletedItem?.product_id], url: URIString.downloadURL.rawValue + URIString.apiDeleteCartDataURN.rawValue, uploadData: nil) {
                    let response = try? NetworkUploading.shared().response(urlRequest: request, completion: { (data) in
                    })
                }
            }
        }
    }
}
