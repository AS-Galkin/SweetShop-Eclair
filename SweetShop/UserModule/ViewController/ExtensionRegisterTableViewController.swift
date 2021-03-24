//
//  ExtensionRegisterTableViewController.swift
//  SweetShop
//
//  Created by Александр Галкин on 23.03.2021.
//

import Foundation
import UIKit

extension RegisterTableViewController {
    internal func settingCells() {
        nameTextField.becomeFirstResponder()
        registerButton.layer.cornerRadius = 5.0
        registerButton.backgroundColor = .mainColorWithAplha
        registerButton.tintColor = .black
        passwordTextField.isSecureTextEntry = true
        repeatePasswordTextField.isSecureTextEntry = true
        birthdayDatePicker.datePickerMode = .date
        birthdayDatePicker.addTarget(self, action: #selector(datePickerHandler(sender:)), for: .valueChanged)
        passwordTextField.addTarget(self, action: #selector(checkEnterTextField(sender:)), for: .editingDidEnd)
        repeatePasswordTextField.addTarget(self, action: #selector(checkEnterTextField(sender:)), for: .editingDidEnd)
        emailTextField.addTarget(self, action: #selector(checkEnterTextField(sender:)), for: .editingDidEnd)
        emailTextField.restorationIdentifier = "emailTextField"
    }
    
    internal func register() {
        guard passwordTextField.text == repeatePasswordTextField.text else {
            createAlertViewController(title: "Ошибка ввода", message: "Веденные пароли не совпадают", completion: nil)
            return}
        uploadRegisterData()
    }
    
    @objc private func checkEnterTextField(sender: UITextField) {
        
        switch sender.restorationIdentifier {
        case "emailTextField":
            let str = sender.text
            if str?.range(of: "([a-zA-Z0-9]){1,12}@([a-z0-9]){1,64}\\.([a-z0-9]){2,64}", options: .regularExpression, range: nil, locale: nil) == nil {
                createAlertViewController(title: "Ошибка ввода", message: "Email может содержать только латинские символы и цифры", completion: nil)
            }
        default:
            let str = sender.text
            if str?.range(of: "([a-zA-Z0-9!#$%&'*+-/=?^_`{|}~]){6,12}", options: .regularExpression, range: nil, locale: nil) == nil {
                createAlertViewController(title: "Ошибка ввода", message: "Пароль должен содеражть хотя-бы 6 символов.", completion: nil)
            }
        }
    }
    
    private func createAlertViewController(title: String, message: String, completion:((UIAlertAction)->Void)?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: completion))
        self.present(alert, animated: true, completion: nil)
    }
    
    @objc private func datePickerHandler(sender: UIDatePicker) {
        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = "dd MM yyyy"
        date = timeFormatter.string(from: sender.date).filter {!" \n\r\t".contains($0)}
    }
    
    private func uploadRegisterData() {
        userViewModel = UserViewModel()
        guard passwordTextField.text?.count != 0,
              repeatePasswordTextField.text?.count != 0,
              emailTextField.text?.count != 0,
              phoneTextField.text?.count != 0 else {
            createAlertViewController(title: "Ошибка ввода", message: "Введены не все необходимые данные", completion: nil)
            return}
        let timeFormatter = DateFormatter()
        timeFormatter.timeStyle = .full
        let strDate: String? = timeFormatter.string(from: birthdayDatePicker.date)
        let params = [
            "email":emailTextField.text,
            "password":passwordTextField.text,
            "f_name":nameTextField.text,
            "s_name":sNameTextField.text,
            "l_name":lNameTextField.text,
            "phone":phoneTextField.text,
            "gender":genderSegmentControl.titleForSegment(at: genderSegmentControl.selectedSegmentIndex),
            "address": addressTextField.text,
            "birthday":date
        ]
        userViewModel?.uploadData(parameters: params, url: URIString.downloadURL.rawValue + URIString.apiRegisterURN.rawValue, completion: { (data) in
            if let data = String(data: data, encoding: .utf8) {
                if data == "1" {
                    DispatchQueue.main.async {
                        self.createAlertViewController(title: "Успешно", message: "Пользователь успешно добавлен") {(action) in
                            self.parentVC?.navigationController?.popViewController(animated: true)
                        }
                    }
                } else {
                    DispatchQueue.main.async {
                        self.createAlertViewController(title: "Ошибка", message: "Пользователь с такими данными уже существует", completion: nil)
                    }
                }
            }
        })
    }
}
