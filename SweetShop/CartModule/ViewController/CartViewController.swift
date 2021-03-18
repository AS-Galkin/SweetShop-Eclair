//
//  CartViewController.swift
//  SweetShop
//
//  Created by Александр Галкин on 03.12.2020.
//

import UIKit

protocol CartCellDelegate: class {
    func deleteCell(cell: UICollectionViewCell)
}

class CartViewController: UICollectionViewController {
    
    private var indexPathsCollectionView: [IndexPath]?
    internal var viewModel: CartViewModel = CartViewModel()
    internal var userId: Int?
    internal var verbVC: VerbViewController?
    internal var cartCount = 0 {
        didSet {
            downloadCartData(userID: userId!)
        }
    }
    
    private var chooseButton: UIBarButtonItem {
        let button = UIBarButtonItem(image: nil, style: .done, target: self, action: nil)
        button.title = "Выбрать"
        button.tintColor = .white
        button.target = self
        button.action = #selector(collectionViewStartEditing)
        return button
    }
    
    private var chooseIsReadyButton: UIBarButtonItem {
        let button = UIBarButtonItem(image: nil, style: .done, target: self, action: nil)
        button.title = "Готово"
        button.tintColor = .white
        button.target = self
        button.action = #selector(collectionViewEndEditing)
        return button
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.rightBarButtonItem = chooseButton
        if let user = userId {
            downloadCartData(userID: user)
            setHowUpdateCartViewData()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(true)
        getUserId()
        if let user = userId {
            self.view = CartView()
            self.view.backgroundColor = .white
            typeCastCartView().parentVC = self
            updateViewData()
        }
        self.navigationItem.rightBarButtonItem = chooseButton
        if let badgeCount = viewModel.productsInCartArray?.count {
            tabBarItem.badgeValue = String(badgeCount)
        }
    }
    
    override func loadView() {
        getUserId()
        if let _ = userId {
            self.view = CartView()
            typeCastCartView().parentVC = self
            viewModel.parentVC = self
        } else {
            self.view = EmptyCartView()
            typeCastEmptyCartView().parentVC = self
        }
    }
    
    private func getUserId() {
        if let savedPerson = UserDefaults.standard.object(forKey: "SavedPerson") as? Data {
            let decoder = JSONDecoder()
            if let person = try? decoder.decode([UserModel.UserData]?.self, from: savedPerson) as [UserModel.UserData]? {
                userId = person[0].id
            } else {
                if let person = try? decoder.decode(UserModel.UserData?.self, from: savedPerson) as UserModel.UserData? {
                    userId = person.id
                }
            }
        }
    }
    
    @objc private func collectionViewStartEditing() {
        setEditing(true, animated: true)
        navigationItem.rightBarButtonItem = chooseIsReadyButton
    }
    
    @objc private func collectionViewEndEditing() {
        setEditing(false, animated: true)
        navigationItem.rightBarButtonItem = chooseButton
    }
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        typeCastCartView().collectionViewIsInEditing = editing
        indexPathsCollectionView = getIndexPathsCollectionView(collectionView: typeCastCartView().cartCollectionView)
        if let indexPathsCollectionView = indexPathsCollectionView {
            for index in indexPathsCollectionView {
                if let cell = typeCastCartView().cartCollectionView.cellForItem(at: index) as? CartCollectionViewCell{
                    cell.collectionViewIsEditing = editing
                }
            }
        }
    }
    
    private func getIndexPathsCollectionView(collectionView: UICollectionView) -> [IndexPath] {
        var indexes: [IndexPath] = []
        for s in 0..<collectionView.numberOfSections {
            for t in 0..<collectionView.numberOfItems(inSection: s) {
                indexes.append(IndexPath(item: t, section: s))
            }
        }
        return indexes
    }
}
