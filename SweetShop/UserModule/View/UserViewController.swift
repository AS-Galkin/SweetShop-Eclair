//
//  OfficeViewController.swift
//  SweetShop
//
//  Created by Александр Галкин on 02.12.2020.
//

import UIKit

class UserViewController: UIViewController{

    private var settingButton: UIBarButtonItem {
        return UIBarButtonItem(image: UIImage(named: Icons.settingsIcon.rawValue), style: .done, target: self, action: #selector(settingButtonHandler(selector:)))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.rightBarButtonItem = settingButton
    }
    @objc private func settingButtonHandler(selector: UIBarButtonItem) {
        let settingVC = SettingUserViewController()
        self.navigationController?.pushViewController(settingVC, animated: true)
    }
}
