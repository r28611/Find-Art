//
//  PersonsViewModel.swift
//  Find Art
//
//  Created by Margarita Novokhatskaia on 10/05/2022.
//

import Combine
import SwiftUI

protocol ViewModelProtocol: ObservableObject {
    
    var persons: [Person] { get set }
    var error: NetworkError? { get set }
    var filterTags: [CultureTag]  { get set }
    var currentPage: Int { get set }
    var membersListFull: Bool { get set }
    func loadMoreContent()
    func fetchPersons()
    
}

class PersonsViewModel: ViewModelProtocol {
    
    @Published var persons: [Person] = []
    @Published var error: NetworkError? = nil
    @Published var filterTags: [CultureTag] = []
    
    private var apiClient = APIClient()
    var currentPage: Int = 0
    var membersListFull = false
    private var subscriptions: Set<AnyCancellable> = []
    
    //MARK: - PAGINATION
    func loadMoreContent(){
        if !membersListFull {
            fetchPersons()
        }
    }
    
    //MARK: - API CALL
    func fetchPersons() {
        let publisher = filterTags.isEmpty
            ? apiClient.page(num: currentPage + 1)
            : apiClient.page(num: currentPage + 1, q: filterTags.map { $0.rawValue }.joined(separator: ","))

        publisher
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] completion in
                guard let self = self else { return }
                if case .failure(let error) = completion {
                    self.error = error
                }
            }, receiveValue: { [weak self] page in
                guard let self = self else { return }
                self.persons.append(contentsOf: page.records)
                self.currentPage += 1
                self.error = nil
                if page.records.count < page.info.totalrecordsperquery {
                    self.membersListFull = true
                }
            })
            .store(in: &subscriptions)
    }
}
