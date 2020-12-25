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
        //bunnerView.frame.size.height = 150
        bunnerView.centerXAnchor.constraint(equalTo: mainScrollView.centerXAnchor).isActive = true
        bunnerView.topAnchor.constraint(equalTo: mainSearchBar.bottomAnchor, constant: 10.0).isActive = true
        bunnerView.widthAnchor.constraint(equalTo: mainScrollView.widthAnchor, constant: -10).isActive = true
        //bunnerView.bottomAnchor.constraint(equalTo: bunnerView.topAnchor, constant: 100).isActive = true
        bunnerView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 3).isActive = true
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
        categoryCollectionView.topAnchor.constraint(equalTo: bunnerView.bottomAnchor, constant: 15.0).isActive = true
        categoryCollectionView.widthAnchor.constraint(equalTo: mainScrollView.widthAnchor, constant: -10).isActive = true
        categoryCollectionView.heightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.heightAnchor, constant: -49).isActive = true
        categoryCollectionView.bottomAnchor.constraint(equalTo: mainScrollView.bottomAnchor).isActive = true
    }
}

extension CategoryView: UICollectionViewDataSource {
    
    //MARK: - Return how many cell ColectionView will have
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataForUpdate.count // How many cells to display
    }
    
    //MARK: - Setting each cell
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let myCell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath) as? CategoryCollectionViewCell {
            //myCell.image = try? UIImage(data: Data(contentsOf: URL(string: URLString.requestAbsolutePathLocal.rawValue + dataForUpdate[indexPath.row].image!)!))
            myCell.image = viewImages[indexPath.row]
            myCell.label = dataForUpdate[indexPath.row].name
            return myCell
        } else {
            let myCell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath)
            return myCell
        }
    }
}