//
//  LibrarySong.swift
//  AmuseKit
//
//  Created by Jota Uribe on 24/06/20.
//

import Foundation

public extension AmuseKit {
    // A Resource object that represents a library song.
    // https://developer.apple.com/documentation/applemusicapi/librarysong

    struct LibrarySong: Resource {
        public let attributes: Attributes?
        public let href: String?
        public let id: String
        public let relationships: Relationships?
        public let type: String
    }
}

public extension AmuseKit.LibrarySong {
    // The attributes for a library song object.
    // https://developer.apple.com/documentation/applemusicapi/librarysong/attributes

    struct Attributes: Codable {
        public let albumName: String
        public let artistName: String
        public let artwork: AmuseKit.LibraryArtwork?
        public let contentRating: String?
        public var discNumber: Int?
        public let durationInMillis: Int?
        public let name: String
        public let playParams: AmuseKit.PlayParameters?
        public var trackNumber: Int?
    }

    struct Relationships: Codable {
        public let albums: AmuseKit.LibraryAlbumsRelationship
        public let artists: AmuseKit.LibraryArtistsRelationship
    }
}

