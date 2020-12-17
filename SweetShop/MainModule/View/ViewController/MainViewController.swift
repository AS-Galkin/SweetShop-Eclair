//
//  MainViewController.swift
//  SweetShop
//
//  Created by Александр Галкин on 02.12.2020.
//

import UIKit

final class MainViewController: UIViewController {
    
    internal lazy var categoryCollectionView = CategoryCollectionView()
    internal lazy var mainSearchBar = MainSearchBar()
    internal lazy var mainScrollView = MainScrollView()
    internal lazy var bunnerView = BunnerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(mainScrollView)
   
        mainScrollView.addSubview(mainSearchBar)
        
        mainScrollView.addSubview(bunnerView)

        mainScrollView.addSubview(categoryCollectionView)
        
        makeConstraintsScrollView()
        makeConstrainstMainSearchBar()
        makeConstraintsBunnerView()
        makeConstraintsCollectionView()
        
        bindMainScrollView()
        bindMainSearchBar()
        bindCollectionView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
    }
}

