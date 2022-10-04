//
//  RequestCoordinator.swift
//  AmuseKit
//
//  Created by Jota Uribe on 30/09/22.
//

import Combine
import Foundation

public typealias RequestResult<T> = Result<T, Error>

public protocol RequestDecoder {
    func decode<T>(_ type: T.Type, from data: Data) throws -> T where T: Decodable
}

extension JSONDecoder: RequestDecoder { }

public protocol RequestCoordinator {
    func dataTask<T: Codable>(request: URLRequest, decoder: RequestDecoder, completion: @escaping (RequestResult<T>) -> Void)
    @available(iOS 15.0, *)
    @available(macOS 12.0, *)
    func data<T: Codable>(request: URLRequest, decoder: RequestDecoder) async throws -> RequestResult<T>
    func dataTaskPublisher<T: Codable>(for request: URLRequest, decoder: RequestDecoder) throws -> AnyPublisher<T, Error>
}

extension URLSession: RequestCoordinator {
    public func dataTask<T>(request: URLRequest, decoder: RequestDecoder, completion: @escaping (RequestResult<T>) -> Void) where T : Decodable, T : Encodable {
        dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
            }
            
            guard let data = data else {
                completion(.failure(URLError(.badServerResponse)))
                return
            }
            
            do {
                let decodedData = try decoder.decode(T.self, from: data)
                completion(.success(decodedData))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
    
    @available(iOS 15.0, *)
    @available(macOS 12.0, *)
    public func data<T>(request: URLRequest, decoder: RequestDecoder) async throws -> RequestResult<T> where T : Decodable, T : Encodable {
        let data: (Data, URLResponse) = try await data(for: request)
        return Result {
            try decoder.decode(T.self, from: data.0)
        }
    }
    
    public func dataTaskPublisher<T>(for request: URLRequest, decoder: RequestDecoder) throws -> AnyPublisher<T, Error> where T : Decodable, T : Encodable {
        return dataTaskPublisher(for: request)
            .tryMap { try decoder.decode(T.self, from: $0.data) }
            .eraseToAnyPublisher()
    }
}
