//
//  LibraryMusicVideo.swift
//  AmuseKit
//
//  Created by Jota Uribe on 19/02/22.
//

import Foundation

public extension AmuseKit {
    
    /// A resource object that represents a library music video.
    /// https://developer.apple.com/documentation/applemusicapi/librarymusicvideos
    /// Latest revision Feb 21 2022.

    struct LibraryMusicVideo: Resource {
        public let attributes: Attributes?
        public let href: String?
        public let id: String
        public let relationships: Relationships?
        public let type: String
    }
}

public extension AmuseKit.LibraryMusicVideo {
    
    /// The attributes for the library music videos resource type.
    /// https://developer.apple.com/documentation/applemusicapi/librarymusicvideos/attributes
    /// Latest revision Feb 21 2022. 

    struct Attributes: Codable {
        public let albumName: String?
        public let artistName: String
        public let artwork: AmuseKit.Artwork?
        public let contentRating: String?
        public let durationInMillis: Int
        public let genreNames: [String]
        public let name: String
        public let playParams: AmuseKit.PlayParameters?
        public let releaseDate: String?
        public var trackNumber: Int?
    }
    
    /// The relationships from library music videos to other resources.
    /// https://developer.apple.com/documentation/applemusicapi/librarymusicvideos/relationships

    struct Relationships: Codable {
        public let albums: AmuseKit.LibraryAlbumsRelationship
        public let artists: AmuseKit.LibraryArtistsRelationship
    }
}
