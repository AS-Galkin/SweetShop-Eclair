//
//  CategoryCollectionViewCell.swift
//  SweetShop
//
//  Created by Александр Галкин on 08.12.2020.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    
    var image: UIImage? {
        didSet {
            imageView.image = image
        }
    }
    
    var label: String? {
        didSet {
            name.text = label
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        self.contentView.layer.cornerRadius = 5.0
        self.contentView.layer.borderWidth = 0.0
        self.contentView.layer.masksToBounds = true
        self.contentView.backgroundColor = .categoryCollectionLayerColor
        //self.contentView.layer.shadowColor = UIColor.black.cgColor
        //self.contentView.layer.shadowOpacity = 0.3
        contentView.addSubview(imageView)
        contentView.addSubview(name)
        createConstraintImageView()
        createConstraintLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    
    fileprivate var name: UILabel = {
        let label = UILabel()
        //label.clipsToBounds = true
        label.backgroundColor = UIColor(white: 1, alpha: 0)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = .categoryFont
        label.textAlignment = .center
        return label
    }()
    
    fileprivate var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
//        imageView.layer.cornerRadius = 5.0
//        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    func createConstraintImageView() {
        imageView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -30.0).isActive = true
        imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
    }
    
    func createConstraintLabel() {
        name.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        name.widthAnchor.constraint(equalTo: contentView.widthAnchor).isActive = true
        name.topAnchor.constraint(equalTo: imageView.bottomAnchor).isActive = true
        name.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }
}
