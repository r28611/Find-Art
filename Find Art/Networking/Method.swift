//
//  Method.swift
//  Find Art
//
//  Created by Margarita Novokhatskaia on 03/05/2022.
//

import Foundation

enum Method {
    static var baseURL: URLComponents {
        var components = URLComponents()
            components.scheme = "https"
            components.host = "api.harvardartmuseums.org"
            components.queryItems = [
                URLQueryItem(name: "apikey", value: Method.apikey)
            ]
        return components
    }
    static let personPath = "person"
    static let apikey = "55b06756-30fe-4883-8cbc-f6a805f8b86d"
    
    case page(Int)
    case person(Int)
    
    var url: URL {
        switch self {
        case .page(let num):
            var url = Method.baseURL
            url.path = Method.personPath
            url.queryItems = [URLQueryItem(name: "page", value: "\(num)")]
            return url.url ?? Method.baseURL.url!
        default:
            fatalError("URL for this case is undefined.")
        }
    }
}
