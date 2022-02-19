//
//  RouterTests.swift
//  AmuseKit
//
//  Created by Jota Uribe on 19/02/22.
//

import XCTest
@testable import AmuseKit

class RouterTests: XCTestCase {
    
    func testLibraryPlaylistsRouter() throws {
        let router = AmuseKit.Router.library(.playlists)
        let url = router.asURL([])
        XCTAssertEqual(url?.lastPathComponent, "playlists")
        _ = try XCTUnwrap(router.asURLRequest([]))
    }
    
    func testLibraryAlbumsRouter() throws {
        let router = AmuseKit.Router.library(.albums)
        let url = router.asURL([])
        XCTAssertEqual(url?.lastPathComponent, "albums")
        _ = try XCTUnwrap(router.asURLRequest([]))
    }
    
    func testLibraryArtistsRouter() throws {
        let router = AmuseKit.Router.library(.artists)
        let url = router.asURL([])
        XCTAssertEqual(url?.lastPathComponent, "artists")
        _ = try XCTUnwrap(router.asURLRequest([]))
    }

    func testLibrarySongsRouter() throws {
        let router = AmuseKit.Router.library(.songs)
        let url = router.asURL([])
        XCTAssertEqual(url?.lastPathComponent, "songs")
        _ = try XCTUnwrap(router.asURLRequest([]))
    }
    
    func testLibraryMusicVideosRouter() throws {
        let router = AmuseKit.Router.library(.musicVideos)
        let url = router.asURL([])
        XCTAssertEqual(url?.lastPathComponent, "music-videos")
        _ = try XCTUnwrap(router.asURLRequest([]))
    }
    
    static var allTests = [
        ("testLibraryPlaylistsRouter", testLibraryPlaylistsRouter),
        ("testLibraryAlbumsRouter", testLibraryAlbumsRouter),
        ("testLibraryArtistsRouter", testLibraryArtistsRouter),
        ("testLibrarySongsRouter", testLibrarySongsRouter),
        ("testLibraryMusicVideosRouter", testLibraryMusicVideosRouter)
    ]
}
