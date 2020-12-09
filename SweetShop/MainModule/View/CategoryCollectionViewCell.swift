//
//  CategoryCollectionViewCell.swift
//  SweetShop
//
//  Created by Александр Галкин on 08.12.2020.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    
    var data: String? {
        didSet {
            label.text = data
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        contentView.addSubview(label)
        label.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        label.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        label.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate var label: UILabel = {
        let lable = UILabel()
        lable.clipsToBounds = true
        lable.backgroundColor = .red
        lable.translatesAutoresizingMaskIntoConstraints = false
        lable.textColor = .black
        lable.font = UIFont.systemFont(ofSize: 15)
        return lable
    }()
}
