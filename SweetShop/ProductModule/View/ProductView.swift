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
    internal lazy var loadingView = LoadingView(frame: UIScreen.main.bounds)
    internal lazy var failView = FailView(frame: UIScreen.main.bounds)
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
            if loadingView.isDescendant(of: self) {
                loadingView.removeFromSuperview()
            }
            dataForUpdate = result
            productCollectionView.dataSource = self
            productCollectionView.reloadData()
            break
        case .loading(_):
            addSubview(loadingView)
            break
        case .failure(_):
            if loadingView.isDescendant(of: self) {
                loadingView.removeFromSuperview()
            }
            addSubview(failView)
            break
        }
    }
}
