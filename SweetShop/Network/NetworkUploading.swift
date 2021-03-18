//
//  NetworkUploading.swift
//  SweetShop
//
//  Created by Александр Галкин on 03.03.2021.
//

import Foundation

internal final class NetworkUploading {
    
    
    
    static func shared() -> NetworkUploading {
        return NetworkUploading()
    }
    
    private init() {}
    
    internal func request(parameters: [String: Any]? = nil, url: String, uploadData: Data? = nil) throws -> URLRequest {
        guard let url = URL(string: url) else {
            return URLRequest(url: URL(string: "nil")!)
        }
        
        let boundary = "Boundary-\(UUID().uuidString)"
        var request = URLRequest(url: url)
        request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
        request.setValue("IOS APP", forHTTPHeaderField: "User-Agent")
        request.httpMethod = "POST"
        
        if let parameters = parameters {
            if let jsonData = try? JSONSerialization.data(withJSONObject: parameters, options: .withoutEscapingSlashes) {
                let data = getUploadData(name: "jsonData", value: jsonData, boundary: boundary)
                request.httpBody = data
            }
        }
        
        if let uploadData = uploadData {
            
        }
        return request
    }
    
    internal func response(urlRequest: URLRequest, completion: @escaping (_ data: Data) -> Void) throws {
        let task = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            guard let data = data,
                  let response = response as? HTTPURLResponse,
                  error == nil else {
                    //throw NSError(domain: "Network", code: 2, userInfo: nil)
                    return
                  }
            guard (200 ... 299) ~= response.statusCode else { //check for http errors
                print("statusCode should be 2xx, but is \(response.statusCode)")
                print("response = \(response)")
                return
            }
            completion(data)
        }
        task.resume()
    }
    
    private func getUploadData(name: String, value: Data, boundary: String, mimeType: String? = nil, filename: String? = nil) -> Data {
        let data = NSMutableData()
        
        var convertedString = "--\(boundary)\r\n"
        convertedString += "Content-Disposition: form-data; name=\"\(name)\""
        if let filename = filename {
            convertedString += "; filename=\"\(filename)\"\r\n"
        } else {
            convertedString += "\r\n"
        }
        
        convertedString += "\r\n"
        if let mimeType = mimeType {
            convertedString += "Content-Type: \(mimeType)\r\n\r\n"
        }
       
        data.appendString(string: convertedString)
        data.append(value)
        data.appendString(string: "\r\n")
        
        return data as Data
    }
}

extension NSMutableData {
    func appendString(string: String) {
        if let data = string.data(using: .utf8) {
            self.append(data)
        }
    }
}
