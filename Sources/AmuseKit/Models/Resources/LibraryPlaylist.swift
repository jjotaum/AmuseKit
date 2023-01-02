//
//  LibraryPlaylist.swift
//  AmuseKit
//
//  Created by Jota Uribe on 24/06/20.
//

import Foundation

/// A resource object that represents a library playlist.
/// https://developer.apple.com/documentation/applemusicapi/libraryplaylists
/// Latest revision Feb 21 2022.

public struct LibraryPlaylist: Resource {
    public let attributes: Attributes?
    public let href: String?
    public let id: String
    public let relationships: Relationships?
    public let type: String
}

public extension LibraryPlaylist {
    
    /// The attributes for a library playlist resource.
    /// https://developer.apple.com/documentation/applemusicapi/libraryplaylists/attributes
    /// Latest revision Feb 21 2022.

    struct Attributes: Codable {
        public let artwork: ResourceArtwork?
        public let canEdit: Bool
        public let dateAdded: String?
        public let description: ResourceEditorialNotes?
        public let hasCatalog: Bool
        public let name: String
        public let playParams: ResourcePlayParameters?
    }

    /// The relationships for a library playlist object.
    /// https://developer.apple.com/documentation/applemusicapi/libraryplaylist/relationships

    struct Relationships: Codable {
        public let tracks: AmuseKit.LibraryTracksRelationship?
    }
}
