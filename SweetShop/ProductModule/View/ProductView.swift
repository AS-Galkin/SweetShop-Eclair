//
//  ProductView.swift
//  SweetShop
//
//  Created by Александр Галкин on 25.12.2020.
//

import UIKit

class ProductView: UIView {
    internal lazy var productCollectionView = ProductCollectionView()
    
    internal var parentVC: ProductViewController?
    
    var viewData: DataStates<[ProductModel.ProductData]> = .initial {
        didSet {
            setNeedsLayout()
        }
    }
    
    internal lazy var dataForUpdate: [ProductModel.ProductData] = []
    
    var viewImages: [UIImage] = [] {
        didSet {
            setNeedsLayout()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        backgroundColor = .white
        addSubview(productCollectionView)
        makeConstraintsCollectionView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        switch viewData {
        case .initial:
            print("INITIAL STATE")
            break
        case .success(let result):
            print("SUCESS")
            dataForUpdate = result
            productCollectionView.dataSource = self
        
            break
        case .loading(let result):
            break
        case .failure(let result):
            break
        }
    }
}
