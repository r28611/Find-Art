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
    
    let container = DIContainer()
    
    var body: some Scene {
        WindowGroup {
            PersonsView(model: container.personsViewModel)
                .environmentObject(container.filter)
        }
    }
}
