//
//  LocationViewController.swift
//  SweetShop
//
//  Created by Александр Галкин on 03.12.2020.
//

import UIKit

class LocationViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        showCartVC()
    }
    func showCartVC() {
    }
    
    @objc func showCartVCHandler(sender: UIBarButtonItem) {

    }
}
