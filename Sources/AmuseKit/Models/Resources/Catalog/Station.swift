//
//  Station.swift
//  AmuseKit
//
//  Created by Jota Uribe on 22/06/20.
//

import Foundation

public extension AmuseKit {
    // A Resource object that represents a station.
    // https://developer.apple.com/documentation/applemusicapi/station

    struct Station: Resource {
        public typealias Relationships = EmptyCodable
        public let attributes: Attributes?
        public let href: String?
        public let id: String
        public let relationships: EmptyCodable?
        public let type: String
    }
}

public extension AmuseKit.Station {
    // The attributes for a station object.
    // https://developer.apple.com/documentation/applemusicapi/station/attributes

    struct Attributes: Codable {
        public let artwork: AmuseKit.Artwork
        public let durationInMillis: Int?
        public let editorialNotes: AmuseKit.EditorialNotes?
        public let episodeNumber: Int?
        public let isLive: Bool
        public let name: String
        public let url: String
    }
}
