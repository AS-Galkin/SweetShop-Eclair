//
//  CartView.swift
//  SweetShop
//
//  Created by Александр Галкин on 09.03.2021.
//

import UIKit

class CartView: UIView {
    
    internal var collectionViewIsInEditing: Bool = false
    
    internal var cartCollectionView = CartCollectionView()
    
    internal var parentVC: CartViewController?
    
    internal lazy var dataForUpdate: [CartModel.CartData] = []
    
    internal lazy var images: [UIImage] = []
    internal lazy var loadingView = LoadingView(frame: UIScreen.main.bounds)
    internal lazy var failView = FailView(frame: UIScreen.main.bounds)
    var viewData: DataStates<[CartModel.CartData]> = .initial {
        didSet {
            updateData()
        }
    }
    
    internal var verBbutton: UIButton = {
        let button = UIButton()
        button.setTitle("К оформлению", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.borderWidth = 0.3
        button.backgroundColor = .mainColorWithAplha
        button.layer.cornerRadius = 5.0
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(verbButtonHandler(sender:)), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        cartCollectionView.delegate = self
        addSubview(cartCollectionView)
        addSubview(verBbutton)
        createConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func updateData() {
        switch viewData {
        case .initial:
            break
        case .success(let result):
            if loadingView.isDescendant(of: self) {
                loadingView.removeFromSuperview()
            }
            dataForUpdate = result
            cartCollectionView.dataSource = self
            cartCollectionView.reloadData()
            break
        case .loading(_):
            addSubview(loadingView)
            break
        case .failure(_):
            if loadingView.isDescendant(of: self) {
                loadingView.removeFromSuperview()
            }
            addSubview(failView)
            break
        }
    }
    
    private func createConstraints() {
        cartCollectionView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        cartCollectionView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 5).isActive = true
        cartCollectionView.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        cartCollectionView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -50).isActive = true
        
        verBbutton.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        verBbutton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -10).isActive = true
        verBbutton.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -30).isActive = true
        verBbutton.heightAnchor.constraint(equalToConstant: 45).isActive = true
    }
    
    @objc private func verbButtonHandler(sender: UIButton) {
        parentVC?.verbButtonHandler(sender: sender)
    }
}

extension CartView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataForUpdate.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CartCell", for: indexPath) as? CartCollectionViewCell
        {
            guard let name = dataForUpdate[indexPath.row].name,
                  let description = dataForUpdate[indexPath.row].short_description else {return cell}
            
            defer {
                //cell.layer.
                cell.parentView = self
                cell.productId = dataForUpdate[indexPath.row].product_id
                cell.price = dataForUpdate[indexPath.row].price
                cell.swDescription = name + ".\n" + description
                cell.count = dataForUpdate[indexPath.row].amount ?? 0
                cell.swetnessImage = images[indexPath.row]
                cell.delegate = parentVC
            }
            
            return cell
        } else {
            return CartCollectionViewCell()
        }
    }
}

extension CartView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if let myCell = cell as? CartCollectionViewCell {
            myCell.collectionViewIsEditing = collectionViewIsInEditing
        }
    }
}
