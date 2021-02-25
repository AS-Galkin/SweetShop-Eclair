//
//  DetailProductViewController.swift
//  SweetShop
//
//  Created by Александр Галкин on 16.02.2021.
//

import UIKit

class DetailProductViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func loadView() {
        self.view = DetailProductView()
        self.typeCastDetailProductView().parentVC = self
    }
    
    func cartButtonHandler() {
        print("Add to Cart button was pressed")
    }
}
