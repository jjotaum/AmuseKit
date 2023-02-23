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

public struct LibraryResourceConvertible<Model>: ResourceConvertible {
    typealias Resource = Model
    let rawValue: LibraryResourceType
}

public extension LibraryResourceConvertible where Model == LibraryAlbum {
    static var albums = Self.init(rawValue: .albums)
}

public extension LibraryResourceConvertible where Model == LibraryArtist {
    static var artists = Self.init(rawValue: .artists)
}

public extension LibraryResourceConvertible where Model == LibraryMusicVideo {
    static var musicVideos = Self.init(rawValue: .musicVideos)
}

public extension LibraryResourceConvertible where Model == LibraryPlaylist {
    static var playlists = Self.init(rawValue: .playlists)
}

public extension LibraryResourceConvertible where Model == LibrarySong {
    static var songs = Self.init(rawValue: .songs)
}

// MARK: - CatalogResourceConvertible

public struct CatalogResourceConvertible<Model>: ResourceConvertible {
    typealias Resource = Model
    let rawValue: CatalogResourceType
}

public extension CatalogResourceConvertible where Model == CatalogAlbum {
    static var albums = Self.init(rawValue: .albums)
}

public extension CatalogResourceConvertible where Model == CatalogArtist {
    static var artists = Self.init(rawValue: .artists)
}

public extension CatalogResourceConvertible where Model == CatalogMusicVideo {
    static var musicVideos = Self.init(rawValue: .musicVideos)
}

public extension CatalogResourceConvertible where Model == CatalogPlaylist {
    static var playlists = Self.init(rawValue: .playlists)
}

public extension CatalogResourceConvertible where Model == CatalogSong {
    static var songs = Self.init(rawValue: .songs)
}
