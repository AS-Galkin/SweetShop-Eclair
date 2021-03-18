//
//  SettingView.swift
//  SweetShop
//
//  Created by Александр Галкин on 25.12.2020.
//

import UIKit

class SettingUserView: UIView {
    
    internal var viewData: DataStates<[UserModel.UserData]> = .initial {
        didSet{
            setFields()
        }
    }
    
    var scrollView: UIScrollView?
    var segmentControl: UISegmentedControl?
    
    internal var personalDataLabel: UILabel = {
        let label = UILabel()
        label.text = "Личные данные"
        label.font = UIFont(name: "AlNile-Bold", size: 15)
        label.textColor = .alnileBoldColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    internal var contactLabel: UILabel = {
        let label = UILabel()
        label.text = "Контактные данные"
        label.font = UIFont(name: "AlNile-Bold", size: 15)
        label.textColor = .alnileBoldColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var name: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.font = UIFont(name: "Avenir-Light", size: 12.0)
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
        textField.font = UIFont(name: "Avenir-Light", size: 12.0)
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
        textField.font = UIFont(name: "Avenir-Light", size: 12.0)
        textField.layer.borderWidth = 0.4
        textField.layer.shadowColor = UIColor.black.cgColor
        textField.layer.shadowRadius = 0.3
        textField.layer.shadowOffset = .zero
        textField.layer.shadowOpacity = 1.0
        textField.placeholder = "email"
        textField.isUserInteractionEnabled = false
        return textField
    }()
    
    var phone: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.font = UIFont(name: "Avenir-Light", size: 12.0)
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
        textField.font = UIFont(name: "Avenir-Light", size: 12.0)
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
        textField.font = UIFont(name: "Avenir-Light", size: 12.0)
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
        scrollView?.addSubview(personalDataLabel)
        scrollView?.addSubview(contactLabel)
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
    
    internal func setFields() {
        switch viewData {
        case .initial:
            break
        case .success(let result):
            name.text = result[0].f_name
            surName.text = result[0].s_name
            email.text = result[0].email
            phone.text = result[0].phone
            birthDate.text = String(result[0].birthday ?? 0)
            address.text = result[0].address
            switch result[0].gender {
            case "Мужской":
                segmentControl?.selectedSegmentIndex = 0
                break
            case "Женский":
                segmentControl?.selectedSegmentIndex = 1
                break
            default:
                break
            }
            break
        case .loading(let result):
            break
        case .failure(let result):
            break
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
