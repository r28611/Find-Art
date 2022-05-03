//
//  ArtObject.swift
//  Find Art
//
//  Created by Margarita Novokhatskaia on 03/05/2022.
//

import Foundation

public struct ArtObject: Codable {
    let objectID: Int
    let isPublicDomain: Bool
    let primaryImage: String
    let objectName, title, culture: String
    let artistDisplayName, artistDisplayBio: String
}
