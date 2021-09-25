//
//  Track.swift
//  AmuseKit
//
//  Created by Jota Uribe on 15/06/20.
//

import Foundation

public extension AmuseKit {
    // A Resource object that represents a song.
    // https://developer.apple.com/documentation/applemusicapi/song

    struct Track: Resource {
        public let attributes: Attributes?
        public let href: String?
        public let id: String
        public let relationships: Relationships?
        public let type: String
    }
}

public extension AmuseKit.Track {

    // The attributes for a song object.
    // https://developer.apple.com/documentation/applemusicapi/song/attributes

    struct Attributes: Codable {
        public let albumName: String
        public let artistName: String
        public let artwork: AmuseKit.Artwork
        public let composerName: String?
        public let contentRating: String?
        public let discNumber: Int
        public let durationInMillis: Int?
        public let editorialNotes: AmuseKit.EditorialNotes?
        public let genreNames: [String]
        public let isrc: String
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
    }

    struct Relationships: Codable {
        public let albums: AmuseKit.AlbumsRelationship
        public let artists: AmuseKit.ArtistsRelationship
        public let genres: AmuseKit.GenresRelationship?
    }
}
