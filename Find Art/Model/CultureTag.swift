//
//  CultureTag.swift
//  Find Art
//
//  Created by Margarita Novokhatskaia on 11/05/2022.
//

import Foundation

enum CultureTag: String, CaseIterable, Identifiable {
    case dutch
    case french
    case russian
    case spanish
    case japanese
    
    var id: String {
        return self.rawValue
    }
}
