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

extension LibraryResourceConvertible where Model == LibraryAlbum {
    static var albums = Self.init(rawValue: .albums)
}

extension LibraryResourceConvertible where Model == LibraryArtist {
    static var artists = Self.init(rawValue: .artists)
}

extension LibraryResourceConvertible where Model == LibraryMusicVideo {
    static var musicVideos = Self.init(rawValue: .musicVideos)
}

extension LibraryResourceConvertible where Model == LibraryPlaylist {
    static var playlists = Self.init(rawValue: .playlists)
}

extension LibraryResourceConvertible where Model == LibrarySong {
    static var songs = Self.init(rawValue: .songs)
}

// MARK: - CatalogResourceConvertible

public struct CatalogResourceConvertible<Model>: ResourceConvertible {
    typealias Resource = Model
    let rawValue: CatalogResourceType
}

extension CatalogResourceConvertible where Model == CatalogAlbum {
    static var albums = Self.init(rawValue: .albums)
}

extension CatalogResourceConvertible where Model == CatalogArtist {
    static var artists = Self.init(rawValue: .artists)
}

extension CatalogResourceConvertible where Model == CatalogMusicVideo {
    static var musicVideos = Self.init(rawValue: .musicVideos)
}

extension CatalogResourceConvertible where Model == CatalogPlaylist {
    static var playlists = Self.init(rawValue: .playlists)
}

extension CatalogResourceConvertible where Model == CatalogSong {
    static var songs = Self.init(rawValue: .songs)
}
