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
    typealias LibraryPlaylistResponse = ResponseRoot<LibraryPlaylist, EmptyCodable>
    typealias LibraryAlbumResponse = ResponseRoot<LibraryAlbum, EmptyCodable>
    typealias LibraryArtistResponse = ResponseRoot<LibraryArtist, EmptyCodable>
    typealias LibrarySongResponse = ResponseRoot<LibrarySong, EmptyCodable>
    typealias LibraryMusicVideoResponse = ResponseRoot<LibraryMusicVideo, EmptyCodable>
    
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

        // MARK: - Library Methods

        public func libraryPlaylists() throws -> AnyPublisher<AmuseKit.LibraryPlaylistResponse, Error> {
            try libraryRequest(.library(.playlists))
        }

        public func libraryAlbums() throws -> AnyPublisher<AmuseKit.LibraryAlbumResponse, Error> {
            try libraryRequest(.library(.albums))
        }
        
        public func libraryArtists() throws -> AnyPublisher<AmuseKit.LibraryArtistResponse, Error> {
            try libraryRequest(.library(.artists))
        }
        
        public func librarySongs() throws -> AnyPublisher<AmuseKit.LibrarySongResponse, Error> {
            try libraryRequest(.library(.songs))
        }
        
        public func libraryMusicVideos() throws -> AnyPublisher<AmuseKit.LibraryMusicVideoResponse, Error> {
            try libraryRequest(.library(.musicVideos))
        }
        
        private func libraryRequest<T: Codable>(_ router: Router) throws -> AnyPublisher<T, Error> {
            guard let developerToken = storage.developerToken else {
                throw AmuseKit.AmuseError.missingDevToken
            }

            var request = try router.asURLRequest([])
            request.setValue("Bearer \(developerToken)", forHTTPHeaderField: "Authorization")
            request.setValue(storage.userToken, forHTTPHeaderField: "Music-User-Token")
            return try service.publisher(with: request)
        }
        
        // MARK: - Search Methods

        public func librarySearch(_ resourceTypes: LibrarySearchTypes = .all, limit: Int = 25, searchTerm: String) throws -> AnyPublisher<AmuseKit.SearchResponse, Error> {
            try searchRequest(.librarySearch, rawTypes: resourceTypes.map({ $0.rawValue }), limit: limit, searchTerm: searchTerm)
        }

        public func catalogSearch(_ resourceTypes: CatalogSearchTypes = .all, limit: Int = 25, searchTerm: String) throws -> AnyPublisher<AmuseKit.SearchResponse, Error> {
            try searchRequest(.search(countryCode: userCountryCode), rawTypes: resourceTypes.map({ $0.rawValue }), limit: limit, searchTerm: searchTerm)
        }
        
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

public extension AmuseKit {
    enum CatalogResourceType: String, AmuseOption {
        case albums, artists, curators, playlists, songs, stations
        case appleCurators = "apple-curators"
        case musicVideos = "music-videos"
    }

    enum LibraryResourceType: String, AmuseOption {
        case albums = "library-albums"
        case artists = "library-artists"
        case musicVideos = "library-music-videos"
        case playlists = "library-playlists"
        case songs = "library-songs"
    }
}

public extension Set where Element == AmuseKit.CatalogResourceType {
    static var all: Set<Element> {
        return Set(Element.allCases)
    }
}

public extension Set where Element == AmuseKit.LibraryResourceType {
    static var all: Set<Element> {
        return Set(Element.allCases)
    }
}
