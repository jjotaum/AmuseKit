//
//  Genre.swift
//  AmuseKit
//
//  Created by Jota Uribe on 22/06/20.
//

import Foundation

public extension AmuseKit {
    // An object that represents a genre for resources.
    // https://developer.apple.com/documentation/applemusicapi/genre

    struct Genre: Resource {
        public typealias Relationships = EmptyCodable
        public let attributes: Attributes?
        public let href: String?
        public let id: String
        public let relationships: EmptyCodable?
        public let type: String
    }
}

public extension AmuseKit.Genre {
    // The attributes for a genre object.
    // https://developer.apple.com/documentation/applemusicapi/genre/attributes

    struct Attributes: Codable {
        public let name: String
    }
}
