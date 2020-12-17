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
        backgroundColor = .brown
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
