//
//  CuratorResource.swift
//  AmuseKit
//
//  Created by Jota Uribe on 22/06/20.
//

import Foundation

/// A resource object that represents a curator.
/// https://developer.apple.com/documentation/applemusicapi/curators-uja
/// Latest revision Feb 21 2022.

public struct CuratorResource: Resource {
    public let attributes: Attributes?
    public let href: String?
    public let id: String
    public let relationships: Relationships?
    public let type: String
}

public extension CuratorResource {
    
    /// The attributes for a curator resource.
    /// https://developer.apple.com/documentation/applemusicapi/curators/attributes
    /// Latest revision Feb 21 2022.

    struct Attributes: Codable {
        public let artwork: ResourceArtwork
        public let editorialNotes: ResourceEditorialNotes?
        public let name: String
        public let url: String
    }

    /// The relationships for a curator object.
    /// https://developer.apple.com/documentation/applemusicapi/curator/relationships

    struct Relationships: Codable {
        public let playlists: AmuseKit.CatalogPlaylistsRelationship?
    }
}
