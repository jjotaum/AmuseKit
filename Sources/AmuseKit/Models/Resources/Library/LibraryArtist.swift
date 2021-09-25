//
//  LibraryArtist.swift
//  AmuseKit
//
//  Created by Jota Uribe on 24/06/20.
//

import Foundation

public extension AmuseKit {
    // A Resource object that represents a library artist.
    // https://developer.apple.com/documentation/applemusicapi/libraryartist

    struct LibraryArtist: Resource {
        public let attributes: Attributes?
        public let href: String?
        public let id: String
        public let relationships: Relationships?
        public let type: String
    }
}

public extension AmuseKit.LibraryArtist {
    // The attributes for a library artist object.
    // https://developer.apple.com/documentation/applemusicapi/libraryartist/attributes

    struct Attributes: Codable {
        public let name: String
    }

    // The relationships for the library artist.
    // https://developer.apple.com/documentation/applemusicapi/libraryartist/relationships

    struct Relationships: Codable {
        public let albums: AmuseKit.LibraryAlbumsRelationship
    }
}
