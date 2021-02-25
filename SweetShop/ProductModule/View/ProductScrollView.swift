//
//  ProductScrollView.swift
//  SweetShop
//
//  Created by Александр Галкин on 17.02.2021.
//

import UIKit

class ProductScrollView: UIScrollView {
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        settingScroll()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func settingScroll() {
        let scrollRect = UIScreen.main.bounds
        self.showsVerticalScrollIndicator = false
        self.contentSize = CGSize(width: scrollRect.width, height: scrollRect.height)
        self.backgroundColor = UIColor(white: 1, alpha: 0)
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
