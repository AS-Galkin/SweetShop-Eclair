//
//  ProductCollectionViewCell.swift
//  SweetShop
//
//  Created by Александр Галкин on 25.12.2020.
//

import UIKit

class ProductCollectionViewCell: UICollectionViewCell {
    
    var parentVC: ProductViewController?
    
    private var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.masksToBounds = false
        imageView.layer.cornerRadius = 3.0
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private var descriptionLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = UIColor(white: 1, alpha: 0)
        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: 7, weight: .semibold)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var priceButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(red: 88/255, green: 46/255, blue: 165/255, alpha: 0.9)
        button.layer.cornerRadius = 13.0
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private var weightLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = UIColor(white: 1, alpha: 0)
        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: 9, weight: .semibold)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var imageCell: UIImage? {
        didSet {
            imageView.layer.cornerRadius = 10.0
            imageView.image = self.imageCell
        }
    }
    
    var descriptionCell: String? {
        didSet {
            descriptionLabel.text = self.descriptionCell
        }
    }
    
    var weight: String? {
        didSet {
            if let weight = self.weight {
                weightLabel.text = weight + " г"
            } else {
                weightLabel.text = "0 г"
            }
        }
    }
    
    var price: String? {
        didSet {
            if let price = self.price {
                priceButton.setTitle(" + " + price + " \u{20BD} ", for: .normal)
                priceButtonSetting()
            } else {
                priceButton.setTitle(" + 0 \u{20BD} ", for: .normal)
                priceButtonSetting()
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)

        self.layer.masksToBounds = true
        self.layer.borderWidth = 0.0
        
        contentView.addSubview(imageView)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(priceButton)
        contentView.addSubview(weightLabel)
        createConstraintsImageView()
        createConstraintsDescriptionLabel()
        createConstraintsPriceButton()
        createConstraintsWeightLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func priceButtonHandler(sender: UIButton) {
        parentVC?.cellPriceButtonHandler()
    }
    
    private func priceButtonSetting() {
        priceButton.titleLabel?.backgroundColor = UIColor(white: 1, alpha: 0)
        priceButton.titleLabel?.textColor = UIColor.black
        priceButton.titleLabel?.font = UIFont.systemFont(ofSize: 11, weight: .semibold)
        priceButton.titleLabel?.textAlignment = .center
        priceButton.addTarget(self, action: #selector(priceButtonHandler(sender:)), for: .touchUpInside)
    }
        
    private func createConstraintsImageView() {
        imageView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -50).isActive = true
        imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
    }
    
    private func createConstraintsDescriptionLabel() {
        descriptionLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 7).isActive = true
        descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
    }
    
    private func createConstraintsPriceButton() {
        priceButton.topAnchor.constraint(equalTo: descriptionLabel.topAnchor, constant: 12).isActive = true
        priceButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15).isActive = true
        priceButton.frame.size.width = contentView.frame.size.width / 2
        
    }
    
    private func createConstraintsWeightLabel() {
        weightLabel.topAnchor.constraint(equalTo: descriptionLabel.topAnchor, constant: 15).isActive = true
        weightLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15).isActive = true
        weightLabel.frame.size.width = contentView.frame.size.width / 2
    }
}
