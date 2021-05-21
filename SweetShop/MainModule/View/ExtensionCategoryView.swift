//
//  ExtensionCategoryView.swift
//  SweetShop
//
//  Created by Александр Галкин on 22.12.2020.
//

import UIKit

extension CategoryView {
    
//    //MARK: - Get Height of TabBar
//    func getTabBarHeigt() -> CGFloat {
//        if var tabBarHeight = categoryVC.tabBarController?.tabBar.frame.height {
//            tabBarHeight *= -1
//            return tabBarHeight
//        } else {
//            return CGFloat(-49.0)
//        }
//    }
    
    
    
    //MARK: - Make constarints for ScrollView
    func makeConstraintsScrollView() {
        mainScrollView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        mainScrollView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor).isActive = true
        mainScrollView.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        mainScrollView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
    
    //MARK: - Make constraints for BannerView
    func makeConstraintsBunnerView() {
        bunnerView.centerXAnchor.constraint(equalTo: mainScrollView.centerXAnchor).isActive = true
        bunnerView.topAnchor.constraint(equalTo: mainSearchBar.bottomAnchor, constant: 7.0).isActive = true
        bunnerView.widthAnchor.constraint(equalTo: mainScrollView.widthAnchor, constant: -10).isActive = true
        //bunnerView.bottomAnchor.constraint(equalTo: bunnerView.topAnchor, constant: 100).isActive = true
        bunnerView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 4).isActive = true
    }
    
    //MARK: - Make constarints for SearchBar
    func makeConstrainstMainSearchBar() {
        mainSearchBar.centerXAnchor.constraint(equalTo: mainScrollView.centerXAnchor).isActive = true
        mainSearchBar.topAnchor.constraint(equalTo: mainScrollView.topAnchor, constant: 5.0).isActive = true
        mainSearchBar.widthAnchor.constraint(equalTo: mainScrollView.widthAnchor, constant: -10.0).isActive = true
    }
    
 
    
    //MARK: - Make constraints for CategoryCollectionView
    func makeConstraintsCollectionView() {
        categoryCollectionView.centerXAnchor.constraint(equalTo: mainScrollView.centerXAnchor).isActive = true
        categoryCollectionView.topAnchor.constraint(equalTo: bunnerView.bottomAnchor, constant: 7.0).isActive = true
        categoryCollectionView.widthAnchor.constraint(equalTo: mainScrollView.widthAnchor, constant: -10).isActive = true
        categoryCollectionView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -10).isActive = true
    }
}

extension CategoryView: UICollectionViewDataSource {
    
    //MARK: - Return how many cell ColectionView will have
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataForUpdate.count // How many cells to display
    }
    
    //MARK: - Setting each cell
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let myCell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCell", for: indexPath) as? CategoryCollectionViewCell {
            myCell.image = viewImages[indexPath.row]
            myCell.label = dataForUpdate[indexPath.row].name
            return myCell
        } else {
            let myCell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCell", for: indexPath)
            return myCell
        }
    }
}
extension CategoryView: UISearchBarDelegate {
//    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//        let productVC = SearchedProductViewController()
//        productVC.searchProduct = te
//
//        if let poductData = productData {
//            productVC.selectedProduct = productData
//        }
//
//        navigationController?.pushViewController(productVC, animated: true)
//    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        if mainSearchBar.text?.count ?? 0 > 0 {
            let productVC = SearchedProductViewController()
            let str = "*\(mainSearchBar.text!.lowercased())* *\(mainSearchBar.text!.capitalized)*"
            productVC.searchProduct = str
            mainSearchBar.resignFirstResponder()
            parentVC?.show(productVC, sender: nil)
        } else {
            mainSearchBar.resignFirstResponder()
        }
    }
    
    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
        addGestureRecognizer(tap)
        return true
    }
    
    func searchBarShouldEndEditing(_ searchBar: UISearchBar) -> Bool {
        removeGestureRecognizer(tap)
        return true
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        mainSearchBar.resignFirstResponder()
    }
    
    @objc func tapRecognizerHandler(sender: UITapGestureRecognizer) {
        mainSearchBar.resignFirstResponder()
    }
    
}
