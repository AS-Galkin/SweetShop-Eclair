//
//  CategoryCollectionView.swift
//  SweetShop
//
//  Created by Александр Галкин on 10.12.2020.
//

import UIKit

class CategoryCollectionView: UICollectionView {
    
    private var collectionLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width/2 - 10, height: UIScreen.main.bounds.width/2 - 10)
        return layout
    }()
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: .zero, collectionViewLayout: self.collectionLayout)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = UIColor.green
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

