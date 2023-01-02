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

        public let albums: AmuseKit.ResponseRoot<CatalogAlbum, EmptyCodable>?
        public let appleCurators: AmuseKit.ResponseRoot<Curator, EmptyCodable>?
        public let artists: AmuseKit.ResponseRoot<CatalogArtist, EmptyCodable>?
        public let curators: AmuseKit.ResponseRoot<Curator, EmptyCodable>?
        public let musicVideos: AmuseKit.ResponseRoot<CatalogMusicVideo, EmptyCodable>?
        public let playlists: AmuseKit.ResponseRoot<CatalogPlaylist, EmptyCodable>?
        public let songs: AmuseKit.ResponseRoot<CatalogSong, EmptyCodable>?
        public let stations: AmuseKit.ResponseRoot<Station, EmptyCodable>?
    }
}
