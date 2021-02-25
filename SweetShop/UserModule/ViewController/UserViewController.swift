//
//  OfficeViewController.swift
//  SweetShop
//
//  Created by Александр Галкин on 02.12.2020.
//

import UIKit

class UserViewController: UIViewController {


    
   internal var viewModel: UserViewModel!
    
    private var settingButton: UIBarButtonItem {
        return UIBarButtonItem(image: UIImage(named: Icons.settingsIcon.rawValue), style: .done, target: self, action: #selector(settingButtonHandler(selector:)))
    }
    
    override func viewDidLoad() {
        viewModel = UserViewModel()
        downloadJsonData()
        super.viewDidLoad()
        self.navigationItem.rightBarButtonItem = settingButton
    }
    
    override func loadView() {
        self.view = UserView(frame: UIScreen.main.bounds)
    }
    
    @objc private func settingButtonHandler(selector: UIBarButtonItem) {
        let settingVC = SettingUserViewController()
        self.navigationController?.pushViewController(settingVC, animated: true)
    }
}
