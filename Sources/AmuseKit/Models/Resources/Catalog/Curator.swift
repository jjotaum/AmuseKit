//
//  Curator.swift
//  AmuseKit
//
//  Created by Jota Uribe on 22/06/20.
//

import Foundation

public extension AmuseKit {
    // A Resource object that represents a curator of resources.
    // https://developer.apple.com/documentation/applemusicapi/curator

    struct Curator: Resource {
        public let attributes: Attributes?
        public let href: String?
        public let id: String
        public let relationships: Relationships?
        public let type: String
    }
}

public extension AmuseKit.Curator {
    // The attributes for a curator object.
    // https://developer.apple.com/documentation/applemusicapi/curator/attributes

    struct Attributes: Codable {
        public let artwork: AmuseKit.Artwork
        public let editorialNotes: AmuseKit.EditorialNotes?
        public let name: String
        public let url: String
    }

    // The relationships for a curator object.
    // https://developer.apple.com/documentation/applemusicapi/curator/relationships

    struct Relationships: Codable {
        public let playlists: AmuseKit.PlaylistRelationship?
    }
}
