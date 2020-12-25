//
//  ProductView.swift
//  SweetShop
//
//  Created by Александр Галкин on 25.12.2020.
//

import UIKit

class ProductView: UIView {
    internal lazy var productCollectionView = ProductCollectionView()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        productCollectionView.dataSource = self
        backgroundColor = .cyan
                
        addSubview(productCollectionView)
        makeConstraintsCollectionView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
