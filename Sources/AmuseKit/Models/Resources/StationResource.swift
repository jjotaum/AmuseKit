//
//  StationResource.swift
//  AmuseKit
//
//  Created by Jota Uribe on 22/06/20.
//

import Foundation

/// A resource object that represents a station.
/// https://developer.apple.com/documentation/applemusicapi/stations
/// Latest revision Feb 21 2022.

public struct StationResource: Resource {
    public typealias Relationships = AmuseKit.EmptyCodable
    public let attributes: Attributes?
    public let href: String?
    public let id: String
    public let relationships: AmuseKit.EmptyCodable?
    public let type: String
}

public extension StationResource {
    
    /// The attributes for a station resource.
    /// https://developer.apple.com/documentation/applemusicapi/stations/attributes
    /// Latest revision Feb 21 2022.

    struct Attributes: Codable {
        public let artwork: ResourceArtwork
        public let durationInMillis: Int?
        public let editorialNotes: ResourceEditorialNotes?
        public let episodeNumber: Int?
        public let contentRating: String?
        public let isLive: Bool
        public let name: String
        public let stationProviderName: String?
        public let url: String
    }
}
