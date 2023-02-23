//
//  LibraryAlbum.swift
//  AmuseKit
//
//  Created by Jota Uribe on 24/06/20.
//

import Foundation

/// A resource object that represents a library album.
/// https://developer.apple.com/documentation/applemusicapi/libraryalbums
/// Latest revision Feb 21 2022.

public struct LibraryAlbum: Resource {
    public let attributes: Attributes?
    public let href: String?
    public let id: String
    public let relationships: Relationships?
    public let type: String
}

public extension LibraryAlbum {
    
    /// The attributes for a library album object.
    /// https://developer.apple.com/documentation/applemusicapi/libraryalbums/attributes
    /// Latest revision Feb 21 2022.
    
    struct Attributes: Codable {
        public let artistName: String
        public let artwork: ResourceArtwork?
        public let contentRating: String?
        public let dateAdded: String?
        public let name: String
        public let playParams: ResourcePlayParameters?
        public let releaseDate: String?
        public let trackCount: Int
        public let genreNames: [String]
    }

    /// The relationships for a library album object.
    /// https://developer.apple.com/documentation/applemusicapi/libraryalbum/relationships

    struct Relationships: Codable {
        var artists: AmuseKit.LibraryArtistsRelationship?
        var tracks: AmuseKit.LibraryTracksRelationship?
    }
}
