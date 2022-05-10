//
//  PersonsViewModel.swift
//  Find Art
//
//  Created by Margarita Novokhatskaia on 10/05/2022.
//

import Combine
import SwiftUI

protocol ViewModelProtocol: ObservableObject {
    
    var persons: [Person] { get }
    var error: NetworkError? { get set }
    func fetchPersons()
    
}

class PersonsViewModel: ViewModelProtocol {
    
    @Published var persons: [Person] = []
    @Published var error: NetworkError? = nil
    
    private var apiClient = APIClient()
    private var currentPage: Int = 0
    private var subscriptions: Set<AnyCancellable> = []
    
    func fetchPersons() {
        apiClient
            .page(num: currentPage + 1)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                if case .failure(let error) = completion {
                    self.error = error
                }
            }, receiveValue: { page in
                self.persons.append(contentsOf: page.results)
                self.currentPage += 1
                self.error = nil
            })
            .store(in: &subscriptions)
    }
}
