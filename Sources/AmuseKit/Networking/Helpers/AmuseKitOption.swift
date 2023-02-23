//
//  AmuseKitOption.swift
//  AmuseKit
//
//  Created by Jota Uribe on 2/01/23.
//

import Foundation

public protocol AmuseKitOption: RawRepresentable, Hashable, CaseIterable {}

public extension Set where Element: AmuseKitOption {
    static var all: Set<Element> {
        return Set(Element.allCases)
    }
}

public enum LibraryResourceType: String, AmuseKitOption {
    case albums = "library-albums"
    case artists = "library-artists"
    case musicVideos = "library-music-videos"
    case playlists = "library-playlists"
    case songs = "library-songs"
}

public enum CatalogResourceType: String, AmuseKitOption {
    case albums, artists, curators, playlists, songs, stations
    case appleCurators = "apple-curators"
    case musicVideos = "music-videos"
}
