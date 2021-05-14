//
//  LoadingView.swift
//  SweetShop
//
//  Created by Александр Галкин on 14.05.2021.
//

import UIKit

class FailView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor(white: 1, alpha: 0.0)
        failLabel.frame.size.height = 80
        failLabel.frame.size.width = 240
        failLabel.center = CGPoint(
            x: bounds.midX,
            y: bounds.midY
        )
        refreshButton.frame.size.height = 50
        refreshButton.frame.size.width = 240
        refreshButton.center = CGPoint(
            x: bounds.midX,
            y: bounds.midY + 90
        )
        addSubview(failLabel)
        addSubview(refreshButton)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var failLabel: UILabel = {
        let label = UILabel()
        label.text = "Ошибка загрузки данных"
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.font = .emptyCartFont
        label.textColor = .black
        label.textAlignment = .center
        label.autoresizingMask = [
            .flexibleLeftMargin, .flexibleRightMargin,
            .flexibleTopMargin, .flexibleBottomMargin
        ]
        return label
    }()
    
    var refreshButton: UIButton = {
        let button = UIButton()
        button.setTitle("Повторить", for: .normal)
        button.backgroundColor = .mainColorWithAplha
        button.layer.cornerRadius = 5.0
        button.setTitleColor(UIColor(white: 1, alpha: 1), for: .normal)
        return button
    }()
}
