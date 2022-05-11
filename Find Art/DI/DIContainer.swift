//
//  DIContainer.swift
//  Find Art
//
//  Created by Margarita Novokhatskaia on 11/05/2022.
//

import Foundation
import Combine

class DIContainer {
    
    var personsViewModel: PersonsViewModel = .init()
    var filter: Filter = .init()
    
    private var subscriptions = Set<AnyCancellable>()
    
    
    init() {
        bootstrap()
    }
    
    
    private func bootstrap() {
        filter.$tags
            .assign(to: \.filterTags, on: personsViewModel)
            .store(in: &subscriptions)
    }
    
}
