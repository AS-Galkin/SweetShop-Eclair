//
//  SettingUserViewController.swift
//  SweetShop
//
//  Created by Александр Галкин on 08.12.2020.
//

import UIKit

class SettingUserViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    private func typeCastView() -> SettingUserView {
        return self.view as! SettingUserView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let savedPerson = try! UserDefaults.standard.object(forKey: "SavedPerson") as? Data {
            let decoder = JSONDecoder()
            if let person = try! decoder.decode([UserModel.UserData]?.self, from: savedPerson) as [UserModel.UserData]? {
                self.typeCastView().viewData = .success(person)
            }
        }
    }
    
    override func loadView() {
        print(#function)
        self.view = SettingUserView()
    }
}
