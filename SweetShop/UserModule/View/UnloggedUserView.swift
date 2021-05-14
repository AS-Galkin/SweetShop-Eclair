//
//  UnloggedUserView.swift
//  SweetShop
//
//  Created by Александр Галкин on 25.02.2021.
//

import Foundation
import UIKit

class UnloggedUserView: UIView {
    
    weak var delegate: UserViewController?
    
    internal var loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Войти", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 5.0
        button.backgroundColor = .mainColorWithAplha
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    internal var registerButton: UIButton = {
        let button = UIButton()
        button.setTitle("Регистрация", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 5.0
        button.backgroundColor = .mainColorWithAplha
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(registerButtonHandler), for: .touchUpInside)
        return button
    }()
    
    internal var textView: UITextView = {
        let textView = UITextView()
        textView.text = "Вы вошли как неавторизованный пользователь.\nДля входа нажмите войти или регистрация."
        textView.font = .emptyCartFont
        textView.textAlignment = .center
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        backgroundColor = .white
        addSubview(loginButton)
        addSubview(registerButton)
        addSubview(textView)
        loginButton.addTarget(self, action: #selector(loginButtonHandler(sender:)), for: .touchUpInside)
        createConstraints()
    }
    
    private func createConstraints() {
        textView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        textView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 100).isActive = true
        textView.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -100).isActive = true
        textView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        loginButton.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        loginButton.topAnchor.constraint(equalTo: textView.bottomAnchor, constant: 5).isActive = true
        loginButton.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -100).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        registerButton.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        registerButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 5).isActive = true
        registerButton.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -100).isActive = true
        registerButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    @objc private func loginButtonHandler(sender: UIButton) {
        delegate?.loginButtonHandler(selector: sender)
    }
    
    @objc private func registerButtonHandler() {
        delegate?.registerButtonHandler()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
