//
//  APIClient.swift
//  Find Art
//
//  Created by Margarita Novokhatskaia on 03/05/2022.
//

import Foundation
import Combine

struct APIClient {
    
    private let decoder = JSONDecoder()
    private let queue = DispatchQueue(label: "APIClient", qos: .default, attributes: .concurrent)
    
    func page(num: Int) -> AnyPublisher<Page, NetworkError> {
        URLSession.shared
            .dataTaskPublisher(for: Method.page(num).url)
            .receive(on: DispatchQueue.main)
            .map(\.data)
            .decode(type: Page.self, decoder: decoder)
            .mapError({ error -> NetworkError in
                switch error {
                case is URLError:
                    return NetworkError.unreachableAddress(url: Method.page(num).url)
                default:
                    return NetworkError.invalidResponse
                }
            })
            .eraseToAnyPublisher()
    }
    
    func object(id: Int) -> AnyPublisher<Person, NetworkError> {
        return URLSession.shared
            .dataTaskPublisher(for: Method.page(id).url) .receive(on: queue)
            .map(\.data)
            .decode(type: Person.self, decoder: decoder)
            .mapError {
                $0 is URLError
                ? NetworkError.unreachableAddress(url: Method.page(id).url)
                : NetworkError.invalidResponse
            }
            .eraseToAnyPublisher()
    }

    func mergedObjects(ids: [Int]) -> AnyPublisher<Person, NetworkError> {
        precondition(!ids.isEmpty)

        let initialPublisher = object(id: ids[0])
        let remainder = Array(ids.dropFirst())

        return remainder.reduce(initialPublisher) { (combined, id) in
            return combined
                .merge(with: object(id: id))
                .eraseToAnyPublisher()
        }
    }
}
