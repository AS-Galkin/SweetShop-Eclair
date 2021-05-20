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
    internal lazy var dataForUpdate: [CategoryModel.CategoryData] = []
    internal lazy var loadingView = LoadingView(frame: UIScreen.main.bounds)
    internal lazy var failView = FailView(frame: UIScreen.main.bounds)
    var tap:UITapGestureRecognizer = UITapGestureRecognizer()
    var viewImages: [UIImage] = [] {
        didSet {
            setNeedsLayout()
        }
    }
    weak var parentVC: CategoryViewController?
    
    
    var viewData: DataStates<[CategoryModel.CategoryData]> = .initial {
        didSet {
            setNeedsLayout()
        }
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        backgroundColor = .white
        addSubview(mainScrollView)
        mainScrollView.addSubview(mainSearchBar)
        mainScrollView.addSubview(bunnerView)
        mainScrollView.addSubview(categoryCollectionView)
        makeConstraintsScrollView()
        makeConstrainstMainSearchBar()
        makeConstraintsBunnerView()
        makeConstraintsCollectionView()
        tap = UITapGestureRecognizer(target: self, action: #selector(tapRecognizerHandler(sender:)))
        tap.numberOfTapsRequired = 1
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setNeedsLayout() {
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
            categoryCollectionView.dataSource = self
            mainSearchBar.delegate = self
        case .loading(let result):
            addSubview(loadingView)
            break
        case .failure(let result):
            if loadingView.isDescendant(of: self) {
                loadingView.removeFromSuperview()
            }
            addSubview(failView)
            failView.refreshButton.addTarget(self, action: #selector(refreshuttonHandler), for: .touchUpInside)
            break
        }
    }
    
    @objc func refreshuttonHandler() {
        parentVC?.reloadDataWhenFailure()
    }
}
