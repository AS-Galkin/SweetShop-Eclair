//
//  MainViewController.swift
//  SweetShop
//
//  Created by Александр Галкин on 02.12.2020.
//

import UIKit

class MainViewController: UIViewController {

   fileprivate lazy var categoryCollectionView: UICollectionView = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let myCollectionView: UICollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        myCollectionView.translatesAutoresizingMaskIntoConstraints = false
        myCollectionView.register(CategoryCollectionViewCell.self, forCellWithReuseIdentifier: "MyCell")
        myCollectionView.backgroundColor = UIColor(displayP3Red: 0, green: 0, blue: 0, alpha: 0)
        myCollectionView.dataSource = self
        myCollectionView.delegate = self
        return myCollectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(categoryCollectionView)
        categoryCollectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 40).isActive = true
        categoryCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40).isActive = true
        categoryCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40).isActive = true
        categoryCollectionView.heightAnchor.constraint(equalToConstant: view.frame.height/2).isActive = true
    }
}

extension MainViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 9 // How many cells to display
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let myCell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath) as? CategoryCollectionViewCell {
            myCell.backgroundColor = .red
            myCell.data = "sfsfsf"
            return myCell
        } else {
            let myCell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath)
            myCell.backgroundColor = .red
            return myCell
        }
    }
}

extension MainViewController: UICollectionViewDelegate {
 
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/2.5, height: collectionView.frame.height/2)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       print("User tapped on item \(indexPath.row)")
    }
}
