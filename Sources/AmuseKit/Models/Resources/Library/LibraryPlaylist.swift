//
//  LibraryPlaylist.swift
//  AmuseKit
//
//  Created by Jota Uribe on 24/06/20.
//

import Foundation

public extension AmuseKit {
    // A Resource object that represents a library playlist
    // https://developer.apple.com/documentation/applemusicapi/libraryplaylist

    struct LibraryPlaylist: Resource {
        public let attributes: Attributes?
        public let href: String?
        public let id: String
        public let relationships: Relationships?
        public let type: String
    }
}

public extension AmuseKit.LibraryPlaylist {
    // The attributes for a library playlist object.
    // https://developer.apple.com/documentation/applemusicapi/libraryplaylist/attributes

    struct Attributes: Codable {
        public let artwork: AmuseKit.LibraryArtwork?
        public let description: AmuseKit.EditorialNotes?
        public let name: String
        public let playParams: AmuseKit.PlayParameters
        public let canEdit: Bool
    }

    // The relationships for a library playlist object.
    // https://developer.apple.com/documentation/applemusicapi/libraryplaylist/relationships

    struct Relationships: Codable {
        public let tracks: AmuseKit.LibraryTracksRelationship?
    }
}
