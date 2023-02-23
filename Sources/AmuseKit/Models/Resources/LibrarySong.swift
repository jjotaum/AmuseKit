//
//  LibrarySong.swift
//  AmuseKit
//
//  Created by Jota Uribe on 24/06/20.
//

import Foundation

/// A resource object that represents a library song.
/// https://developer.apple.com/documentation/applemusicapi/librarysongs
/// Latest revision Feb 21 2022.

public struct LibrarySong: Resource {
    public let attributes: Attributes?
    public let href: String?
    public let id: String
    public let relationships: Relationships?
    public let type: String
}

public extension LibrarySong {
    
    /// The attributes for a library song resource.
    /// https://developer.apple.com/documentation/applemusicapi/librarysongs/attributes
    /// Latest revision Feb 21 2022.

    struct Attributes: Codable {
        public let albumName: String?
        public let artistName: String
        public let artwork: ResourceArtwork?
        public let contentRating: String?
        public var discNumber: Int?
        public let durationInMillis: Int?
        public let genreNames: [String]
        public let hasLyrics: Bool
        public let name: String
        public let playParams: ResourcePlayParameters?
        public let releaseDate: String?
        public let trackNumber: Int?
    }
    
    /// The relationships for a library song resource.
    /// https://developer.apple.com/documentation/applemusicapi/librarysongs/relationships

    struct Relationships: Codable {
        public let albums: AmuseKit.LibraryAlbumsRelationship
        public let artists: AmuseKit.LibraryArtistsRelationship
    }
}

