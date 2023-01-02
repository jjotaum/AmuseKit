//
//  CatalogMusicVideo.swift
//  AmuseKit
//
//  Created by Jota Uribe on 22/06/20.
//

import Foundation

public extension AmuseKit {
    
    /// A resource object that represents a music video.
    /// https://developer.apple.com/documentation/applemusicapi/musicvideos
    /// Latest revision Feb 21 2022.

    struct CatalogMusicVideo: Resource {
        public let attributes: Attributes?
        public let href: String?
        public let id: String
        public let relationships: Relationships?
        public let type: String
    }
}

public extension AmuseKit.CatalogMusicVideo {
    
    /// The attributes for a music video resource.
    /// https://developer.apple.com/documentation/applemusicapi/musicvideos/attributes
    /// Latest revision Feb 21 2022.

    struct Attributes: Codable {
        public let albumName: String?
        public let artistName: String
        public let artwork: AmuseKit.Artwork
        public let contentRating: String?
        public let durationInMillis: Int?
        public let editorialNotes: AmuseKit.EditorialNotes?
        public let genreNames: [String]
        public let has4K: Bool
        public let hasHDR: Bool
        public let isrc: String?
        public let name: String
        public let playParams: AmuseKit.PlayParameters?
        public let previews: [AmuseKit.Preview]
        public let releaseDate: String?
        public let trackNumber: Int?
        public let url: URL
        public let videoSubType: String?
        public let workId: String?
        public let workName: String?
        public let artistUrl: String?
    }

    /// The relationships for a music video object.
    /// https://developer.apple.com/documentation/applemusicapi/musicvideo/relationships

    struct Relationships: Codable {
        public let albums: AmuseKit.CatalogAlbumsRelationship?
        public let artists: AmuseKit.CatalogArtistsRelationship?
        public let genres: AmuseKit.GenresRelationship?
    }
}
