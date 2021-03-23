//
//  LoginView.swift
//  SweetShop
//
//  Created by Александр Галкин on 01.03.2021.
//

import UIKit

class LoginView: UIView {
    
    weak var delegate: LoginViewController?
    
    internal lazy var loginTextField: UITextField = {
        let textField: UITextField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Логин"
        textField.textAlignment = .center
        textField.layer.cornerRadius = 7.0
        textField.autocapitalizationType = .none
        textField.layer.borderWidth = 0.3
        textField.backgroundColor = .textFieldGray
        textField.becomeFirstResponder()
        return textField
    }()
    
    internal lazy var passwordTextField: UITextField = {
        let textField: UITextField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Пароль"
        textField.autocapitalizationType = .none
        textField.textAlignment = .center
        textField.layer.cornerRadius = 7.0
        textField.backgroundColor = .textFieldGray
        textField.layer.borderWidth = 0.3
        textField.isSecureTextEntry = true
        return textField
    }()
    
    internal lazy var submitButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Войти", for: .normal)
        button.backgroundColor = .mainColorWithAplha
        button.layer.cornerRadius = 5.0
        button.setTitleColor(.black, for: .normal)
        button.resignFirstResponder()
        return button
    }()
    
    internal lazy var loginLabel: UILabel = {
        let label: UILabel = UILabel()
        label.textAlignment = .center
        label.text = "Вход"
        label.font = .emptyCartFont
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame:CGRect) {
        super.init(frame: .zero)
        backgroundColor = .white
        addSubview(loginLabel)
        addSubview(loginTextField)
        addSubview(passwordTextField)
        addSubview(submitButton)
        submitButton.addTarget(self, action: #selector(submitbuttonHanlder(sender:)), for: .touchUpInside)
        createContraints()
    }
        
    private func createContraints() {
        loginLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        loginLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 50).isActive = true
        loginLabel.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        loginLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        loginTextField.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        loginTextField.topAnchor.constraint(equalTo: loginLabel.topAnchor, constant: 50).isActive = true
        loginTextField.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -80).isActive = true
        loginTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        passwordTextField.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        passwordTextField.topAnchor.constraint(equalTo: loginTextField.bottomAnchor, constant: 10).isActive = true
        passwordTextField.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -80).isActive = true
        passwordTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        submitButton.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        submitButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 20).isActive = true
        submitButton.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -150).isActive = true
        submitButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    @objc private func submitbuttonHanlder(sender: UIButton) {
        delegate?.loginButtonHandler(login: loginTextField.text, password: passwordTextField.text, sender: sender)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
