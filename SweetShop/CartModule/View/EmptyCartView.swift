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
        //label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var button: UIButton = {
        let button = UIButton()
        button.setTitle("Выбрать товары", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.borderWidth = 0.8
        //button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(buttonHandler(sender:)), for: .touchUpInside)
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
        parentVC?.emptyButtonHandler(sender: sender)
    }
    
    private func createConstraints() {
        button.frame = CGRect(x: 100, y: 200, width: 200, height: 100)
        label.frame = CGRect(x: 30, y: 100, width: Int(UIScreen.main.bounds.width - 30), height: 80)
    }
}
