//
//  CatalogAlbum.swift
//  AmuseKit
//
//  Created by Jota Uribe on 15/06/20.
//

import Foundation

public extension AmuseKit {
    
    /// A resource object that represents an album.
    /// https://developer.apple.com/documentation/applemusicapi/albums
    /// Latest revision Feb 21 2022.

    struct CatalogAlbum: Resource {
        public let attributes: Attributes?
        public let href: String?
        public let id: String
        public let relationships: Relationships?
        public let type: String
    }
}

public extension AmuseKit.CatalogAlbum {
    
    /// The attributes for an album resource.
    /// https://developer.apple.com/documentation/applemusicapi/albums/attributes
    /// Latest revision Feb 21 2022.

    struct Attributes: Codable {
        public let artistName: String
        public let artwork: AmuseKit.Artwork
        public let contentRating: String?
        public let copyright: String?
        public let editorialNotes: AmuseKit.EditorialNotes?
        public let genreNames: [String]
        public let isCompilation: Bool
        public let isComplete: Bool
        public let isMasteredForItunes: Bool
        public let isSingle: Bool
        public let name: String
        public let playParams: AmuseKit.PlayParameters?
        public let recordLabel: String?
        public let releaseDate: String?
        public let trackCount: Int
        public let upc: String
        public let url: String
    }

    /// The relationships for an album object.
    /// https://developer.apple.com/documentation/applemusicapi/album/relationships

    struct Relationships: Codable {
        public let artists: AmuseKit.CatalogAlbumsRelationship?
        public let genres: AmuseKit.GenresRelationship?
        public let tracks: AmuseKit.CatalogSongsRelationship?
    }
}
