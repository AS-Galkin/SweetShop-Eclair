//
//  UserView.swift
//  SweetShop
//
//  Created by Александр Галкин on 24.02.2021.
//

import UIKit

class UserView: UIView {
    
    weak var delegate: UserViewController?
    private var profileView: ProfileView?
    
    internal var viewData: DataStates<[UserModel.UserData]> = .initial {
        didSet {
            setFields()
        }
    }
    
    internal var name: String? {
        didSet {
            profileView?.nameLabel.text = name
            //setNeedsLayout()
        }
    }
    
    internal var phone: String? {
        didSet {
            profileView?.phoneLabel.text = phone
            //setNeedsLayout()
        }
    }
    
    internal var image: UIImage? {
        didSet {
            profileView?.profileImageView.image = image
            //setNeedsLayout()
        }
    }
    
    internal var ordersButton: UIButton = {
        var button: UIButton = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.borderWidth = 0.6
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowRadius = 1
        button.layer.shadowOffset = .zero
        button.layer.shadowOpacity = 1.0
        button.setTitle("Заказы", for: .normal)
        return button
    }()
    
    internal var helpButton: UIButton = {
        let button: UIButton = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.borderWidth = 0.6
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowRadius = 1
        button.layer.shadowOffset = .zero
        button.layer.shadowOpacity = 1.0
        button.setTitle("Cправка", for: .normal)
        return button
    }()
    
    internal var exitProfileButton: UIButton = {
        let button: UIButton = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.borderWidth = 0.6
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowRadius = 1
        button.layer.shadowOffset = .zero
        button.layer.shadowOpacity = 1.0
        button.setTitleColor(.systemRed, for: .normal)
        button.setTitle("Выход", for: .normal)
        button.addTarget(self, action: #selector(exitButtonHandler(sender:)), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        profileView = ProfileView()
        profileView?.translatesAutoresizingMaskIntoConstraints = false
        addSubview(profileView!)
        addSubview(ordersButton)
        addSubview(helpButton)
        addSubview(exitProfileButton)
        makeConstraintsProfileView()
        profileView?.makeConstraintsLabel()
        makeConstraintsButtons()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    internal func setFields() {
        switch viewData {
        case .initial:
            print("initial load user data")
            break
        case .loading(let result):
            print("Loading load user data")
            break
        case .success(let result):
            print("Sucess load user data")
            name = result[0].f_name
            phone = result[0].phone
            break
        case .failure(let result):

            break
        }
    }
    
   private class ProfileView: UIView {
    
        var nameLabel: UILabel = {
            var label: UILabel = UILabel()
            //label.frame.size.width = UIScreen.main.bounds.width
            label.translatesAutoresizingMaskIntoConstraints = false
            label.text = "Name"
            return label
        }()
    
        var phoneLabel: UILabel = {
            var label: UILabel = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.text = "+78002002222"
            return label
        }()
        
        var profileImageView: UIImageView = {
            var imageView = UIImageView()
            imageView.image = UIImage(named: Icons.profileIcon.rawValue)
            imageView.frame.size.height = UIScreen.main.bounds.height / 3
            imageView.frame.size.width = imageView.frame.size.height
            imageView.layer.cornerRadius = imageView.frame.size.width / 2
            imageView.layer.borderWidth = 0.2
            imageView.clipsToBounds = true
            return imageView
        }()
        
        override init(frame: CGRect) {
            super.init(frame: .zero)
            addSubview(profileImageView)
            addSubview(nameLabel)
            addSubview(phoneLabel)
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        func makeConstraintsLabel() {
            nameLabel.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 1).isActive = true
            nameLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -30).isActive = true
            nameLabel.centerXAnchor.constraint(equalTo: profileImageView.centerXAnchor).isActive = true
            
            phoneLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 1).isActive = true
            phoneLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
            phoneLabel.centerXAnchor.constraint(equalTo: profileImageView.centerXAnchor).isActive = true
        }
    }
    
    @objc private func exitButtonHandler(sender: UIButton) {
        delegate?.exitButtonHandler()
    }
    
    func makeConstraintsProfileView() {
        profileView?.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        profileView?.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        profileView?.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 3 + 60).isActive = true
        profileView?.profileImageView.center.x = CGFloat(self.frame.width / 2 )
    }
    
    func makeConstraintsButtons() {
        ordersButton.topAnchor.constraint(equalTo:(profileView?.bottomAnchor)!, constant: 10).isActive = true
        ordersButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        ordersButton.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true

        helpButton.topAnchor.constraint(equalTo:ordersButton.bottomAnchor, constant: 10).isActive = true
        helpButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        helpButton.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true

        exitProfileButton.topAnchor.constraint(equalTo:helpButton.bottomAnchor, constant: 10).isActive = true
        exitProfileButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        exitProfileButton.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
    }
}
