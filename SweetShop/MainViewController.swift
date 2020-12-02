//
//  MainViewController.swift
//  SweetShop
//
//  Created by Александр Галкин on 02.12.2020.
//

import UIKit

class MainViewController: UIViewController {

    var tabButton: UITabBarItem {
        let button: UITabBarItem = UITabBarItem(title: nil, image: UIImage(named: "home_icon"), selectedImage: nil)
        return button
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "Главная"
        self.tabBarItem = tabButton
        self.view.backgroundColor = .white
    }
    
}
