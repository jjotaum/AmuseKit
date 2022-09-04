//
//  DataProvider.swift
//  AmuseKit
//
//  Created by Jota Uribe on 22/03/21.
//

import Combine
import Foundation
import class KeychainAccess.Keychain

public extension AmuseKit {
    
    class DataProvider {
        public typealias CatalogSearchTypes = Set<CatalogResourceType>
        public typealias LibrarySearchTypes = Set<LibraryResourceType>

        private var storage: StorageService
        private let service: APIService
        private var userCountryCode: String = "us"

        public init(_ storageConfiguration: StorageConfiguration,
                    service: APIService = URLSession.shared) {
            self.storage = KeyChainService(storageConfiguration)
            self.service = service
        }
        
        init(storage: StorageService,
             service: APIService) {
            self.storage = storage
            self.service = service
        }

        // MARK: - Public Accessors Methods

        public func setDeveloperToken(_ developerToken: String) {
            self.storage.developerToken = developerToken
        }
        
        public func setUserToken(_ userToken: String) {
            self.storage.userToken = userToken
        }
        
        public func setUserCountryCode(_ userCountryCode: String) {
            self.userCountryCode = userCountryCode
        }
        
        // MARK: - Catalog Methods
        
        func catalog<Resource: Codable>(_ resourceType: CatalogResourceConvertible<Resource>, ids: [String]) throws -> AnyPublisher<AmuseKit.ResponseRoot<Resource, EmptyCodable>, Error> {
            guard let developerToken = storage.developerToken else {
                throw AmuseKit.AmuseError.missingDevToken
            }

            var request = try Router.catalog(countryCode: userCountryCode, resourceType: resourceType.rawValue).asURLRequest(
                [.init(name: "ids", value: ids.joined(separator: ","))]
            )
            request.setValue("Bearer \(developerToken)", forHTTPHeaderField: "Authorization")
            request.setValue(storage.userToken, forHTTPHeaderField: "Music-User-Token")
            return try service.publisher(with: request)
        }
        
        public func catalogSearch(_ resourceTypes: CatalogSearchTypes = .all, limit: Int = 25, searchTerm: String) throws -> AnyPublisher<AmuseKit.SearchResponse, Error> {
            try searchRequest(.search(countryCode: userCountryCode), rawTypes: resourceTypes.map({ $0.rawValue }), limit: limit, searchTerm: searchTerm)
        }

        // MARK: - Library Methods
        
        func library<Resource: Codable>(_ resourceType: LibraryResourceConvertible<Resource>) throws -> AnyPublisher<AmuseKit.ResponseRoot<Resource, EmptyCodable>, Error> {
            guard let developerToken = storage.developerToken else {
                throw AmuseKit.AmuseError.missingDevToken
            }

            var request = try Router.library(resourceType.rawValue).asURLRequest([])
            request.setValue("Bearer \(developerToken)", forHTTPHeaderField: "Authorization")
            request.setValue(storage.userToken, forHTTPHeaderField: "Music-User-Token")
            return try service.publisher(with: request)
        }
        

        public func librarySearch(_ resourceTypes: LibrarySearchTypes = .all, limit: Int = 25, searchTerm: String) throws -> AnyPublisher<AmuseKit.LibrarySearchResponse, Error> {
            try searchRequest(.librarySearch, rawTypes: resourceTypes.map({ $0.rawValue }), limit: limit, searchTerm: searchTerm)
        }
        
        // MARK: - Private Methods
        
        private func searchRequest<T: Codable>(_ router: Router, rawTypes: [String], limit: Int, searchTerm: String) throws -> AnyPublisher<T, Error> {
            guard let developerToken = storage.developerToken else {
                throw AmuseKit.AmuseError.missingDevToken
            }

            let queryItems = [
                URLQueryItem(name: "term", value: searchTerm),
                URLQueryItem(name: "limit", value: String(limit)),
                URLQueryItem(name: "types", value: rawTypes.joined(separator: ","))
            ]
            var request = try router.asURLRequest(queryItems)
            request.setValue("Bearer \(developerToken)", forHTTPHeaderField: "Authorization")
            return try service.publisher(with: request)
        }
    }
}
