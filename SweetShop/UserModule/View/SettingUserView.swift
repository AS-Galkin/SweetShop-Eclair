//
//  SettingView.swift
//  SweetShop
//
//  Created by Александр Галкин on 25.12.2020.
//

import UIKit

class SettingUserView: UIView {
    
    var scrollView: UIScrollView?
    var segmentControl: UISegmentedControl?
    
    var name: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        textField.layer.borderWidth = 0.4
        textField.layer.shadowColor = UIColor.black.cgColor
        textField.layer.shadowRadius = 0.3
        textField.layer.shadowOffset = .zero
        textField.layer.shadowOpacity = 1.0
        textField.placeholder = "Имя"
        return textField
    }()
    
    var surName: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        textField.layer.borderWidth = 0.4
        textField.layer.shadowColor = UIColor.black.cgColor
        textField.layer.shadowRadius = 0.3
        textField.layer.shadowOffset = .zero
        textField.layer.shadowOpacity = 1.0
        textField.placeholder = "Фамилия"
        return textField
    }()
    
    var email: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        textField.layer.borderWidth = 0.4
        textField.layer.shadowColor = UIColor.black.cgColor
        textField.layer.shadowRadius = 0.3
        textField.layer.shadowOffset = .zero
        textField.layer.shadowOpacity = 1.0
        textField.placeholder = "email"
        return textField
    }()
    
    var phone: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        textField.layer.borderWidth = 0.4
        textField.layer.shadowColor = UIColor.black.cgColor
        textField.layer.shadowRadius = 0.3
        textField.layer.shadowOffset = .zero
        textField.layer.shadowOpacity = 1.0
        textField.placeholder = "Телефон"
        return textField
    }()
    
    var birthDate: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        textField.layer.borderWidth = 0.4
        textField.layer.shadowColor = UIColor.black.cgColor
        textField.layer.shadowRadius = 0.3
        textField.layer.shadowOffset = .zero
        textField.layer.shadowOpacity = 1.0
        textField.placeholder = "Дата рождения"
        return textField
    }()
    
    var address: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        textField.layer.borderWidth = 0.4
        textField.layer.shadowColor = UIColor.black.cgColor
        textField.layer.shadowRadius = 0.3
        textField.layer.shadowOffset = .zero
        textField.layer.shadowOpacity = 1.0
        textField.placeholder = "Адрес"
        return textField
    }()
    
    let sexArray = ["Мужской", "Женский"]
    
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        backgroundColor = .white
        scrollView = UIScrollView()
        segmentControl = UISegmentedControl(items: sexArray)
        addSubview(scrollView!)
        scrollView?.addSubview(name)
        scrollView?.addSubview(surName)
        scrollView?.addSubview(segmentControl ?? UISegmentedControl())
        scrollView?.addSubview(email)
        scrollView?.addSubview(phone)
        scrollView?.addSubview(birthDate)
        scrollView?.addSubview(address)
        makeConstraintsScrollView()
        makeConstraintsTexFields()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
