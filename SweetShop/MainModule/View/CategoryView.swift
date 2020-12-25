//
//  CategoryView.swift
//  SweetShop
//
//  Created by Александр Галкин on 22.12.2020.
//

import UIKit

final class CategoryView: UIView {

    internal lazy var categoryCollectionView = CategoryCollectionView()
    internal lazy var mainSearchBar = MainSearchBar()
    internal lazy var mainScrollView = MainScrollView()
    internal lazy var bunnerView = BunnerView()
    internal lazy var dataForUpdate: [CategoryData.Data] = []
    var viewImages: [UIImage] = [] {
        didSet {
            setNeedsLayout()
        }
    }
    
    
    var viewData: DataStates<[CategoryData.Data]> = .initial {
        didSet {
            setNeedsLayout()
        }
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        backgroundColor = .cyan
                
        addSubview(mainScrollView)
   
        mainScrollView.addSubview(mainSearchBar)
        mainScrollView.addSubview(bunnerView)
        mainScrollView.addSubview(categoryCollectionView)
        
        
        
        makeConstraintsScrollView()
        makeConstrainstMainSearchBar()
        makeConstraintsBunnerView()
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
            dataForUpdate = result
            categoryCollectionView.dataSource = self
        case .loading(let result):
            break
        case .failure(let result):
            break
        }
    }
}
