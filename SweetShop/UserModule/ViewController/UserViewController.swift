//
//  OfficeViewController.swift
//  SweetShop
//
//  Created by Александр Галкин on 02.12.2020.
//

import UIKit

class UserViewController: UIViewController {
    
    internal var viewModel: UserViewModel!
    internal var userID:Int?
    
    private var settingButton: UIBarButtonItem {
        return UIBarButtonItem(image: UIImage(named: Icons.settingsIcon.rawValue), style: .done, target: self, action: #selector(settingButtonHandler(selector:)))
    }
    
    override func viewDidLoad() {
        viewModel = UserViewModel()
        //downloadJsonData()
        super.viewDidLoad()
        if let _ = userID {
            navigationItem.rightBarButtonItem = settingButton
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        guard let _ = userID else {
            navigationItem.rightBarButtonItem?.isEnabled = false
            return
        }
        
        navigationItem.rightBarButtonItem? = settingButton
    }
    
    override func loadView() {
        if let savedPerson = UserDefaults.standard.object(forKey: "SavedPerson") as? Data {
            let decoder = JSONDecoder()
            if let person = try? decoder.decode([UserModel.UserData]?.self, from: savedPerson) as [UserModel.UserData]? {
                self.view = UserView(frame: UIScreen.main.bounds)
                self.typeCastUserView().viewData = .success(person)
                self.typeCastUserView().delegate = self
                userID = person[0].id
            } else {
                if let person = try? decoder.decode(UserModel.UserData?.self, from: savedPerson) as UserModel.UserData? {
                    self.view = UserView(frame: UIScreen.main.bounds)
                    let array = [person]
                    self.typeCastUserView().viewData = .success(array)
                    self.typeCastUserView().delegate = self
                    userID = person.id
                } else {
                    self.view = UnloggedUserView(frame: UIScreen.main.bounds)
                    self.typeCastUnloggedUserView().delegate = self
                }
            }
        } else {
            self.view = UnloggedUserView(frame: UIScreen.main.bounds)
            self.typeCastUnloggedUserView().delegate = self
        }
    }
    
    @objc private func settingButtonHandler(selector: UIBarButtonItem) {
//        let settingVC = SettingUserViewController()
//        self.navigationController?.pushViewController(settingVC, animated: true)
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        guard let settingsVC =  storyBoard.instantiateViewController(identifier: "SettingsTableViewController") as? SettingsTableViewController else { return }
        //settingsVC.parentVC = self
        self.navigationController?.show(settingsVC, sender: nil)
        
    }
    
    internal func exitButtonHandler() {
        UserDefaults.standard.removeObject(forKey: "SavedPerson")
        navigationItem.rightBarButtonItem?.isEnabled = false
        loadView()
    }
    
    internal func loginButtonHandler(selector: UIButton) {
        let unloggedViewController = LoginViewController()
        unloggedViewController.parentVC = self
        self.navigationController?.pushViewController(unloggedViewController, animated: true)
    }
    
    internal func registerButtonHandler() {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        guard let registerVC =  storyBoard.instantiateViewController(identifier: "RegisterTableViewController") as? RegisterTableViewController else { return }
        registerVC.parentVC = self
        self.navigationController?.show(registerVC, sender: nil)
    }
}
