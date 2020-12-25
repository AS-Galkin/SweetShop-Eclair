//
//  MainScrollView.swift
//  SweetShop
//
//  Created by Александр Галкин on 16.12.2020.
//

import UIKit

class MainScrollView: UIScrollView {

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
