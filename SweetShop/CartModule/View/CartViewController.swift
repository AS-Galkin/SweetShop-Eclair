//
//  CartViewController.swift
//  SweetShop
//
//  Created by Александр Галкин on 03.12.2020.
//

import UIKit

class CartViewController: UIViewController {
    
    private var orderButton: UIBarButtonItem {
        let button = UIBarButtonItem(image: nil, style: .done, target: self, action: nil)
        button.title = "Оформить"
        button.tintColor = .white
        return button
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.rightBarButtonItem = orderButton
    }
}
