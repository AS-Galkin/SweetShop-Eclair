//
//  EmptyCartView.swift
//  SweetShop
//
//  Created by Александр Галкин on 09.03.2021.
//

import UIKit

class EmptyCartView: UIView {
    
    weak var parentVC: CartViewController?
    
    private var label: UILabel = {
        let label = UILabel()
        label.text = "В вашей корзине пока ничего нет"
        label.font = .emptyCartFont
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var button: UIButton = {
        let button = UIButton()
        button.setTitle("Выбрать товары", for: .normal)
        button.titleLabel?.font = UIFont(name: "Cochin ", size: 15)
        button.titleLabel?.lineBreakMode = .byWordWrapping
        button.titleLabel?.numberOfLines = 0
        button.titleLabel?.textAlignment = .center
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .mainColorWithAplha
        button.layer.cornerRadius = 5.0
        button.addTarget(self, action: #selector(buttonHandler(sender:)), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        addSubview(label)
        addSubview(button)
        createConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func buttonHandler(sender: UIButton) {
        parentVC?.showCategoryViewController()
    }
    
    private func createConstraints() {
        label.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -100).isActive = true
        label.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        label.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 2).isActive = true
        label.heightAnchor.constraint(equalToConstant: 150).isActive = true
        
        button.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        button.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        button.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 3).isActive = true
        button.heightAnchor.constraint(equalToConstant: 80).isActive = true
    }
}
