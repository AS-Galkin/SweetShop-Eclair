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
        productCollectionView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor).isActive = true
        productCollectionView.widthAnchor.constraint(equalTo: self.widthAnchor, constant:  -10).isActive = true
        productCollectionView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
}

extension ProductView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let myCell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCell", for: indexPath) as? ProductCollectionViewCell {
            return myCell
        } else {
            let myCell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCell", for: indexPath)
            return myCell
        }
    }
}
