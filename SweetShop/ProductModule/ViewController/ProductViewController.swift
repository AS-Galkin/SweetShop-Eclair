//
//  ProductViewController.swift
//  SweetShop
//
//  Created by Александр Галкин on 03.12.2020.
//

import UIKit

class ProductViewController: UIViewController {

    var selectedProduct: CategoryModel.CategoryData?
    var productViewModel: ProductViewModel!
    var detailProductViewController: DetailProductViewController!
    var cartTabBarItem: UITabBarItem?
    var countTabBarItemBadge: Int = 0
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        productViewModel = ProductViewModel()
        downloadJsonData()
        bindCollectionViewDelegate()
    }
    
    override func loadView() {
        self.view = ProductView()
        self.typeCastView().parentVC = self
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        updateProductView()
    }
}
