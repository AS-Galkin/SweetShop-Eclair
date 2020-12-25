//
//  ProductViewController.swift
//  SweetShop
//
//  Created by Александр Галкин on 03.12.2020.
//

import UIKit

class ProductViewController: UIViewController {

    var selectedProduct: ProductModel?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func loadView() {
        self.view = ProductView()
    }

}
