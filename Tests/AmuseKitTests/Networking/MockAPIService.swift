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

struct MockAPIService: APIService  {

    func publisher<T>(with request: URLRequest) throws -> AnyPublisher<T, Error> where T : Decodable, T : Encodable {
        let endpoint = request.url?.lastPathComponent ?? ""
        guard let filePath = Bundle.module.path(forResource: endpoint, ofType: "json") else {
            throw MockAPIServiceError.invalidFilePath(endpoint: endpoint)
        }

        let publisher = filePath.publisher.collect().map { String($0) }
            .setFailureType(to: MockAPIServiceError.self)
            .tryMap({ path -> T in
                guard let data = try? Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe) else {
                    throw MockAPIServiceError.invalidFileFormat
                }
                return try JSONDecoder().decode(T.self, from: data)
            })
            .eraseToAnyPublisher()
        return publisher
    }
}
