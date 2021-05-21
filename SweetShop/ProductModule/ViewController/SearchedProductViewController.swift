//
//  SearchedProductViewController.swift
//  SweetShop
//
//  Created by Александр Галкин on 20.05.2021.
//

import UIKit

class SearchedProductViewController: ProductViewController {
    
    var searchProduct: String?
    
    override func downloadJsonData() {
        let param = ["search":searchProduct ?? "Торт"]
        productViewModel.downloadJson(parameters: param, url: URIString.downloadURL.rawValue + URIString.apiSearchURN.rawValue)
    }

}
