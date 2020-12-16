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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(mainSearchBar)
        view.addSubview(categoryCollectionView)
        bindMainSearchBar()
        bindCollectionView()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        makeConstraintsCollectionView()
        makeConstrainstMainSearchBar()
    }
}

