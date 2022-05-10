//
//  PageInfo.swift
//  Find Art
//
//  Created by Margarita Novokhatskaia on 10/05/2022.
//

import Foundation

public struct PageInfo: Codable {
    public var totalrecordsperquery: Int
    public var totalrecords: Int
    public var pages: Int
    public var page: String?
    public var next: String?

    public init(
        totalrecordsperquery: Int,
        totalrecords: Int,
        pages: Int,
        page: String?,
        next: String?
    ) {
        self.totalrecordsperquery = totalrecordsperquery
        self.totalrecords = totalrecords
        self.pages = pages
        self.page = page
        self.next = next
    }
}
