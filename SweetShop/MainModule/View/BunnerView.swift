//
//  BannerView.swift
//  SweetShop
//
//  Created by Александр Галкин on 17.12.2020.
//

import UIKit

class BunnerView: UIView {

    var scrollFrame: CGRect = CGRect()
    
    var images: [UIImage] = [] {
        didSet {
            createScrollView(frame: &scrollFrame)
        }
    }
    var imageView: [UIImageView] = []
    var scrollView: UIScrollView = UIScrollView()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        backgroundColor = UIColor(white: 1, alpha: 0)
        translatesAutoresizingMaskIntoConstraints = false
        layer.cornerRadius = 5.0
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowRadius = 1
        layer.shadowOffset = .zero
        layer.shadowOpacity = 1.0
        layer.masksToBounds = true
        addSubview(scrollView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func createScrollView(frame: inout CGRect) {
        frame.origin.x -= 5.0
        frame.origin.y -= 71.0
        scrollView.frame = frame
        scrollView.isPagingEnabled = true
        scrollView.contentSize = CGSize(width: CGFloat(frame.width * CGFloat(images.count)), height: frame.height)
        
        for i in images {
            print(frame)
            let view = createImageView(image: i, frame: frame)
            scrollView.addSubview(view)
            frame.origin.x += frame.size.width
        }
    }
    
    private func createImageView(image: UIImage, frame: CGRect) -> UIImageView {
        let imageView = UIImageView(frame: frame)
        imageView.contentMode = .scaleToFill
        imageView.image = image
        return imageView
    }
    
    private func addingImageViewsToScrollView(imageViews:[UIImageView], scrollView: UIScrollView) -> Int{
        for i in imageViews {
            scrollView.addSubview(i)
        }
        return imageViews.count
    }
}
