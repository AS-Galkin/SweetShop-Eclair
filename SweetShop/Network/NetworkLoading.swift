//
//  Network.swift
//  SweetShop
//
//  Created by Александр Галкин on 22.12.2020.
//

import Foundation

internal final class NetworkLoading {
    
    static func shared() -> NetworkLoading {
        return NetworkLoading()
    }
    
    private init() {}
    
    internal func request(parameters: [String: Any], url: String) throws -> URLRequest {
        guard let url = URL(string: url) else {
            return URLRequest(url: URL(string: "nil")!)
        }
        var request = URLRequest(url: url)
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.setValue("IOS APP", forHTTPHeaderField: "User-Agent")
        request.httpMethod = "POST"
        request.httpBody = parameters.percentEscaped().data(using: .utf8)
        return request
    }
    
    internal func response(urlRequest: URLRequest, completion: @escaping (_ data: Data) -> Void) throws {
        let sessionParam = URLSessionConfiguration.default
        sessionParam.timeoutIntervalForRequest = 10.0
        sessionParam.timeoutIntervalForResource = 30.0
        let session = URLSession(configuration: sessionParam)
        let task = session.dataTask(with: urlRequest) { (data, response, error) in
            if error != nil {
                completion("NIL".data(using: .utf8)!)
            } else {
                guard let data = data,
                      let response = response as? HTTPURLResponse else {return}
                guard (200 ... 3000) ~= response.statusCode else { //check for http errors
                      print("statusCode should be 2xx, but is \(response.statusCode)")
                      print("response = \(response)")
                      return
                  }
                completion(data)
            }
        }
        task.resume()
    }
}

extension Dictionary {
    func percentEscaped() -> String {
        return map { (key, value) in
            let escapedKey = "\(key)".addingPercentEncoding(withAllowedCharacters: .urlQueryValueAllowed) ?? ""
            let escapedValue = "\(value)".addingPercentEncoding(withAllowedCharacters: .urlQueryValueAllowed) ?? ""
            return escapedKey + "=" + escapedValue
            }
            .joined(separator: "&")
    }
}

extension CharacterSet {
    static let urlQueryValueAllowed: CharacterSet = {
        let generalDelimitersToEncode = ":#[]@" // does not include "?" or "/" due to RFC 3986 - Section 3.4
        let subDelimitersToEncode = "!$&'()*+,;="
        
        var allowed = CharacterSet.urlQueryAllowed
        allowed.remove(charactersIn: "\(generalDelimitersToEncode)\(subDelimitersToEncode)")
        return allowed
    }()
}
