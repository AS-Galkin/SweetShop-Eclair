//
//  ExtensionUserViewController.swift
//  SweetShop
//
//  Created by Александр Галкин on 24.02.2021.
//

import Foundation

extension UserViewController {
    internal func typeCastUserView() -> UserView {
        return self.view as! UserView
    }
    
    internal func downloadJsonData() {
        let param = ["id":"2", "table":"User", "all":""]
        viewModel.downloadJson(parameters: param, url: URIString.downloadURL.rawValue + URIString.apiGetDataURN.rawValue)
    }
}
