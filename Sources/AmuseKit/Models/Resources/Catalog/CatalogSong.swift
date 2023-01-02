//
//  Song.swift
//  AmuseKit
//
//  Created by Jota Uribe on 15/06/20.
//

import Foundation

public extension AmuseKit {
    
    /// A resource object that represents a song.
    /// https://developer.apple.com/documentation/applemusicapi/songs
    /// Latest revision Feb 21 2022.

    struct CatalogSong: Resource {
        public let attributes: Attributes?
        public let href: String?
        public let id: String
        public let relationships: Relationships?
        public let type: String
    }
}

public extension AmuseKit.CatalogSong {

    /// The attributes for a song resource.
    /// https://developer.apple.com/documentation/applemusicapi/songs/attributes
    /// Latest revision Feb 21 2022.

    struct Attributes: Codable {
        public let albumName: String
        public let artistName: String
        public let artwork: AmuseKit.Artwork
        public let attribution: String?
        public let composerName: String?
        public let contentRating: String?
        public let discNumber: Int?
        public let durationInMillis: Int
        public let editorialNotes: AmuseKit.EditorialNotes?
        public let genreNames: [String]
        public let isrc: String?
        public let movementCount: Int?
        public let movementName: String?
        public let movementNumber: Int?
        public let name: String
        public let playParams: AmuseKit.PlayParameters?
        public let previews: [AmuseKit.Preview]
        public let releaseDate: String
        public let trackNumber: Int
        public let url: String
        public let workName: String?
        public let artistUrl: String?
    }
    
    /// The relationships for a song resource.
    /// https://developer.apple.com/documentation/applemusicapi/songs/relationships

    struct Relationships: Codable {
        public let albums: AmuseKit.CatalogAlbumsRelationship?
        public let artists: AmuseKit.CatalogArtistsRelationship?
        public let genres: AmuseKit.GenresRelationship?
    }
}
