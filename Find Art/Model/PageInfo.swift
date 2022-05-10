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
    public var page: Int?
    public var next: String?
    public var prev: String?

    public init(
        totalrecordsperquery: Int,
        totalrecords: Int,
        pages: Int,
        page: Int?,
        next: String?,
        prev: String?
    ) {
        self.totalrecordsperquery = totalrecordsperquery
        self.totalrecords = totalrecords
        self.pages = pages
        self.page = page
        self.next = next
        self.prev = prev
    }
}
