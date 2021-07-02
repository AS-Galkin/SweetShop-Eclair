//
//  CotegoryViewModel.swift
//  SweetShop
//
//  Created by Александр Галкин on 22.12.2020.
//

import Foundation
import UIKit

final class CategoryViewModel: ViewModelProtocol {
    
    weak var delegate: Downloadable?
    
    var settingBunnerView: ((_ frame: CGRect, _ images: [UIImage])->Void)?
    
    typealias DataType = DataStates<[CategoryModel.CategoryData]>
    
    var updateData: ((DataStates<[CategoryModel.CategoryData]>) -> Void)?
    
    var updateImage: (([UIImage]) -> Void)?
    
    var categoryModel: [CategoryModel.CategoryData]?
    
    var promotionModel: [PromotionModel.PromotionData]?
    
    var frameAfterLoad: CGRect?
    
    init () {
        updateData?(.initial)
    }
    
    func downloadData() {
    }
    
    func downloadJson(parameters: [String : Any], url: String) {
        DispatchQueue.main.async {
            self.updateData?(.loading([] as! [CategoryModel.CategoryData]))
        }
        
        guard let request = try? NetworkLoading.shared().request(parameters: parameters, url: url) else {return}
        let _ = try? NetworkLoading.shared().response(urlRequest: request) { (data) in
            let decoder = JSONDecoder()
            self.categoryModel = try? decoder.decode([CategoryModel.CategoryData]?.self, from: data) as [CategoryModel.CategoryData]?
            var images: [UIImage] = []
            if let model = self.categoryModel {
                print(model)
                //MARK: загружаем картинки....NOTE: Оберунть в отдельную очередь!
                for i in model {
                    let image = try? UIImage(data: Data(contentsOf: URL(string: URIString.downloadURL.rawValue + i.image!)!))
                    if let image = image {
                        images.append(image)
                    }
                }
                
                DispatchQueue.main.async {[weak self] in
                    self?.updateData?(.success(model))
                    self?.updateImage?(images)
                }
            } else {
                DispatchQueue.main.async {
                    self.updateData?(.failure([] as! [CategoryModel.CategoryData]))
                }
            }
        }
    }
    
    func downloadBunnerJson(parameters: [String : Any], url: String) {
        guard let request = try? NetworkLoading.shared().request(parameters: parameters, url: url) else {return}
        let _ = try? NetworkLoading.shared().response(urlRequest: request) { (data) in
            let decoder = JSONDecoder()
            self.promotionModel = try? decoder.decode([PromotionModel.PromotionData]?.self, from: data) as [PromotionModel.PromotionData]?
            var images: [UIImage] = []
            if let promotion = self.promotionModel {
                for i in promotion {
                    let imageData = try? Data(contentsOf: URL(string: URIString.downloadURL.rawValue + i.image_name!)!)
                    if let imageData = imageData {
                        let image = UIImage(data: imageData)
                        if let _ = image {
                            images.append(image!)
                        }
                    }
                }
            }
            
            DispatchQueue.main.async {
                if let scroll = self.settingBunnerView {
                    scroll(self.frameAfterLoad!, images)
                }
            }
        }
    }
}
