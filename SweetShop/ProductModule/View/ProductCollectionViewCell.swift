//
//  ProductCollectionViewCell.swift
//  SweetShop
//
//  Created by Александр Галкин on 25.12.2020.
//

import UIKit

class ProductCollectionViewCell: UICollectionViewCell {
    
    private var viewCell: ViewCell?
    
    var imageCell: UIImage? {
        didSet {
            updateCell()
        }
    }
    
    var descriptionCell: String? {
        didSet {
            updateCell()
        }
    }
    
    var weight: Float? {
        didSet {
            updateCell()
        }
    }
    
    var price: Float? {
        didSet {
            updateCell()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        viewCell = ViewCell()
        self.layer.cornerRadius = 5.0
        self.layer.masksToBounds = true
        self.layer.borderWidth = 0.2
        contentView.addSubview(viewCell ?? ViewCell())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private class ViewCell: UIView {
        
        var imageView: UIImageView?
        var descriptionLabel: UILabel?
        var priceLabel: UILabel?
        var weightLabel: UILabel?
        
        override init(frame: CGRect) {
            super.init(frame: .zero)
            imageView = UIImageView()
            addSubview(imageView ?? UIImageView())
            addSubview(descriptionLabel ?? UILabel())
            addSubview(priceLabel ?? UILabel())
            addSubview(weightLabel ?? UILabel())
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }
    
    func updateCell() {
        viewCell?.imageView?.image = self.imageCell
        viewCell?.descriptionLabel?.text = self.descriptionCell
        viewCell?.priceLabel?.text = String(self.price!)
        viewCell?.weightLabel?.text = String(self.weight!)
    }
}
