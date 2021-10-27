//
//  LibraryAlbum.swift
//  AmuseKit
//
//  Created by Jota Uribe on 24/06/20.
//

import Foundation

public extension AmuseKit {
    // The attributes for a library album object.
    // https://developer.apple.com/documentation/applemusicapi/libraryalbum/attributes

    struct LibraryAlbum: Resource {
        public let attributes: Attributes?
        public let href: String?
        public let id: String
        public let relationships: Relationships?
        public let type: String
    }
}

public extension AmuseKit.LibraryAlbum {
    struct Attributes: Codable {
        public let artistName: String
        public let artwork: AmuseKit.LibraryArtwork?
        public let contentRating: String?
        public let name: String
        public let playParams: AmuseKit.PlayParameters?
        public let trackCount: Int
    }

    // The relationships for a library album object.
    // https://developer.apple.com/documentation/applemusicapi/libraryalbum/relationships

    struct Relationships: Codable {
        var artists: AmuseKit.LibraryArtistsRelationship?
        var tracks: AmuseKit.LibraryTracksRelationship?
    }
}
