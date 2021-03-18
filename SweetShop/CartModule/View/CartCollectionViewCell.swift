//
//  CartCollectionViewCell.swift
//  SweetShop
//
//  Created by Александр Галкин on 09.03.2021.
//

import UIKit

class CartCollectionViewCell: UICollectionViewCell {
    
    weak var delegate: CartCellDelegate?
    
    internal var collectionViewIsEditing = false {
        didSet{
            deleteView.isHidden = !collectionViewIsEditing
        }
    }
    
    internal var layoutView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 1, alpha: 0)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    internal var deleteView: UIVisualEffectView = {
        var view = UIVisualEffectView()
        view.effect = UIBlurEffect(style: .light)
        view.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        view.layer.cornerRadius = view.frame.width / 2
        view.layer.masksToBounds = true
        view.backgroundColor = .buttonCellColor
        return view
    }()
    
    internal var deleteCellButton: UIButton = {
        var button = UIButton(frame: CGRect(x: 0, y: 0, width: 25, height: 25))
        button.setBackgroundImage(UIImage(named: Icons.deleteIcon.rawValue), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        return button
    }()
    
    internal var parentView: CartView? {
        didSet{
            priceView.cartView = parentView
        }
    }
    
    internal var productId: Int? {
        didSet {
            priceView.productId = productId
        }
    }
    
    internal var swetnessImage: UIImage = UIImage(named: Icons.profileIcon.rawValue)! {
        didSet{
            sweetnessImageView.image = swetnessImage
        }
    }
    
    internal var swDescription: String? {
        didSet{
            descriptionView.sweetDescription = swDescription
        }
    }
    
    internal var price: String? {
        didSet{
            descriptionView.price = price
            priceView.priceOne = price ?? "0"
        }
    }
    
    internal var count: Int = 0 {
        didSet {
            priceView.count = count
        }
    }
    
    private var sweetnessImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleToFill
        imageView.backgroundColor = UIColor(white: 1, alpha: 0)
        imageView.layer.cornerRadius = 5.0
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    private var descriptionView: DescriptionView = {
        let view = DescriptionView()
        view.backgroundColor = UIColor(white: 1, alpha: 0)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var priceView: PriceView = {
        let view = PriceView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override init(frame: CGRect) {
        super.init(frame: .zero)
        layoutView.backgroundColor = .cartCellColor
        layoutView.layer.cornerRadius = 5.0
        layoutView.layer.masksToBounds = true
        deleteCellButton.addTarget(self, action: #selector(deleteButtonHandler(sender:)), for: .touchUpInside)
        deleteView.isHidden = !collectionViewIsEditing
        deleteCellButton.center = deleteView.center
        
        deleteView.contentView.addSubview(deleteCellButton)
        contentView.addSubview(layoutView)
        layoutView.addSubview(sweetnessImageView)
        layoutView.addSubview(descriptionView)
        layoutView.addSubview(priceView)
        contentView.addSubview(deleteView)
        createConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private class DescriptionView: UIView {
        
        var sweetDescription: String? {
            didSet{
                descriptionTextView.text = sweetDescription
            }
        }
        var price: String? {
            didSet{
                priceLabel.text = "Цена за шт: \(price ?? "0")\u{20BD}"
            }
        }
        
        private var descriptionTextView = UITextView()
        private var priceLabel = UILabel()
        
        override init(frame: CGRect) {
            super.init(frame: .zero)
            descriptionTextView.translatesAutoresizingMaskIntoConstraints = false
            descriptionTextView.backgroundColor = UIColor(white: 1, alpha: 0)
            priceLabel.translatesAutoresizingMaskIntoConstraints = false
            priceLabel.font = UIFont(name: "AvenirNext-UltraLight", size: 11.0)
            priceLabel.lineBreakMode = .byWordWrapping
            priceLabel.numberOfLines = 0
            addSubview(descriptionTextView)
            addSubview(priceLabel)
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        func createConstraints() {
            descriptionTextView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
            descriptionTextView.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
            descriptionTextView.heightAnchor.constraint(equalTo: self.heightAnchor, constant: -60).isActive = true
            
            priceLabel.topAnchor.constraint(equalTo: descriptionTextView.bottomAnchor, constant: 5).isActive = true
            priceLabel.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
            priceLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        }
    }
    
    private class PriceView: UIView {
        
        var cartView: CartView?
        var productId: Int?
        
        var count: Int = 0 {
            didSet {
                countLabel.text = String(count)
                if let price = Float16(priceOne) {
                    summPrice = Float16(count) * price
                }
            }
        }
        
        var priceLabel: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.font = UIFont(name: "AvenirNext-Medium", size: 16.0)
            label.lineBreakMode = .byWordWrapping
            label.numberOfLines = 0
            label.textAlignment = .center
            return label
        }()
        
        var countLabel: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.textAlignment = .center
            label.font = UIFont(name: "AppleColorEmoji", size: 14)
            return label
        }()
        
        var priceOne: String = "0"
        
        var summPrice: Float16 = 0 {
            didSet {
                priceLabel.text = "Итого: \(summPrice)\u{20BD}"
                setNeedsLayout()
            }
        }
        
        var plusButton: UIButton = {
            let button = UIButton()
            button.translatesAutoresizingMaskIntoConstraints = false
            button.setTitle("+", for: .normal)
            button.setTitleColor(.black, for: .normal)
            button.setTitleColor(.gray, for: .selected)
            button.titleLabel?.font = UIFont(name: "AvenirNext-HeavyItalic", size: 16)
            button.addTarget(self, action: #selector(plusButtonHandler), for: .touchUpInside)
            button.layer.cornerRadius = 10.0
            button.backgroundColor = .buttonCellColor
            return button
        }()
        var minusButton: UIButton = {
            let button = UIButton()
            button.translatesAutoresizingMaskIntoConstraints = false
            button.setTitle("-", for: .normal)
            button.setTitleColor(.black, for: .normal)
            button.setTitleColor(.gray, for: .selected)
            button.titleLabel?.font = UIFont(name: "AvenirNext-HeavyItalic", size: 16)
            button.addTarget(self, action: #selector(minusButtonHandler), for: .touchUpInside)
            button.layer.cornerRadius = 10.0
            button.backgroundColor = .buttonCellColor
            return button
        }()
        
        override init(frame: CGRect) {
            super.init(frame: .zero)
            priceLabel.text = "Итого: \(summPrice)"
            countLabel.text = String(count)
            addSubview(priceLabel)
            addSubview(plusButton)
            addSubview(minusButton)
            addSubview(countLabel)
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        @objc func plusButtonHandler() {
            count += 1
            if let price = Float16(priceOne) {
                summPrice = price * Float16(count)
                guard let _ = cartView,
                      let _ = productId else {return}
                cartView?.parentVC?.cellButtonHandler(productId: productId!, amount: Int(count))
            }
        }
        
        @objc func minusButtonHandler() {
            if count > 0 {
                count -= 1
                if let price = Float16(priceOne) {
                    summPrice = price * Float16(count)
                    guard let _ = cartView,
                          let _ = productId else {return}
                    
                    cartView?.parentVC?.cellButtonHandler(productId: productId!, amount: Int(count))
                }
            } else {
                return
            }
        }
        
        func createConstraints() {

            priceLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
            priceLabel.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -138).isActive = true
            priceLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5.0).isActive = true
            priceLabel.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
            priceLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
            
            minusButton.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
            minusButton.leadingAnchor.constraint(equalTo: priceLabel.trailingAnchor, constant: 11.0).isActive = true
            minusButton.widthAnchor.constraint(equalToConstant: 40).isActive = true
            minusButton.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
            minusButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -15).isActive = true
            
            countLabel.leadingAnchor.constraint(equalTo: minusButton.trailingAnchor).isActive = true
            countLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
            countLabel.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
            countLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -15).isActive = true
            countLabel.widthAnchor.constraint(equalToConstant: 30).isActive = true
            
            plusButton.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
            plusButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -12).isActive = true
            plusButton.widthAnchor.constraint(equalToConstant: 40).isActive = true
            plusButton.topAnchor.constraint(equalTo: priceLabel.topAnchor).isActive = true
            plusButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -15).isActive = true
         }
    }
    
    @objc internal func deleteButtonHandler(sender: UIButton) {
        delegate?.deleteCell(cell: self)
    }
    
    private func createConstraints() {
        
        layoutView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        layoutView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true
        layoutView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        layoutView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
        
        descriptionView.topAnchor.constraint(equalTo: layoutView.topAnchor).isActive = true
        descriptionView.trailingAnchor.constraint(equalTo: layoutView.trailingAnchor).isActive = true
        descriptionView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        descriptionView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        priceView.widthAnchor.constraint(equalTo: layoutView.widthAnchor).isActive = true
        priceView.bottomAnchor.constraint(equalTo:layoutView.bottomAnchor).isActive = true
        priceView.topAnchor.constraint(equalTo: descriptionView.bottomAnchor).isActive = true
        
        sweetnessImageView.leadingAnchor.constraint(equalTo: layoutView.leadingAnchor).isActive = true
        sweetnessImageView.trailingAnchor.constraint(equalTo: descriptionView.leadingAnchor, constant:  -5).isActive = true
        sweetnessImageView.topAnchor.constraint(equalTo: layoutView.topAnchor).isActive = true
        sweetnessImageView.bottomAnchor.constraint(equalTo: descriptionView.bottomAnchor, constant: -10).isActive = true
        
        descriptionView.createConstraints()
        priceView.createConstraints()
    }
}
