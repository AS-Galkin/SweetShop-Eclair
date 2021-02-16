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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        productViewModel = ProductViewModel()
        downloadJsonData()
        
    }
    
    override func loadView() {
        self.view = ProductView()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        updateProductView()
    }
}
