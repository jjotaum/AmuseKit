//
//  LibraryTrack.swift
//  AmuseKit
//
//  Created by Jota Uribe on 24/06/20.
//

import Foundation

public extension AmuseKit {
    // A Resource object that represents a library song or music video.
    // https://developer.apple.com/documentation/applemusicapi/librarysong
    // https://developer.apple.com/documentation/applemusicapi/librarymusicvideo

    struct LibraryTrack: Resource {
        public let attributes: Attributes?
        public let href: String?
        public let id: String
        public let relationships: Relationships?
        public let type: String
    }
}

public extension AmuseKit.LibraryTrack {
    // The attributes for a library song or music video object.
    // https://developer.apple.com/documentation/applemusicapi/librarysong/attributes
    // https://developer.apple.com/documentation/applemusicapi/librarymusicvideo/attributes

    struct Attributes: Codable {
        public let albumName: String
        public let artistName: String
        public let artwork: AmuseKit.LibraryArtwork?
        public let contentRating: String?
        public var discNumber: Int = .zero
        public let durationInMillis: Int?
        public let name: String
        public let playParams: AmuseKit.PlayParameters?
        public var trackNumber: Int = .zero
    }

    struct Relationships: Codable {
        public let albums: AmuseKit.LibraryAlbumsRelationship
        public let artists: AmuseKit.LibraryArtistsRelationship
    }
}

