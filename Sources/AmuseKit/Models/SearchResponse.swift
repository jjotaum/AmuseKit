//
//  SearchResponse.swift
//  AmuseKit
//
//  Created by Jota Uribe on 15/06/20.
//

import Foundation

public extension AmuseKit {
    // The response to a search request.
    // https://developer.apple.com/documentation/applemusicapi/searchresponse

    typealias SearchResponse = ResponseRoot<EmptyCodable, SearchResults>
}

public extension AmuseKit {
    // An object that represents the results of a catalog search query.
    // https://developer.apple.com/documentation/applemusicapi/searchresults

    struct SearchResults: Codable {
        enum CodingKeys: String, CodingKey {
            case albums, artists, curators, playlists, songs, stations
            case appleCurators = "apple-curators"
            case musicVideos = "music-videos"
        }

        public let albums: AmuseKit.ResponseRoot<Album, EmptyCodable>?
        public let appleCurators: AmuseKit.ResponseRoot<Curator, EmptyCodable>?
        public let artists: AmuseKit.ResponseRoot<Artist, EmptyCodable>?
        public let curators: AmuseKit.ResponseRoot<Curator, EmptyCodable>?
        public let musicVideos: AmuseKit.ResponseRoot<MusicVideo, EmptyCodable>?
        public let playlists: AmuseKit.ResponseRoot<Playlist, EmptyCodable>?
        public let songs: AmuseKit.ResponseRoot<Track, EmptyCodable>?
        public let stations: AmuseKit.ResponseRoot<Station, EmptyCodable>?
    }
}
