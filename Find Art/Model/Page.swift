//
//  Page.swift
//  Find Art
//
//  Created by Margarita Novokhatskaia on 10/05/2022.
//

import Foundation

public struct Page: Codable {

    public var info: PageInfo
    public var results: [Person]

    public init(
        info: PageInfo,
        results: [Person]
    ) {
        self.info = info
        self.results = results
    }
}
