//
//  DetailProductView.swift
//  SweetShop
//
//  Created by Александр Галкин on 16.02.2021.
//

import UIKit

class DetailProductView: UIView {
    
    internal var parentVC: DetailProductViewController?
    
    internal var product: ProductModel.ProductData? {
        didSet {
            settingScrollView()
        }
    }
    internal lazy var scrollView: ProductScrollView = ProductScrollView()
    internal lazy var imageView: UIImageView = UIImageView()
    internal lazy var textView: UITextView = UITextView()
    internal lazy var addToCartView: AddToCartView = AddToCartView()
    internal lazy var productNameLabel: UILabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        //UIView.appearance().backgroundColor = .white
        backgroundColor = .white
        addToCartView.backgroundColor = .white
        textView.backgroundColor = .white
        addSubview(scrollView)
        makeConstraintsScrollView()
    }
    
    
    private func settingScrollView() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(imageView)
        makeImageViewConstraints()
        
        addToCartView.translatesAutoresizingMaskIntoConstraints = false
        addToCartView.parentViewController = parentVC
        addToCartView.layer.shadowColor = UIColor.black.cgColor
        addToCartView.layer.shadowRadius = 2
        addToCartView.layer.shadowOffset = .zero
        addToCartView.layer.shadowOpacity = 1.0
        scrollView.addSubview(addToCartView)
        makeConstraintAddToCartView()
        addToCartView.makeConstraints()
        addToCartView.settingCartButton()
        
        if let price = product?.productData?.price {
            addToCartView.settingPriceLabel(data: price + " \u{20BD}")
        }
        
        if let weight = product?.productData?.sweetness?.swWeight {
            addToCartView.settingWeightLabel(data: weight + " г")
        }
        
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.text = (product?.productData?.sweetness?.swDescription) ?? "No data"
        
        productNameLabel.translatesAutoresizingMaskIntoConstraints = false
        productNameLabel.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        productNameLabel.text = (product?.productData?.sweetness?.swName) ?? "No data"
        scrollView.addSubview(productNameLabel)
        makeConstraintsProductNameLabel()
        scrollView.addSubview(textView)
        makeTextViewConstraints()
    }
    
    internal class AddToCartView: UIView {
        
        var parentViewController: DetailProductViewController?
        
        lazy var addToCartButton: UIButton = UIButton()
        lazy var priceLabel: UILabel = UILabel()
        lazy var weightLabel: UILabel = UILabel()
        
        override init(frame: CGRect) {
            super.init(frame: .zero)
            addSubview(addToCartButton)
            addSubview(priceLabel)
            addSubview(weightLabel)
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        func settingPriceLabel(data: String) {
            priceLabel.translatesAutoresizingMaskIntoConstraints = false
            priceLabel.text = data
        }
        
        func settingWeightLabel(data: String) {
            weightLabel.translatesAutoresizingMaskIntoConstraints = false
            weightLabel.font = UIFont.systemFont(ofSize: 11, weight: .light)
            weightLabel.text = data
        }
        
        func settingCartButton() {
            addToCartButton.translatesAutoresizingMaskIntoConstraints = false
            addToCartButton.addTarget(self, action: #selector(cartButtonHandler(sender:)), for: .touchUpInside)
            addToCartButton.setTitle(" + Добавить ", for: .normal)
            addToCartButton.titleLabel?.textAlignment = .center
            addToCartButton.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
            addToCartButton.backgroundColor = UIColor(red: 88/255, green: 46/255, blue: 165/255, alpha: 0.9)
            addToCartButton.layer.cornerRadius = 13.0
        }
        
        func makeConstraints() {
            //addToCartButton.clipsToBounds = false
            addToCartButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5).isActive = true
            addToCartButton.frame.size.width = self.frame.size.width / 2
           // addToCartButton.frame.size.height = self.frame.size.height - 10
            addToCartButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 5).isActive = true
            addToCartButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5).isActive = true
            
            priceLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5).isActive = true
            priceLabel.frame.size.width = self.frame.size.width / 4
            priceLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 5).isActive = true
            priceLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5).isActive = true
            
            weightLabel.leadingAnchor.constraint(equalTo: priceLabel.trailingAnchor, constant: 15).isActive = true
            weightLabel.frame.size.width = self.frame.size.width / 4
            weightLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 5).isActive = true
            weightLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5).isActive = true
        }
        
        @objc func cartButtonHandler(sender: UIButton) {
            parentViewController?.cartButtonHandler()
        }

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
