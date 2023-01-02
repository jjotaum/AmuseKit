//
//  CatalogArtist.swift
//  AmuseKit
//
//  Created by Jota Uribe on 15/06/20.
//

import Foundation

public extension AmuseKit {
    
    /// A resource object that represents an artist of an album where an artist can be one or more persons.
    /// https://developer.apple.com/documentation/applemusicapi/artists-uip
    /// Latest revision Feb 21 2022.

    struct CatalogArtist: Resource {
        public let attributes: Attributes?
        public let href: String?
        public let id: String
        public let relationships: Relationships?
        public let type: String
    }
}

public extension AmuseKit.CatalogArtist {

    /// The attributes for an artist resource.
    /// https://developer.apple.com/documentation/applemusicapi/artists/attributes
    /// Latest revision Feb 21 2022.

    struct Attributes: Codable {
        public let editorialNotes: AmuseKit.EditorialNotes?
        public let genreNames: [String]
        public let name: String
        public let url: String
    }

    /// The relationships for an artist object.
    /// https://developer.apple.com/documentation/applemusicapi/artist/relationships
    /// Latest revision Feb 21 2022. 

    struct Relationships: Codable {
        public let albums: AmuseKit.CatalogAlbumsRelationship?
        public let genres: AmuseKit.GenresRelationship?
        public let musicVideos: AmuseKit.CatalogMusicVideosRelationship?
        public let playlists: AmuseKit.CatalogPlaylistsRelationship?
    }
}
