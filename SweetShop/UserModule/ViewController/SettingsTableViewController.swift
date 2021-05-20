//
//  SettingsTableViewController.swift
//  SweetShop
//
//  Created by Александр Галкин on 17.05.2021.
//

import UIKit

class SettingsTableViewController: UITableViewController {
    
    let genderArray = ["Мужской", "Женский"]
    internal var viewModel: UserViewModel?
    internal var viewData: DataStates<[UserModel.UserData]> = .initial {
        didSet{
            setFields()
        }
    }
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var sNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var mobileTextField: UITextField!
    @IBOutlet weak var birthdayDatePicker: UIDatePicker!
    @IBOutlet weak var genderSegmentControll: UISegmentedControl!
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var lNameTexField: UITextField!
    var date: String?
    internal lazy var changePasswdButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Изменить пароль", for: .normal)
        button.backgroundColor = .mainColorWithAplha
        button.layer.cornerRadius = 5.0
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(changePasswdButtonhandler), for: .touchUpInside)
        return button
    }()
    
    override func loadView() {
        super.loadView()
        viewModel = UserViewModel()
        let barButton = UIBarButtonItem()
        barButton.title = "< Личный кабинет"
        barButton.target = self
        barButton.action = #selector(backButton(sender:))
        self.navigationItem.setLeftBarButton(barButton, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        settingCells()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
    
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let header = view as! UITableViewHeaderFooterView
        header.textLabel?.font = .tableHeaderFont
        header.textLabel?.textColor = .black
        if section == 2  {
            view.addSubview(changePasswdButton)
            changePasswdButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            changePasswdButton.topAnchor.constraint(equalTo: view.bottomAnchor, constant: 223).isActive = true
            changePasswdButton.widthAnchor.constraint(equalToConstant: 180).isActive = true
            changePasswdButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let savedPerson = try! UserDefaults.standard.object(forKey: "SavedPerson") as? Data {
            let decoder = JSONDecoder()
            if let person = try? decoder.decode([UserModel.UserData]?.self, from: savedPerson) as [UserModel.UserData]? {
                self.viewData = .success(person)
                viewModel?.model = person
            } else {
                if let person = try? decoder.decode(UserModel.UserData?.self, from: savedPerson) as UserModel.UserData? {
                    let array = [person]
                    viewModel?.model = array
                    self.viewData = .success(array)
                }
            }
        }
    }
    
    @objc func changePasswdButtonhandler() {
        
    }
    
    @objc func backButton(sender: UIButton) -> Void {
        var address: String = ""
        
        if date == nil {
            birthdayDatePickerHandler(sender: birthdayDatePicker)
        }
        
        let fields: [String : String?] = ["f_name":nameTextField.text, "s_name":sNameTextField.text, "l_name":lNameTexField.text, "address":addressTextField.text, "phone":mobileTextField.text, "email":emailTextField.text, "gender":genderArray[genderSegmentControll.selectedSegmentIndex], "birthday":date]
        
        viewModel?.uploadData(parameters: fields, url:  URIString.downloadURL.rawValue + URIString.apiUploadDataURN.rawValue) { (data) in
            print(String(data: data, encoding: .utf8))
        }
        
        if (UserDefaults.standard.object(forKey: "SavedPerson") != nil) {
            viewModel?.savePersonToUserDefaults(fields: fields)
        }
        
        navigationController?.popViewController(animated: true)
    }
}
