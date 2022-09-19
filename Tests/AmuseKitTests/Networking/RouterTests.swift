//
//  RouterTests.swift
//  AmuseKit
//
//  Created by Jota Uribe on 19/02/22.
//

import XCTest
@testable import AmuseKit

class RouterTests: XCTestCase {
    let countryCode: String = "us"
    
    // MARK: - Catalog Routers
    
    func test_catalogAlbumsRouter_returnsValidURLRequest() throws {
        let router = AmuseKit.Router.catalog(countryCode: countryCode, resourceType: .albums)
        let url = router.asURL([])
        XCTAssertEqual(url?.lastPathComponent, "albums")
        let request = try XCTUnwrap(router.asURLRequest([]))
        XCTAssertEqual(request.url?.absoluteString, "https://api.music.apple.com/v1/catalog/us/albums?")
        
    }
    
    func test_catalogArtistsRouter_returnsValidURLRequest() throws {
        let router = AmuseKit.Router.catalog(countryCode: countryCode, resourceType: .artists)
        let url = router.asURL([])
        XCTAssertEqual(url?.lastPathComponent, "artists")
        let request = try XCTUnwrap(router.asURLRequest([]))
        XCTAssertEqual(request.url?.absoluteString, "https://api.music.apple.com/v1/catalog/us/artists?")
    }
    
    func test_catalogMusicVideosRouter_returnsValidURLRequest() throws {
        let router = AmuseKit.Router.catalog(countryCode: countryCode, resourceType: .musicVideos)
        let url = router.asURL([])
        XCTAssertEqual(url?.lastPathComponent, "music-videos")
        let request = try XCTUnwrap(router.asURLRequest([]))
        XCTAssertEqual(request.url?.absoluteString, "https://api.music.apple.com/v1/catalog/us/music-videos?")
    }
    
    func test_catalogPlaylistsRouter_returnsValidURLRequest() throws {
        let router = AmuseKit.Router.catalog(countryCode: countryCode, resourceType: .playlists)
        let url = router.asURL([])
        XCTAssertEqual(url?.lastPathComponent, "playlists")
        let request = try XCTUnwrap(router.asURLRequest([]))
        XCTAssertEqual(request.url?.absoluteString, "https://api.music.apple.com/v1/catalog/us/playlists?")
    }

    func test_catalogSongsRouter_returnsValidURLRequest() throws {
        let router = AmuseKit.Router.catalog(countryCode: countryCode, resourceType: .songs)
        let url = router.asURL([])
        XCTAssertEqual(url?.lastPathComponent, "songs")
        let request = try XCTUnwrap(router.asURLRequest([]))
        XCTAssertEqual(request.url?.absoluteString, "https://api.music.apple.com/v1/catalog/us/songs?")
    }
    
    // MARK: - Library Routers
    
    func test_libraryAlbumsRouter_returnsValidURLRequest() throws {
        let router = AmuseKit.Router.library(.albums)
        let url = router.asURL([])
        XCTAssertEqual(url?.lastPathComponent, "albums")
        let request = try XCTUnwrap(router.asURLRequest([]))
        XCTAssertEqual(request.url?.absoluteString, "https://api.music.apple.com/v1/me/library/albums?")
    }
    
    func test_libraryArtistsRouter_returnsValidURLRequest() throws {
        let router = AmuseKit.Router.library(.artists)
        let url = router.asURL([])
        XCTAssertEqual(url?.lastPathComponent, "artists")
        let request = try XCTUnwrap(router.asURLRequest([]))
        XCTAssertEqual(request.url?.absoluteString, "https://api.music.apple.com/v1/me/library/artists?")
    }
    
    func test_libraryMusicVideosRouter_returnsValidURLRequest() throws {
        let router = AmuseKit.Router.library(.musicVideos)
        let url = router.asURL([])
        XCTAssertEqual(url?.lastPathComponent, "music-videos")
        let request = try XCTUnwrap(router.asURLRequest([]))
        XCTAssertEqual(request.url?.absoluteString, "https://api.music.apple.com/v1/me/library/music-videos?")
    }
    
