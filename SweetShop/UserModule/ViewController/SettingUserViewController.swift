//
//  SettingUserViewController.swift
//  SweetShop
//
//  Created by Александр Галкин on 08.12.2020.
//

import UIKit

class SettingUserViewController: UIViewController {
    
    internal var viewModel: UserViewModel?
        
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
            if let person = try? decoder.decode([UserModel.UserData]?.self, from: savedPerson) as [UserModel.UserData]? {
                self.typeCastView().viewData = .success(person)
                viewModel?.model = person
            } else {
                if let person = try? decoder.decode(UserModel.UserData?.self, from: savedPerson) as UserModel.UserData? {
                    let array = [person]
                    viewModel?.model = array
                    self.typeCastView().viewData = .success(array)
                }
            }
        }
    }
    
    @objc func backButton(sender: UIButton) -> Void {
        
        let fields: [String : String?] = ["f_name":typeCastView().name.text, "s_name":typeCastView().surName.text, "address":typeCastView().address.text, "birthday":typeCastView().birthDate.text, "phone":typeCastView().phone.text, "email":typeCastView().email.text, "gender":typeCastView().sexArray[typeCastView().segmentControl!.selectedSegmentIndex]]
        
        viewModel?.uploadData(parameters: fields, url:  URIString.downloadURL.rawValue + URIString.apiUploadDataURN.rawValue)
        
        if (UserDefaults.standard.object(forKey: "SavedPerson") != nil) {
            viewModel?.savePersonToUserDefaults(fields: fields)
        }
        
        navigationController?.popViewController(animated: true)
    }
    
    override func loadView() {
        self.view = SettingUserView()
        viewModel = UserViewModel()
        let barButton = UIBarButtonItem()
        barButton.title = "< Личный кабинет"
        barButton.target = self
        barButton.action = #selector(backButton(sender:))
        self.navigationItem.setLeftBarButton(barButton, animated: true)
    }
}
