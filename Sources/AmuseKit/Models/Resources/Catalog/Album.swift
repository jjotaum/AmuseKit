//
//  Album.swift
//  AmuseKit
//
//  Created by Jota Uribe on 15/06/20.
//

import Foundation

public extension AmuseKit {
    // A Resource object that represents an album.
    // https://developer.apple.com/documentation/applemusicapi/album

    struct Album: Resource {
        public let attributes: Attributes?
        public let href: String?
        public let id: String
        public let relationships: Relationships?
        public let type: String
    }
}

public extension AmuseKit.Album {
    // The attributes for an album object.
    // https://developer.apple.com/documentation/applemusicapi/album/attributes

    struct Attributes: Codable {
        public let albumName: String?
        public let artistName: String
        public let artwork: AmuseKit.Artwork?
        public let contentRating: String?
        public let copyright: String?
        public let editorialNotes: AmuseKit.EditorialNotes?
        public let genreNames: [String]
        public let isComplete: Bool
        public let isSingle: Bool
        public let name: String
        public let playParams: AmuseKit.PlayParameters?
        public let recordLabel: String?
        public let releaseDate: String
        public let trackCount: Int
        public let url: String
        public let isMasteredForItunes: Bool
    }

    // The relationships for an album object.
    // https://developer.apple.com/documentation/applemusicapi/album/relationships

    struct Relationships: Codable {
        public let artists: AmuseKit.AlbumsRelationship?
        public let genres: AmuseKit.GenresRelationship?
        public let tracks: AmuseKit.TrackRelationship?
    }
}
