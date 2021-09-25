//
//  MusicVideo.swift
//  AmuseKit
//
//  Created by Jota Uribe on 22/06/20.
//

import Foundation

public extension AmuseKit {
    // A Resource object that represents a music video.
    // https://developer.apple.com/documentation/applemusicapi/musicvideo

    struct MusicVideo: Resource {
        public let attributes: Attributes?
        public let href: String?
        public let id: String
        public let relationships: Relationships?
        public let type: String
    }
}

public extension AmuseKit.MusicVideo {
    // The attributes for a music video object.
    // https://developer.apple.com/documentation/applemusicapi/musicvideo/attributes

    struct Attributes: Codable {
        public let albumName: String?
        public let artistName: String
        public let artwork: AmuseKit.Artwork
        public let contentRating: String?
        public let durationInMillis: Int?
        public let editorialNotes: AmuseKit.EditorialNotes?
        public let genreNames: [String]
        public let isrc: String
        public let name: String
        public let playParams: AmuseKit.PlayParameters?
        public let previews: [AmuseKit.Preview]
        public let releaseDate: String
        public let trackNumber: Int?
        public let url: URL
        public let videoSubType: String?
        public let hasHDR: Bool
        public let has4K: Bool
    }

    // The relationships for a music video object.
    // https://developer.apple.com/documentation/applemusicapi/musicvideo/relationships

    struct Relationships: Codable {
        public let albums: AmuseKit.AlbumsRelationship?
        public let artists: AmuseKit.ArtistsRelationship?
        public let genres: AmuseKit.GenresRelationship?
    }
}
