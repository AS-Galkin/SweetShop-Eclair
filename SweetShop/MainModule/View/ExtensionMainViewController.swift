//
//  ExtensionMainViewController.swift
//  SweetShop
//
//  Created by Александр Галкин on 10.12.2020.
//

import UIKit

extension MainViewController {
    
    //MARK: - Get Height of TabBar
    func getTabBarHeigt() -> CGFloat {
        if var tabBarHeight = self.tabBarController?.tabBar.frame.height {
            tabBarHeight *= -1
            return tabBarHeight
        } else {
            return CGFloat(-49.0)
        }
    }
    
    //MARK: - Bind Delegates and dataSource to CategoryCollectionView
    func bindCollectionView() {
        categoryCollectionView.register(CategoryCollectionViewCell.self, forCellWithReuseIdentifier: "MyCell")
        categoryCollectionView.delegate = self
        categoryCollectionView.dataSource = self
    }
    
    //MARK: - Make constraints for CategoryCollectionView
    func makeConstraintsCollectionView() {
        categoryCollectionView.topAnchor.constraint(equalTo: bunnerView.bottomAnchor, constant: 5.0).isActive = true
        categoryCollectionView.widthAnchor.constraint(equalTo: mainScrollView.widthAnchor, constant: 5.0).isActive = true
        categoryCollectionView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, constant: getTabBarHeigt()).isActive = true
        categoryCollectionView.bottomAnchor.constraint(equalTo: mainScrollView.bottomAnchor).isActive = true
    }
    
    //MARK: - Bind delegate to SearchBar
    func bindMainSearchBar() {
        mainSearchBar.delegate = self
    }
    
    //MARK: - Make constarints for SearchBar
    func makeConstrainstMainSearchBar() {
        mainSearchBar.centerXAnchor.constraint(equalTo: mainScrollView.centerXAnchor).isActive = true
        mainSearchBar.topAnchor.constraint(equalTo: mainScrollView.topAnchor, constant: 5.0).isActive = true
        mainSearchBar.widthAnchor.constraint(equalTo: mainScrollView.widthAnchor, constant: 5.0).isActive = true
    }
    
    //MARK: - Bind delegate for scrollView
    func bindMainScrollView() {
        mainScrollView.delegate = self
    }
    
    //MARK: - Make constarints for ScrollView
    func makeConstraintsScrollView() {
        mainScrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        mainScrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        mainScrollView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        mainScrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
    
    //MARK: - Make constraints for BannerView
    func makeConstraintsBunnerView() {
        //bunnerView.frame.size.height = 150
        bunnerView.centerXAnchor.constraint(equalTo: mainScrollView.centerXAnchor).isActive = true
        bunnerView.topAnchor.constraint(equalTo: mainSearchBar.bottomAnchor, constant: 5.0).isActive = true
        bunnerView.widthAnchor.constraint(equalTo: mainScrollView.widthAnchor, constant: 5.0).isActive = true
        //bunnerView.bottomAnchor.constraint(equalTo: bunnerView.topAnchor, constant: 100).isActive = true
        bunnerView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 3).isActive = true
    }
}

extension MainViewController: UICollectionViewDataSource {
    
    //MARK: - Return how many cell ColectionView will have
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 9 // How many cells to display
    }
    
    //MARK: - Setting each cell
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let myCell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath) as? CategoryCollectionViewCell {
            myCell.backgroundColor = .red
            myCell.data = "sfsfsf"
            return myCell
        } else {
            let myCell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath)
            myCell.backgroundColor = .red
            return myCell
        }
    }
}

extension MainViewController: UICollectionViewDelegate {
 
    //MARK: - Setting Size for each cell
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/2.5, height: collectionView.frame.height/2)
    }
    
    //MARK: - Setting selector for each cell
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       print("User tapped on item \(indexPath.row)")
    }
}

extension MainViewController: UISearchBarDelegate {
    
}

extension MainScrollView: UIScrollViewDelegate {
    
}
