//
//  ProductViewController.swift
//  SweetShop
//
//  Created by Александр Галкин on 03.12.2020.
//

import UIKit

protocol AddProductToCart: class {
    func addProduct(product: CartModel.CartData)
}

class ProductViewController: UIViewController {

    var selectedProduct: CategoryModel.CategoryData?
    var productViewModel: ProductViewModel = ProductViewModel()
    var detailProductViewController: DetailProductViewController!
    var cartTabBarItem: UITabBarItem?
    var countTabBarItemBadge: Int = 0
    var cartVC: CartViewController?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        downloadJsonData()
        bindCollectionViewDelegate()
    }
    
    override func loadView() {
        self.view = ProductView()
        productViewModel.parentVC = self
        self.typeCastView().parentVC = self
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        updateProductView()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
    }
}
