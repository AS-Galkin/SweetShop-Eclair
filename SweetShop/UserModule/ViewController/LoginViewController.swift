//
//  UnloggedViewController.swift
//  SweetShop
//
//  Created by Александр Галкин on 01.03.2021.
//

import UIKit

class LoginViewController: UIViewController {
    
    weak var parentVC: UserViewController?
    var viewModel: UserViewModel!
    var viewData: DataStates<[UserModel.UserData]> = .initial {
        didSet {
            viewDataHandler()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        viewModel = UserViewModel()
        self.view = LoginView()
        typeCastLoginView().delegate = self
    }
    
    internal func loginButtonHandler(login: String?, password: String?, sender: UIButton) {
        guard let login = login,
              let password = password else { return }
        checkUserInDatabase(login: login, password: password)
    }
    
    internal func checkUserInDatabase(login: String, password: String) {
        viewModel?.updateData = {[weak self] viewData in
            self?.viewData = viewData
        }
        
        let param = ["table":"User","email": login, "password": password, "all":""]
        viewModel?.downloadJson(parameters: param, url: URIString.downloadURL.rawValue + URIString.apiGetDataURN.rawValue)
    }
    
    private func typeCastLoginView() -> LoginView {
        return self.view as! LoginView
    }
    
    private func viewDataHandler() {
        switch viewData {
        case .initial:
            print("initial load user data")
            break
        case .loading(let result):
            print("Loading load user data")
            break
        case .success(let result):
            print("Sucess load user data")
            UserDefaults.standard.set(viewModel.modelData, forKey: "SavedPerson")
            parentVC?.loadView()
            parentVC?.typeCastUserView().name = result[0].f_name
            parentVC?.navigationController?.popViewController(animated: true)
            break
        case .failure(let result):
            let alert = UIAlertController(title: "Ошибка", message: "Неверно введен пароль или email", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
            break
        }
    }
}
