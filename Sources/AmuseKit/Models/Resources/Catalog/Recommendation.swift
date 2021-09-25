//
//  Recommendation.swift
//  AmuseKit
//
//  Created by Jota Uribe on 22/06/20.
//

import Foundation

public extension AmuseKit {
    typealias AlbumsRecommendation = Recommendation<Album>
    typealias PlaylistsRecommendation = Recommendation<Playlist>

    // A Resource object that represents recommended resources for a user calculated using their selected preferences.
    // https://developer.apple.com/documentation/applemusicapi/recommendation

    struct Recommendation<R: Codable>: Resource {
        public let attributes: Attributes?
        public let href: String?
        public let id: String
        public let relationships: Relationships?
        public let type: String
    }
}

public extension AmuseKit.Recommendation {
    // The attributes for a recommendation object.
    // https://developer.apple.com/documentation/applemusicapi/recommendation/attributes

    struct Attributes: Codable {
        public let isGroupRecommendation: Bool
        public let nextUpdateDate: String
        public var reason: String = ""
        public let resourceTypes: [String]
        public let title: Title
    }

    // The relationships for a recommendation object.
    // https://developer.apple.com/documentation/applemusicapi/recommendation/relationships

    struct Relationships: Codable {
        public let contents: AmuseKit.Relationship<R>?
        public let recommendations: AmuseKit.Relationship<R>?
    }
}

public extension AmuseKit.Recommendation.Attributes {
    struct Title: Codable {
        public let stringForDisplay: String
    }
}
