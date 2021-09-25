//
//  Artist.swift
//  AmuseKit
//
//  Created by Jota Uribe on 15/06/20.
//

import Foundation

public extension AmuseKit {
    // A Resource object that represents an artist of an album where an artist can be one or more persons.
    // https://developer.apple.com/documentation/applemusicapi/artist

    struct Artist: Resource {
        public let attributes: Attributes?
        public let href: String?
        public let id: String
        public let relationships: Relationships?
        public let type: String
    }
}

public extension AmuseKit.Artist {

    // The attributes for an artist object.
    // https://developer.apple.com/documentation/applemusicapi/artist/attributes

    struct Attributes: Codable {
        public let editorialNotes: AmuseKit.EditorialNotes?
        public let genreNames: [String]
        public let name: String
        public let url: String
    }

    // The relationships for an artist object.
    // https://developer.apple.com/documentation/applemusicapi/artist/relationships

    struct Relationships: Codable {
        public let albums: AmuseKit.AlbumsRelationship?
        public let genres: AmuseKit.GenresRelationship?
        public let musicVideos: AmuseKit.MusicVideosRelationship?
        public let playlists: AmuseKit.PlaylistRelationship?
    }
}
