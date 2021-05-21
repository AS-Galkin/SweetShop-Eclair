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
    internal lazy var manufacturerLabel: UILabel = UILabel()
    internal lazy var weightLabel: UILabel = UILabel()
    
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
        textView.font = UIFont.systemFont(ofSize: 14, weight: .light)
        textView.textAlignment = .justified
        textView.attributedText = NSMutableAttributedString().bold("Описание\n").normal("\(product?.productData?.sweetness?.swDescription ?? "No data")")
        
        productNameLabel.translatesAutoresizingMaskIntoConstraints = false
        productNameLabel.lineBreakMode = .byWordWrapping
        productNameLabel.numberOfLines = 0
        productNameLabel.font = UIFont.systemFont(ofSize: 22, weight: .semibold)
        productNameLabel.text = (product?.productData?.sweetness?.swShortDescription) ?? "No data"
        scrollView.addSubview(productNameLabel)
        
        manufacturerLabel.font = UIFont.systemFont(ofSize: 16, weight: .light)
        manufacturerLabel.attributedText = NSMutableAttributedString().bold("Производитель: ").normal("\(product?.productData?.manufacturer?.manName ?? "No data")")
        
        weightLabel.font = UIFont.systemFont(ofSize:16, weight: .light)
        weightLabel.attributedText = NSMutableAttributedString().bold("Вес: ").normal("\(product?.productData?.sweetness?.swWeight ?? "No data") грамм")
        
        scrollView.addSubview(manufacturerLabel)
        scrollView.addSubview(weightLabel)
        
        makeConstraintsProductNameLabel()
        makeLableConstraints()
        scrollView.addSubview(textView)
        makeTextViewConstraints()
    }
    
    internal class AddToCartView: UIView {
        
        var parentViewController: DetailProductViewController?
        internal weak var buttonDelegate: AddProductToCart?
        internal var cartData: CartModel.CartData?
        
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
            addToCartButton.backgroundColor = .mainColorWithAplha
            addToCartButton.layer.cornerRadius = 13.0
        }
        
        func makeConstraints() {
            addToCartButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10).isActive = true
            addToCartButton.frame.size.width = self.frame.size.width / 2 + 30
           // addToCartButton.frame.size.height = self.frame.size.height - 10
            addToCartButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 9).isActive = true
            addToCartButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -9).isActive = true
            
            priceLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
            priceLabel.frame.size.width = self.frame.size.width / 4
            priceLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 5).isActive = true
            priceLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5).isActive = true
            
            weightLabel.leadingAnchor.constraint(equalTo: priceLabel.trailingAnchor, constant: 15).isActive = true
            weightLabel.frame.size.width = self.frame.size.width / 4
            weightLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 5).isActive = true
            weightLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5).isActive = true
        }
        
        @objc func cartButtonHandler(sender: UIButton) {
            //parentViewController?.cartButtonHandler()
            if let cartData = self.cartData {
                buttonDelegate?.addProduct(product: cartData)
                sender.setTitle(" +Добавить еще ", for: .normal)
            }
        }

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
