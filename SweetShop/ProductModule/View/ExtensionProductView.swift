//
//  ExtensionProductView.swift
//  SweetShop
//
//  Created by Александр Галкин on 25.12.2020.
//

import UIKit

extension ProductView {

    func makeConstraintsCollectionView() {
        productCollectionView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        productCollectionView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 5 ).isActive = true
        productCollectionView.widthAnchor.constraint(equalTo: self.widthAnchor, constant:  -10).isActive = true
        productCollectionView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
}

extension ProductView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataForUpdate.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let myCell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCell", for: indexPath) as? ProductCollectionViewCell {
            myCell.buttonDelegate = parentVC.self
            myCell.viewingData = dataForUpdate[indexPath.row]
            myCell.parentVC = self.parentVC
            myCell.imageCell = viewImages[indexPath.row]
            myCell.descriptionCell = dataForUpdate[indexPath.row].productData?.sweetness?.swName
            myCell.price = dataForUpdate[indexPath.row].productData?.price
            myCell.weight = dataForUpdate[indexPath.row].productData?.sweetness?.swWeight
            return myCell
        } else {
            let myCell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCell", for: indexPath)
            return myCell
        }
    }
}
