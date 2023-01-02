//
//  Station.swift
//  AmuseKit
//
//  Created by Jota Uribe on 22/06/20.
//

import Foundation

public extension AmuseKit {
    
    /// A resource object that represents a station.
    /// https://developer.apple.com/documentation/applemusicapi/stations
    /// Latest revision Feb 21 2022.

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
    
    /// The attributes for a station resource.
    /// https://developer.apple.com/documentation/applemusicapi/stations/attributes
    /// Latest revision Feb 21 2022.

    struct Attributes: Codable {
        public let artwork: AmuseKit.Artwork
        public let durationInMillis: Int?
        public let editorialNotes: AmuseKit.EditorialNotes?
        public let episodeNumber: Int?
        public let contentRating: String?
        public let isLive: Bool
        public let name: String
        public let stationProviderName: String?
        public let url: String
    }
}
