//
//  Person.swift
//  Find Art
//
//  Created by Margarita Novokhatskaia on 03/05/2022.
//

import Foundation

public struct Person: Codable {
    let displayname: String
    let displaydate: String?
    let birthplace: String?
    let culture: String?
    let deathplace: String?
    let url: String

    enum CodingKeys: String, CodingKey {
        case displaydate, url, birthplace, culture, displayname, deathplace
    }
}
