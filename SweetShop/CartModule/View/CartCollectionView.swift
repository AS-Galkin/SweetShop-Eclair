//
//  CartCollectionView.swift
//  SweetShop
//
//  Created by Александр Галкин on 09.03.2021.
//

import UIKit

class CartCollectionView: UICollectionView {

    
    private var collectionLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width - 80, height: UIScreen.main.bounds.width - 150)
        layout.minimumInteritemSpacing = 5.0
        return layout
    }()
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: .zero, collectionViewLayout: self.collectionLayout)
        register(CartCollectionViewCell.self, forCellWithReuseIdentifier: "CartCell")
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = UIColor(white: 1, alpha: 0)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
