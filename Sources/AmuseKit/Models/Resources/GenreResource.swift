//
//  GenreResource.swift
//  AmuseKit
//
//  Created by Jota Uribe on 22/06/20.
//

import Foundation

public extension AmuseKit {
    
    /// A resource object that represents a music genre.
    /// https://developer.apple.com/documentation/applemusicapi/genres
    /// Latest revision Feb 21 2022.

    struct GenreResource: Resource {
        public typealias Relationships = EmptyCodable
        public let attributes: Attributes?
        public let href: String?
        public let id: String
        public let relationships: EmptyCodable?
        public let type: String
    }
}

public extension AmuseKit.GenreResource {
    
    /// The attributes for a genre resource.
    /// https://developer.apple.com/documentation/applemusicapi/genres/attributes
    /// Latest revision Feb 21 2022.

    struct Attributes: Codable {
        public let name: String
        public let parentId: String?
        public let parentName: String?
    }
}
