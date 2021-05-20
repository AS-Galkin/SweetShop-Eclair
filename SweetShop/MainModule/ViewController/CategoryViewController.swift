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
    internal var cartVC: CartViewController?
    
    override func loadView() {
        self.view = CategoryView()
        typeCastView().parentVC = self
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
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        setFrameForBunner(frame: typeCastView().bunnerView.frame)
        downloadBunnerData()
    }
}

