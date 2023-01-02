//
//  LibraryArtist.swift
//  AmuseKit
//
//  Created by Jota Uribe on 24/06/20.
//

import Foundation

/// A resource object that represents an artist present in a user’s library.
/// https://developer.apple.com/documentation/applemusicapi/libraryartists
/// Latest revision Feb 21 2022.

public struct LibraryArtist: Resource {
    public let attributes: Attributes?
    public let href: String?
    public let id: String
    public let relationships: Relationships?
    public let type: String
}

public extension LibraryArtist {
    
    /// The attributes for a library artist resource.
    /// https://developer.apple.com/documentation/applemusicapi/libraryartists/attributes
    /// Latest revision Feb 21 2022. 

    struct Attributes: Codable {
        public let name: String
    }

    /// The relationships for the library artist.
    /// https://developer.apple.com/documentation/applemusicapi/libraryartist/relationships

    struct Relationships: Codable {
        public let albums: AmuseKit.LibraryAlbumsRelationship
    }
}
