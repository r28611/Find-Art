//
//  Find_ArtApp.swift
//  Find Art
//
//  Created by Margarita Novokhatskaia on 10/04/2022.
//

import SwiftUI
import Combine

@main
struct Find_ArtApp: App {
    
    private var subscriptions = Set<AnyCancellable>()
    let viewModel = PersonsViewModel()
    let filter = Filter()
    
    init() {
        filter.$tags
            .assign(to: \.filterTags, on: viewModel)
            .store(in: &subscriptions)
    }
    
    var body: some Scene {
        WindowGroup {
            PersonsView(model: viewModel)
                .environmentObject(filter)
        }
    }
}
