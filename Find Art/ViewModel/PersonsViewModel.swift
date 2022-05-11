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
    var filterTags: [CultureTag]  { get set }
    var membersListFull: Bool { get set }
    func loadMoreContent()
    func fetchPersons()
    
}

class PersonsViewModel: ViewModelProtocol {
    
    @Published private var allPersons: [Person] = []
    @Published var error: NetworkError? = nil
    @Published var filterTags: [CultureTag] = []
    
    private var apiClient = APIClient()
    private var currentPage: Int = 0
    var membersListFull = false
    private var subscriptions: Set<AnyCancellable> = []
    
    var persons: [Person] {
        guard !filterTags.isEmpty else {
            return allPersons
        }
        
        return allPersons
            .filter { (person) -> Bool in
                return filterTags.reduce(false) { (isMatch, tag) -> Bool in
                    self.checkMatching(person: person, for: tag)
                }
            }
    }
    
    //MARK: - PAGINATION
    func loadMoreContent(){
        if !membersListFull {
            fetchPersons()
        }
    }
    
    //MARK: - API CALL
    func fetchPersons() {
        apiClient
            .page(num: currentPage + 1)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                if case .failure(let error) = completion {
                    self.error = error
                }
            }, receiveValue: { page in
                self.allPersons.append(contentsOf: page.records)
                self.currentPage += 1
                self.error = nil
                if page.records.count < page.info.totalrecordsperquery {
                    self.membersListFull = true
                }
            })
            .store(in: &subscriptions)
    }
    
    //MARK: - FILTER
    private func checkMatching(person: Person, for tag: CultureTag) -> Bool {
        switch tag {
        case .japanese, .french, .dutch, .russian, .spanish:
            return person.culture?.lowercased() == tag.rawValue.lowercased()
        }
    }
}
