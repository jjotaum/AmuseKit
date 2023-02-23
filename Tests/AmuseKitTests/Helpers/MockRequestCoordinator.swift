//
//  MockAPIService.swift
//  AmuseKit
//
//  Created by Jota Uribe on 22/03/21.
//

import Combine
import Foundation
@testable import AmuseKit

enum MockAPIServiceError: Error {
    case invalidFilePath(endpoint: String)
    case invalidFileFormat
}

struct MockRequestCoordinator: RequestCoordinator  {
    var resourceName: String = ""
    
    func dataTask<T>(request: URLRequest, decoder: RequestDecoder, completion: @escaping (RequestResult<T>) -> Void) where T : Decodable, T : Encodable {
        guard let filePath = Bundle.module.path(forResource: resourceName, ofType: "json") else {
            completion(.failure(MockAPIServiceError.invalidFilePath(endpoint: resourceName)))
            return
        }
        
        guard let data = try? Data(contentsOf: URL(fileURLWithPath: filePath), options: .mappedIfSafe) else {
            completion(.failure(MockAPIServiceError.invalidFileFormat))
            return
        }
        
        do {
            let response = try decoder.decode(T.self, from: data)
            completion(.success(response))
        } catch {
            completion(.failure(error))
        }
    }
    
    func data<T>(request: URLRequest, decoder: RequestDecoder) async throws -> T where T : Decodable, T : Encodable {
        guard let filePath = Bundle.module.path(forResource: resourceName, ofType: "json") else {
            throw MockAPIServiceError.invalidFilePath(endpoint: resourceName)
        }
        guard let data = try? Data(contentsOf: URL(fileURLWithPath: filePath), options: .mappedIfSafe) else {
            throw MockAPIServiceError.invalidFileFormat
        }
        return try decoder.decode(T.self, from: data)
    }
    
    func dataTaskPublisher<T>(for request: URLRequest, decoder: RequestDecoder) throws -> AnyPublisher<T, Error> where T : Decodable, T : Encodable {
        guard let filePath = Bundle.module.path(forResource: resourceName, ofType: "json") else {
            throw MockAPIServiceError.invalidFilePath(endpoint: resourceName)
        }

        let publisher = filePath.publisher.collect().map { String($0) }
            .setFailureType(to: MockAPIServiceError.self)
            .tryMap({ path -> T in
                guard let data = try? Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe) else {
                    throw MockAPIServiceError.invalidFileFormat
                }
                return try decoder.decode(T.self, from: data)
            })
            .eraseToAnyPublisher()
        return publisher
    }
}

