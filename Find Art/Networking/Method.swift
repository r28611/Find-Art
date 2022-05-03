//
//  Method.swift
//  Find Art
//
//  Created by Margarita Novokhatskaia on 03/05/2022.
//

import Foundation

enum Method {
    static let baseURL = URL(string: "https://colectionapi.metmuseum.org/public/collection/v1/")!
    
    case object(Int)
    
    var url: URL {
        switch self {
        case .object(let id):
            return Method.baseURL.appendingPathComponent("objects/\(id)")
        default:
            fatalError("URL for this case is undefined.")
        }
    }
}
