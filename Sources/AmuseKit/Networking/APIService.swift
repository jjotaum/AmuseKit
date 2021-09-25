//
//  APIService.swift
//  AmuseKit
//
//  Created by Jota Uribe on 9/08/20.
//

import Foundation
import Combine

public protocol APIService {
    func publisher<T: Codable>(with request: URLRequest) throws -> AnyPublisher<T, Error>
}

extension URLSession: APIService {
    public func publisher<T>(with request: URLRequest) throws -> AnyPublisher<T, Error> where T : Decodable, T : Encodable {
        return dataTaskPublisher(for: request)
            .tryMap { try JSONDecoder().decode(T.self, from: $0.data) }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
