//
//  NetworkURL.swift
//  SweetShop
//
//  Created by Александр Галкин on 24.12.2020.
//

import Foundation

enum DatabaseImagePath: String {
    case imageParentPath = "/"
}

enum URIString: String {
    case downloadURL = "http://10.2.255.100/"
    //case localURL = "http://10.2.255.100/"
    //case remoteURL = "http://83.149.7.237/"
    case apiGetDataURN = "api/getDataFromDB.php"
    case apiGetProductDataURN = "api/getProductsJson.php"
    case apiUploadDataURN = "api/uploadDataToDB.php"
    case apiGetCartSweetnessURN = "api/getSweetnessForCart.php"
    case apiUpdateCartDataURN = "api/updateCartDataDB.php"
    case apiInsertCartDataURN = "api/insertCartDataDB.php"
    case apiDeleteCartDataURN = "api/deleteCartDataDB.php"
    case apiRegisterURN = "api/register.php"
    case apiSearchURN = "api/getSearchedProducts.php"
}
