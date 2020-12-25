//
//  MainSearchBar.swift
//  SweetShop
//
//  Created by Александр Галкин on 10.12.2020.
//

import UIKit

class MainSearchBar: UISearchBar {
    override init(frame: CGRect) {
        super.init(frame: .zero)
        searchBarStyle = .prominent
        placeholder = "Search"
        isTranslucent = false
        barStyle = .default
        showsSearchResultsButton = true
        translatesAutoresizingMaskIntoConstraints = false
        layer.cornerRadius = 10.0
        //searchTextField.frame.size.height = 170
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
