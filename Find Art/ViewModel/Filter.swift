//
//  Filter.swift
//  Find Art
//
//  Created by Margarita Novokhatskaia on 11/05/2022.
//

import Combine
import Foundation


final class Filter: ObservableObject {
    
    @Published var tags: [CultureTag] = []
    
    var header: String {
        tags.isEmpty
        ? "All cultures"
        : tags
            .map { $0.rawValue.capitalized }
            .joined(separator: " + ")
    }
    
    init() {}
    
    func changeTagState(_ tag: CultureTag) {
        tags.contains(tag)
        ? tags.removeAll(where: { $0 == tag })
        : tags.append(tag)
    }
    
}
