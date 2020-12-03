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
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: Icons.userIcon.rawValue), style: .done, target: self, action: #selector(showCartVCHandler(sender:)))
    }
    
    @objc func showCartVCHandler(sender: UIBarButtonItem) {
        self.tabBarController?.show(CartViewController(), sender: self)
    }
}
