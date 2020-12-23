//
//  ExtensionMainViewController.swift
//  SweetShop
//
//  Created by Александр Галкин on 10.12.2020.
//

import UIKit

extension CategoryViewController {
    
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
        self.typeCastView().categoryCollectionView.dataSource = self
    }
    
    //MARK: - Bind delegate for scrollView
    func bindMainScrollView() {
        self.typeCastView().mainScrollView.delegate = self
    }
}

extension CategoryViewController: UICollectionViewDataSource {
    
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

extension CategoryViewController: UICollectionViewDelegate {
 
    //MARK: - Setting Size for each cell
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/2.5, height: collectionView.frame.height/2)
    }
    
    //MARK: - Setting selector for each cell
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       print("User tapped on item \(indexPath.row)")
    }
}

extension CategoryViewController: UISearchBarDelegate {
    
}

extension CategoryViewController: UIScrollViewDelegate {
    
}

