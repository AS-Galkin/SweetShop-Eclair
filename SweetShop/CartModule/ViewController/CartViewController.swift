//
//  CartViewController.swift
//  SweetShop
//
//  Created by Александр Галкин on 03.12.2020.
//

import UIKit

protocol CartCellDelegate: AnyObject {
    func deleteCell(cell: UICollectionViewCell)
}

class CartViewController: UICollectionViewController {
    
    internal weak var categoryVC: CategoryViewController?
    private var indexPathsCollectionView: [IndexPath]?
    internal var viewModel: CartViewModel = CartViewModel()
    internal var userId: Int?
    internal var verbVC: VerbViewController?
    private var cartView: CartView?
    private var emptyCartView: EmptyCartView?
    
    internal var emptycartIsHidden = true {
        didSet {
            emptyCartView?.isHidden = emptycartIsHidden
            chooseButtonIsEnable = false
            self.tabBarItem.badgeValue = nil
        }
    }
    
    internal var chooseButtonIsEnable = true {
        didSet {
            chooseButton.isEnabled = chooseButtonIsEnable
            self.navigationItem.rightBarButtonItem = chooseButton
        }
    }
    
    internal var badgeCount: Int? {
        didSet {
            self.tabBarItem.badgeValue = String(badgeCount!)
            self.tabBarItem.badgeColor = .red
            view.setNeedsLayout()
        }
    }
    
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
        button.isEnabled = chooseButtonIsEnable
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
        if let _ = userId {
            setHowUpdateCartViewData()
        } else {
            setHowUpdateCartViewData()
            emptycartIsHidden = false
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationItem.rightBarButtonItem = chooseButton
        if let user = userId {
            downloadCartData(userID: user)
        } else {
            getUserId()
            if let user = userId {
                downloadCartData(userID: user)
            }
        }
    }
    
    override func loadView() {
        getUserId()
        viewModel.parentVC = self
        emptyCartView = EmptyCartView()
        emptyCartView?.parentVC = self
        emptyCartView?.translatesAutoresizingMaskIntoConstraints = false
        emptyCartView?.isHidden = emptycartIsHidden
        createCartView()
        self.view.addSubview(emptyCartView!)
        positionEmptycart()
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
    
    internal func positionEmptycart () {
        emptyCartView?.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
        emptyCartView?.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        emptyCartView?.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        emptyCartView?.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        emptyCartView?.backgroundColor = .white
    }
    
    internal func createCartView() {
        cartView = CartView()
        self.view = cartView
        typeCastCartView().parentVC = self
        self.view.backgroundColor = .white
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
