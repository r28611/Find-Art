//
//  Page.swift
//  Find Art
//
//  Created by Margarita Novokhatskaia on 10/05/2022.
//

import Foundation

public struct Page: Codable {

    public var info: PageInfo
    public var records: [Person]

    public init(
        info: PageInfo,
        records: [Person]
    ) {
        self.info = info
        self.records = records
    }
}
