//
//  Relationship.swift
//  AmuseKit
//
//  Created by Jota Uribe on 22/06/20.
//

import Foundation

public extension AmuseKit {
    /// A to-one or to-many relationship from one resource object to others.
    /// https://developer.apple.com/documentation/applemusicapi/relationship
    /// Latest revision Feb 21 2022.

    struct Relationship<Resource: Codable>: Codable {
        public let data: [Resource]?
        public let href: String
        public let next: String?
    }

    typealias AlbumsRelationship = Relationship<Album>
    typealias ArtistsRelationship = Relationship<Artist>
    typealias CuratorsRelationship = Relationship<Curator>
    typealias GenresRelationship = Relationship<Genre>
    typealias MusicVideosRelationship = Relationship<MusicVideo>
    typealias PlaylistRelationship = Relationship<Playlist>
    typealias SongRelationship = Relationship<Song>

    typealias LibraryAlbumsRelationship = Relationship<LibraryAlbum>
    typealias LibraryArtistsRelationship = Relationship<LibraryArtist>
    typealias LibraryPlaylistsRelationship = Relationship<LibraryPlaylist>
    typealias LibraryTracksRelationship = Relationship<LibrarySong>
}
