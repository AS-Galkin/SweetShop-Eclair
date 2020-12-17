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
        createConstraintCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    
    fileprivate var label: UILabel = {
        let label = UILabel()
        label.clipsToBounds = true
        label.backgroundColor = .red
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()
    
    func createConstraintCell() {
        label.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        label.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        label.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
    }
}