//
//  ExtensionDetailProductView.swift
//  SweetShop
//
//  Created by Александр Галкин on 17.02.2021.
//

import Foundation
import UIKit

extension DetailProductView {
    
    internal func makeLableConstraints() {
        manufacturerLabel.translatesAutoresizingMaskIntoConstraints = false
        weightLabel.translatesAutoresizingMaskIntoConstraints = false
        
        manufacturerLabel.topAnchor.constraint(equalTo: productNameLabel.bottomAnchor, constant: 5).isActive = true
        manufacturerLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        manufacturerLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 10).isActive = true
        manufacturerLabel.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 2 - 10).isActive = true
        
        weightLabel.topAnchor.constraint(equalTo: productNameLabel.bottomAnchor, constant: 5).isActive = true
        weightLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        weightLabel.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 2  - 10).isActive = true
        weightLabel.leadingAnchor.constraint(equalTo: manufacturerLabel.trailingAnchor, constant: 5).isActive = true
        
    }
    
    internal func makeImageViewConstraints() {
        imageView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        imageView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
    }
    
    internal func makeTextViewConstraints() {
        textView.topAnchor.constraint(equalTo: manufacturerLabel.bottomAnchor, constant: 5).isActive = true
        textView.bottomAnchor.constraint(equalTo: addToCartView.topAnchor, constant: -5).isActive = true
        textView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 5).isActive = true
        textView.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: -10).isActive = true
        
    }
    internal func makeConstraintsScrollView() {
        scrollView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        scrollView.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
    
    internal func makeConstraintAddToCartView() {
        addToCartView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true 
        addToCartView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        addToCartView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
    
    internal func makeConstraintsProductNameLabel() {
        productNameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10).isActive = true
        productNameLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        productNameLabel.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        productNameLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 10).isActive = true
    }
}