    func test_libraryPlaylistsRouter_returnsValidURLRequest() throws {
        let router = AmuseKit.Router.library(.playlists)
        let url = router.asURL([])
        XCTAssertEqual(url?.lastPathComponent, "playlists")
        let request = try XCTUnwrap(router.asURLRequest([]))
        XCTAssertEqual(request.url?.absoluteString, "https://api.music.apple.com/v1/me/library/playlists?")
    }

    func test_librarySongsRouter_returnsValidURLRequest() throws {
        let router = AmuseKit.Router.library(.songs)
        let url = router.asURL([])
        XCTAssertEqual(url?.lastPathComponent, "songs")
        let request = try XCTUnwrap(router.asURLRequest([]))
        XCTAssertEqual(request.url?.absoluteString, "https://api.music.apple.com/v1/me/library/songs?")
    }
    
    // MARK: - Recommendations
    
    func test_recommendationsRouter_returnsValidURLRequest() throws {
        let router = AmuseKit.Router.recommendations
        let url = router.asURL([])
        XCTAssertEqual(url?.lastPathComponent, "recommendations")
        let request = try XCTUnwrap(router.asURLRequest([]))
        XCTAssertEqual(request.url?.absoluteString, "https://api.music.apple.com/v1/me/recommendations?")
    }
    
    // MARK: - Search
    
    func test_librarySearchRouter_returnsValidURLRequest() throws {
        let router = AmuseKit.Router.librarySearch
        let url = router.asURL([])
        XCTAssertEqual(url?.lastPathComponent, "search")
        let request = try XCTUnwrap(router.asURLRequest([]))
        XCTAssertEqual(request.url?.absoluteString, "https://api.music.apple.com/v1/me/library/search?")
    }
    
    func test_searchRouter_returnsValidURLRequest() throws {
        let router = AmuseKit.Router.search(countryCode: countryCode)
        let url = router.asURL([])
        XCTAssertEqual(url?.lastPathComponent, "search")
        let request = try XCTUnwrap(router.asURLRequest([]))
        XCTAssertEqual(request.url?.absoluteString, "https://api.music.apple.com/v1/catalog/us/search?")
    }
    
    static var allTests = [
        // Catalog
        ("test_catalogAlbumsRouter_returnsValidURLRequest", test_catalogAlbumsRouter_returnsValidURLRequest),
        ("test_catalogArtistsRouter_returnsValidURLRequest", test_catalogArtistsRouter_returnsValidURLRequest),
        ("test_catalogMusicVideosRouter_returnsValidURLRequest", test_catalogMusicVideosRouter_returnsValidURLRequest),
        ("test_catalogPlaylistsRouter_returnsValidURLRequest", test_catalogPlaylistsRouter_returnsValidURLRequest),
        ("test_catalogSongsRouter_returnsValidURLRequest", test_catalogSongsRouter_returnsValidURLRequest),
        // Library
        ("test_libraryAlbumsRouter_returnsValidURLRequest", test_libraryAlbumsRouter_returnsValidURLRequest),
        ("test_libraryArtistsRouter_returnsValidURLRequest", test_libraryArtistsRouter_returnsValidURLRequest),
        ("test_libraryMusicVideosRouter_returnsValidURLRequest", test_libraryMusicVideosRouter_returnsValidURLRequest),
        ("test_libraryPlaylistsRouter_returnsValidURLRequest", test_libraryPlaylistsRouter_returnsValidURLRequest),
        ("test_librarySongsRouter_returnsValidURLRequest", test_librarySongsRouter_returnsValidURLRequest),
        // Recommendations
        ("test_recommendationsRouter_returnsValidURLRequest", test_recommendationsRouter_returnsValidURLRequest),
        // Search
        ("test_librarySearchRouter_returnsValidURLRequest", test_librarySearchRouter_returnsValidURLRequest),
        ("test_searchRouter_returnsValidURLRequest", test_searchRouter_returnsValidURLRequest)
    ]
}
