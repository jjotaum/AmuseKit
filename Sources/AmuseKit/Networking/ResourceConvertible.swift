//
//  ResourceConvertible.swift
//  AmuseKit
//
//  Created by Jota Uribe on 12/07/22.
//

import Foundation


/// Allow to associate generic 'Resources' to retrieve them properly parsed from Apple Music Api using DataProvider.
protocol ResourceConvertible {
    associatedtype Resource
}

// MARK: - LibraryResourceConvertible

public extension AmuseKit {
    enum LibraryResourceType: String, AmuseOption {
        case albums = "library-albums"
        case artists = "library-artists"
        case musicVideos = "library-music-videos"
        case playlists = "library-playlists"
        case songs = "library-songs"
    }
    
    struct LibraryResourceConvertible<Model>: ResourceConvertible {
        typealias Resource = Model
        let rawValue: LibraryResourceType
    }
}

extension AmuseKit.LibraryResourceConvertible where Model == AmuseKit.LibraryAlbum {
    static var albums = Self.init(rawValue: .albums)
}

extension AmuseKit.LibraryResourceConvertible where Model == AmuseKit.LibraryArtist {
    static var artists = Self.init(rawValue: .artists)
}

extension AmuseKit.LibraryResourceConvertible where Model == AmuseKit.LibraryMusicVideo {
    static var musicVideos = Self.init(rawValue: .musicVideos)
}

extension AmuseKit.LibraryResourceConvertible where Model == AmuseKit.LibraryPlaylist {
    static var playlists = Self.init(rawValue: .playlists)
}

extension AmuseKit.LibraryResourceConvertible where Model == AmuseKit.LibrarySong {
    static var songs = Self.init(rawValue: .songs)
}

public extension Set where Element == AmuseKit.LibraryResourceType {
    static var all: Set<Element> {
        return Set(Element.allCases)
    }
}

// MARK: - CatalogResourceConvertible

public extension AmuseKit {
    enum CatalogResourceType: String, AmuseOption {
        case albums, artists, curators, playlists, songs, stations
        case appleCurators = "apple-curators"
        case musicVideos = "music-videos"
    }
    
    struct CatalogResourceConvertible<Model>: ResourceConvertible {
        typealias Resource = Model
        let rawValue: CatalogResourceType
    }
}

extension AmuseKit.CatalogResourceConvertible where Model == AmuseKit.Album {
    static var albums = Self.init(rawValue: .albums)
}

extension AmuseKit.CatalogResourceConvertible where Model == AmuseKit.Artist {
    static var artists = Self.init(rawValue: .artists)
}

extension AmuseKit.CatalogResourceConvertible where Model == AmuseKit.MusicVideo {
    static var musicVideos = Self.init(rawValue: .musicVideos)
}

extension AmuseKit.CatalogResourceConvertible where Model == AmuseKit.Playlist {
    static var playlists = Self.init(rawValue: .playlists)
}

extension AmuseKit.CatalogResourceConvertible where Model == AmuseKit.Song {
    static var songs = Self.init(rawValue: .songs)
}

public extension Set where Element == AmuseKit.CatalogResourceType {
    static var all: Set<Element> {
        return Set(Element.allCases)
    }
}
