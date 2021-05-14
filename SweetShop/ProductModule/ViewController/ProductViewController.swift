//
//  ProductViewController.swift
//  SweetShop
//
//  Created by Александр Галкин on 03.12.2020.
//

import UIKit

protocol AddProductToCart: class {
    func addProduct(product: CartModel.CartData)
}

class ProductViewController: UIViewController {

    var selectedProduct: CategoryModel.CategoryData?
    var productViewModel: ProductViewModel = ProductViewModel()
    var detailProductViewController: DetailProductViewController!
    var cartTabBarItem: UITabBarItem?
    var countTabBarItemBadge: Int = 0
    var cartVC: CartViewController?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: Icons.sortIcon.rawValue), style: .plain, target: self, action: #selector(sortButtonHandler))
        downloadJsonData()
        bindCollectionViewDelegate()
    }
    
    override func loadView() {
        self.view = ProductView()
        productViewModel.parentVC = self
        self.typeCastView().parentVC = self
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        updateProductView()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
    }
    
    @objc func sortButtonHandler() {
        let sort = SortViewController()
        sort.parentVC = self
        sort.preferredContentSize = CGSize(width: 200, height: 200)
        sort.modalPresentationStyle = .overCurrentContext
        sort.modalTransitionStyle = .crossDissolve
        self.present(sort, animated: true, completion: nil)
    }
    
    func sortVCHandler(sortData: Sort) {
        self.dismiss(animated: true, completion: nil)
        switch sortData.rule {
        case "Сначала дешевле":
            let _: [ProductModel.ProductData]? = productViewModel.sortModel(sortClosure: { left, right in
                guard let lhs = left.productData?.price,
                      let rhs = right.productData?.price else {return false}
                return Double(lhs)! < Double(rhs)!
            })
            break
        case "Сначала дороже":
            let _: [ProductModel.ProductData]? = productViewModel.sortModel(sortClosure: { left, right in
                guard let lhs = left.productData?.price,
                      let rhs = right.productData?.price else {return false}
                return Double(lhs)! > Double(rhs)!
            })
            break
        case "По популярности":
            break
        case "По алфавиту":
            let _: [ProductModel.ProductData]? = productViewModel.sortModel(sortClosure: { left, right in
                guard let lhs = left.productData?.sweetness?.swName,
                      let rhs = right.productData?.sweetness?.swName else {return false}
                return lhs < rhs
            })
            break
        default:
            break
        }
    }
}
