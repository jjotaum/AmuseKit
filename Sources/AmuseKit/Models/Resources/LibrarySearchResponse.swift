//
//  LibrarySearchResponse.swift
//  AmuseKit
//
//  Created by Jota Uribe on 21/02/22.
//

import Foundation

public extension AmuseKit {
    
    /// The response to a request for a library search.
    /// https://developer.apple.com/documentation/applemusicapi/librarysearchresponse
    /// Latest revision Feb 21 2022.

    typealias LibrarySearchResponse = ResponseRoot<EmptyCodable, LibrarySearchResults>
}

public extension AmuseKit {
    
    /// An object that represents the results of a library search query.
    /// https://developer.apple.com/documentation/applemusicapi/librarysearchresponse/results
    /// Latest revision Feb 21 2022.

    struct LibrarySearchResults: Codable {
        enum CodingKeys: String, CodingKey {
            case albums = "library-albums"
            case artists = "library-artists"
            case musicVideos = "library-music-videos"
            case playlists = "library-playlists"
            case songs = "library-songs"
        }

        public let albums: AmuseKit.ResponseRoot<LibraryAlbum, EmptyCodable>?
        public let artists: AmuseKit.ResponseRoot<LibraryArtist, EmptyCodable>?
        public let musicVideos: AmuseKit.ResponseRoot<LibraryMusicVideo, EmptyCodable>?
        public let playlists: AmuseKit.ResponseRoot<LibraryPlaylist, EmptyCodable>?
        public let songs: AmuseKit.ResponseRoot<LibrarySong, EmptyCodable>?
    }
}
