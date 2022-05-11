//
//  Method.swift
//  Find Art
//
//  Created by Margarita Novokhatskaia on 03/05/2022.
//

import Foundation

enum Method {
    static let baseURL = URL(string: "https://api.harvardartmuseums.org/")!
    static let personPath = "person"
    static let apikey = "55b06756-30fe-4883-8cbc-f6a805f8b86d"
    
    case page(Int)
    case personFiltered(String, Int)
    
    var url: URL {
        let urlString = Method.baseURL.appendingPathComponent(Method.personPath).absoluteString
        var urlComps = URLComponents(string: urlString)
        urlComps?.queryItems = [
            URLQueryItem(name: "apikey", value: "\(Method.apikey)")]
        
        switch self {
        case .page(let num):
            urlComps?.queryItems?.append(URLQueryItem(name: "page", value: "\(num)"))
        case .personFiltered(let cultureTag, let page):
            urlComps?.queryItems? += [
                URLQueryItem(name: "q", value: "culture:\(cultureTag)"),
                URLQueryItem(name: "page", value: "\(page)")]
        }
        
        return urlComps?.url ?? Method.baseURL
    }
}
