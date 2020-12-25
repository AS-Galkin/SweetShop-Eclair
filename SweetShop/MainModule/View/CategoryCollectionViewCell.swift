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
        self.contentView.layer.cornerRadius = 7.0
        self.contentView.layer.borderWidth = 0.0
        self.contentView.layer.masksToBounds = true
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
        label.textColor = UIColor(ciColor: CIColor(red: 246/255, green: 42/255, blue: 74/255))
        label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        label.textAlignment = .center
        return label
    }()
    
    fileprivate var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    func createConstraintImageView() {
        imageView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        imageView.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        imageView.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
    }
    
    func createConstraintLabel() {
        name.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        name.widthAnchor.constraint(equalTo: contentView.widthAnchor).isActive = true
        name.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
    }
}
