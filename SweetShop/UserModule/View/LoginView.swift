//
//  LoginView.swift
//  SweetShop
//
//  Created by Александр Галкин on 01.03.2021.
//

import UIKit

class LoginView: UIView {
    
    weak var delegate: UnloggedViewController?
    
    internal lazy var loginTextField: UITextField = {
        let textField: UITextField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Логин"
        textField.autocapitalizationType = .none
        textField.layer.borderWidth = 0.8
        return textField
    }()
    
    internal lazy var passwordTextField: UITextField = {
        let textField: UITextField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Пароль"
        textField.autocapitalizationType = .none
        textField.layer.borderWidth = 0.8
        return textField
    }()
    
    internal lazy var submitButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Войти", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.borderWidth = 0.8
        return button
    }()
    
    override init(frame:CGRect) {
        super.init(frame: .zero)
        backgroundColor = .white
        addSubview(loginTextField)
        addSubview(passwordTextField)
        addSubview(submitButton)
        submitButton.addTarget(self, action: #selector(submitbuttonHanlder(sender:)), for: .touchUpInside)
        createContraints()
    }
    
    private func createContraints() {
        loginTextField.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        loginTextField.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 50).isActive = true
        loginTextField.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -100).isActive = true
        loginTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        passwordTextField.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        passwordTextField.topAnchor.constraint(equalTo: loginTextField.bottomAnchor, constant: 5).isActive = true
        passwordTextField.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -100).isActive = true
        passwordTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        submitButton.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        submitButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 5).isActive = true
        submitButton.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -100).isActive = true
        submitButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    @objc private func submitbuttonHanlder(sender: UIButton) {
        delegate?.loginButtonHandler(login: loginTextField.text, password: passwordTextField.text, sender: sender)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
