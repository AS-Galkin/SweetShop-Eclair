//
//  ExtensionMainViewController.swift
//  SweetShop
//
//  Created by Александр Галкин on 10.12.2020.
//

import UIKit

extension CategoryViewController {
    
    //MARK: - CONNECTION
    func downloadJsonData() {
        let param = ["all":"","table":"Category"]
        viewModel.downloadJson(parameters: param, url: URIString.downloadURL.rawValue + URIString.apiGetDataURN.rawValue)
    }
    
    func downloadBunnerData() {
        let param = ["all":"","table":"Promotion"]
        viewModel.downloadBunnerJson(parameters: param, url: URIString.downloadURL.rawValue + URIString.apiGetDataURN.rawValue)
    }
    
    //MARK: - Method to run update View
    
    func updateCategoryView() {
        viewModel.updateData = { [weak self] viewData in
            self?.typeCastView().viewData = viewData
        }
        
        viewModel.updateImage = {[weak self] viewImages in
            self?.typeCastView().viewImages = viewImages
        }
        
        viewModel.settingBunnerView = {[weak self] frame, images in
            self?.typeCastView().bunnerView.scrollFrame = frame
            self?.typeCastView().bunnerView.images = images
        }
    }
    
    func setFrameForBunner(frame: CGRect) {
        viewModel.frameAfterLoad = frame
    }
    
    
    //MARK: - Cast of type UIView
    func typeCastView() -> CategoryView {
        return self.view as! CategoryView
    }
    
    //MARK: - Bind delegate to SearchBar
    func bindMainSearchBar() {
        self.typeCastView().mainSearchBar.delegate = self
    }
    
    //MARK: - Bind Delegates and dataSource to CategoryCollectionView
    func bindCollectionView() {
        self.typeCastView().categoryCollectionView.register(CategoryCollectionViewCell.self, forCellWithReuseIdentifier: "MyCell")
        self.typeCastView().categoryCollectionView.delegate = self
    }
    
    //MARK: - Bind delegate for scrollView
    func bindMainScrollView() {
        self.typeCastView().mainScrollView.delegate = self
    }
    
    //MARK: - Cell collectionview tap behavior
    func cellButtonhandler(cell: UICollectionView, productData: CategoryModel.CategoryData? = nil) {
        let productVC = ProductViewController()
        productVC.cartTabBarItem = self.cartTabBarItem
        productVC.cartVC = cartVC
        
        if let poductData = productData {
            productVC.selectedProduct = productData
        }
        
        navigationController?.pushViewController(productVC, animated: true)
    }
}



extension CategoryViewController: UICollectionViewDelegate {
 
    //MARK: - Setting Size for each cell
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: collectionView.frame.width/2.5, height: collectionView.frame.height/2)
//    }
    
    //MARK: - Setting selector for each cell
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        cellButtonhandler(cell: collectionView, productData: self.viewModel.categoryModel?[indexPath.row])
    }
}

extension CategoryViewController: UISearchBarDelegate {
    
}

extension CategoryViewController: UIScrollViewDelegate {
    
}
