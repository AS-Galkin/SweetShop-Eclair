//
//  MainViewController.swift
//  SweetShop
//
//  Created by Александр Галкин on 02.12.2020.
//

import UIKit

class CategoryViewController: UIViewController {
    
    internal var viewModel: CategoryViewModel!
    //internal var categoryView: CategoryView!
    internal var cartTabBarItem: UITabBarItem?
    
    override func loadView() {
        self.view = CategoryView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = CategoryViewModel()
        
        downloadJsonData()
        
        tabBarItem.image = UIImage(named: Icons.categoryIcon.rawValue)
        navigationItem.title = "Главная"
        
        bindMainScrollView()
        bindMainSearchBar()
        bindCollectionView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        updateCategoryView()
    }

}

