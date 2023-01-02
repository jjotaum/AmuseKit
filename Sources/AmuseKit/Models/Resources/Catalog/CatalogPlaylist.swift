//
//  Playlist.swift
//  AmuseKit
//
//  Created by Jota Uribe on 15/06/20.
//

import Foundation

public enum PlaylistType: String, Codable {
    /// A playlist created by an Apple Music curator.
    case editorial
    /// external: A playlist created by a non-Apple curator or brand.
    case external
    /// personal-mix: A personalized playlist for an Apple Music user.
    case personal = "personal-mix"
    /// A playlist created and shared by an Apple Music user.
    case userShared = "user-shared"
}

public extension AmuseKit {
    
    /// A Resource object that represents a playlist.
    /// https://developer.apple.com/documentation/applemusicapi/playlists
    /// Latest revision Feb 21 2022.

    struct CatalogPlaylist: Resource {
        public let attributes: Attributes?
        public let href: String?
        public let id: String
        public let relationships: Relationships?
        public let type: String
    }
}

public extension AmuseKit.CatalogPlaylist {
    
    /// The attributes for a playlist object.
    /// https://developer.apple.com/documentation/applemusicapi/playlists/attributes
    /// Latest revision Feb 21 2022.

    struct Attributes: Codable {
        public let artwork: AmuseKit.Artwork?
        public let curatorName: String
        public let description: AmuseKit.EditorialNotes?
        public let isChart: Bool
        public let lastModifiedDate: String
        public let playlistType: String
        public let name: String
        public let playParams: AmuseKit.PlayParameters
        public let url: String
        public let trackTypes: [String]?
    }

    /// The relationships for a playlist object.
    /// https://developer.apple.com/documentation/applemusicapi/playlist/relationships

    struct Relationships: Codable {
        public let curator: AmuseKit.CuratorsRelationship?
        public let tracks: AmuseKit.CatalogSongsRelationship?
    }
}
