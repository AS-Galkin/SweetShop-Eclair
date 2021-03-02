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
        //downloadJsonData()
        super.viewDidLoad()
        self.navigationItem.rightBarButtonItem = settingButton
    }
    
    override func loadView() {
        if let savedPerson = try? UserDefaults.standard.object(forKey: "SavedPerson") as? Data {
            let decoder = JSONDecoder()
            if let person = try? decoder.decode([UserModel.UserData]?.self, from: savedPerson) as [UserModel.UserData]? {
                self.view = UserView(frame: UIScreen.main.bounds)
                self.typeCastUserView().viewData = .success(person)
                self.typeCastUserView().delegate = self
            } else {
                self.view = UnloggedUserView(frame: UIScreen.main.bounds)
                self.typeCastUnloggedUserView().delegate = self
            }
        } else {
            self.view = UnloggedUserView(frame: UIScreen.main.bounds)
            self.typeCastUnloggedUserView().delegate = self
        }
    }
    
    @objc private func settingButtonHandler(selector: UIBarButtonItem) {
        let settingVC = SettingUserViewController()
        self.navigationController?.pushViewController(settingVC, animated: true)
        
    }
    
    internal func exitButtonHandler() {
        UserDefaults.standard.removeObject(forKey: "SavedPerson")
        loadView()
    }
    
    internal func loginButtonHandler(selector: UIButton) {
        let unloggedViewController = UnloggedViewController()
        unloggedViewController.parentVC = self
        self.navigationController?.pushViewController(unloggedViewController, animated: true)
    }
}
