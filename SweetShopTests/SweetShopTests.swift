//
//  SweetShopTests.swift
//  SweetShopTests
//
//  Created by Александр Галкин on 02.12.2020.
//

import XCTest
@testable import SweetShop

class SweetShopTests: XCTestCase {
    
    var sessionUnderTest: URLSession!
    var productVieModel: ProductViewModel!
    var product1:ProductModel.ProductData!
    var product2:ProductModel.ProductData!
    var product3:ProductModel.ProductData!
    var product4:ProductModel.ProductData!
    var product5:ProductModel.ProductData!
    
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sessionUnderTest = URLSession(configuration: URLSessionConfiguration.default)
        productVieModel = ProductViewModel()
        product1 = ProductModel.ProductData(
            productData:ProductModel.ProductData.ProductInit(id: 5, price: "210.00",
                            manufacturer: ProductModel.ProductData.ManufacturerData(manId: 2, manName: "Тест", manDescription: nil),
                                    sweetness: ProductModel.ProductData.SwetnessData(swId: 9, swName: "Эклер", swDescription: nil, swShortDescription: nil, swWeight: nil,
                                                swImage: ProductModel.ProductData.ImageData(imId: 5, imName: "images/product_image/eclair/eclair_coffie.jpg"))))
        product2 = ProductModel.ProductData(
            productData:ProductModel.ProductData.ProductInit(id: 6, price: "220.00",
                            manufacturer: ProductModel.ProductData.ManufacturerData(manId: 2, manName: "Тест", manDescription: nil),
                                    sweetness: ProductModel.ProductData.SwetnessData(swId: 10, swName: "Эклер", swDescription: nil, swShortDescription: nil, swWeight: nil,
                                                swImage: ProductModel.ProductData.ImageData(imId: 6, imName: "images/product_image/eclair/eclair_chocolate.jpg"))))
        product3 = ProductModel.ProductData(
            productData:ProductModel.ProductData.ProductInit(id: 6, price: "230.00",
                            manufacturer: ProductModel.ProductData.ManufacturerData(manId: 2, manName: "Тест", manDescription: nil),
                                    sweetness: ProductModel.ProductData.SwetnessData(swId: 10, swName: "Эклер", swDescription: nil, swShortDescription: nil, swWeight: nil,
                                                swImage: ProductModel.ProductData.ImageData(imId: 6, imName: "images/product_image/eclair/eclair_chocolate.jpg"))))
        product4 = ProductModel.ProductData(
            productData:ProductModel.ProductData.ProductInit(id: 6, price: "240.00",
                            manufacturer: ProductModel.ProductData.ManufacturerData(manId: 2, manName: "Тест", manDescription: nil),
                                    sweetness: ProductModel.ProductData.SwetnessData(swId: 10, swName: "Эклер", swDescription: nil, swShortDescription: nil, swWeight: nil,
                                                swImage: ProductModel.ProductData.ImageData(imId: 6, imName: "images/product_image/eclair/eclair_chocolate.jpg"))))
        product5 = ProductModel.ProductData(
            productData:ProductModel.ProductData.ProductInit(id: 6, price: "250.00",
                            manufacturer: ProductModel.ProductData.ManufacturerData(manId: 2, manName: "Тест", manDescription: nil),
                                    sweetness: ProductModel.ProductData.SwetnessData(swId: 10, swName: "Эклер", swDescription: nil, swShortDescription: nil, swWeight: nil,
                                                swImage: ProductModel.ProductData.ImageData(imId: 6, imName: "images/product_image/eclair/eclair_chocolate.jpg"))))
        productVieModel.model? = [product1,product2,product3,product4,product5]
        
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sessionUnderTest = nil
        productVieModel = nil

        product1 = nil
        product2 = nil
        
    }

    func testProductViewModel() throws {
        
        productVieModel.downloadJson(parameters: ["name":"Торты"], url: URIString.downloadURL.rawValue + URIString.apiGetProductDataURN.rawValue)
        let dp = DispatchQueue.global(qos: .background)
        dp.asyncAfter(deadline: DispatchTime.now()+10){
            XCTAssertGreaterThanOrEqual(self.productVieModel.model!.count, 2)
        }
    }

    func testPerformanceSortViewModel() throws {
        // This is an example of a performance test case.
        self.measure {
            var sortedProduct = productVieModel.sortModel(sortClosure: { left, right in
                guard let lhs = left.productData?.price,
                      let rhs = right.productData?.price else {return false}
                return Double(lhs)! > Double(rhs)!
            })
        }
    }

}
