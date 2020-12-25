//
//  BannerView.swift
//  SweetShop
//
//  Created by Александр Галкин on 17.12.2020.
//

import UIKit

class BunnerView: UIView {

    override init(frame: CGRect) {
        super.init(frame: .zero)
        backgroundColor = UIColor(white: 1, alpha: 0)
        translatesAutoresizingMaskIntoConstraints = false
        layer.cornerRadius = 5.0
        layer.borderWidth = 0.2
        layer.masksToBounds = true
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
