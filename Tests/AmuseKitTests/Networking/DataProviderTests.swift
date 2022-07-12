//
//  DataProviderTests.swift
//  AmuseKit
//
//  Created by Jota Uribe on 18/06/21.
//

@testable import AmuseKit
import Combine
import XCTest

final class DataProviderTests: XCTestCase {
    
    let timeout: TimeInterval = 2.0
    var tasks: Set<AnyCancellable> = []
    
    override func tearDown() {
        tasks = []
    }
    
    // MARK: - Catalog Methods
    
    func testCatalogAlbums() throws {
        let completionExpectation = XCTestExpectation(description: "completion should be called")
        let valueExpectation = XCTestExpectation(description: "value callback should be called")
        let mock = mockDataProvider(resourceName: "catalog_albums")
        try mock.catalog(.albums, ids: ["123", "456", "789"])
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { _ in
                completionExpectation.fulfill()
            }, receiveValue: { value in
                XCTAssertNotNil(value.data)
                valueExpectation.fulfill()
            }).store(in: &tasks)

        wait(for: [completionExpectation, valueExpectation], timeout: timeout)
    }
    
    func testCatalogArtists() throws {
        let completionExpectation = XCTestExpectation(description: "completion should be called")
        let valueExpectation = XCTestExpectation(description: "value callback should be called")
        let mock = mockDataProvider(resourceName: "catalog_artists")
        try mock.catalog(.artists, ids: ["123", "456", "789"])
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { _ in
                completionExpectation.fulfill()
            }, receiveValue: { value in
                XCTAssertNotNil(value.data)
                valueExpectation.fulfill()
            }).store(in: &tasks)

        wait(for: [completionExpectation, valueExpectation], timeout: timeout)
    }
    
    func testCatalogMusicVideos() throws {
        let completionExpectation = XCTestExpectation(description: "completion should be called")
        let valueExpectation = XCTestExpectation(description: "value callback should be called")
        let mock = mockDataProvider(resourceName: "catalog_music-videos")
        try mock.catalog(.musicVideos, ids: ["123", "456", "789"])
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { response in
                print(response)
                completionExpectation.fulfill()
            }, receiveValue: { value in
                XCTAssertNotNil(value.data)
                valueExpectation.fulfill()
            }).store(in: &tasks)

        wait(for: [completionExpectation, valueExpectation], timeout: timeout)
    }
    
    func testCatalogPlaylists() throws {
        let completionExpectation = XCTestExpectation(description: "completion should be called")
        let valueExpectation = XCTestExpectation(description: "value callback should be called")
        let mock = mockDataProvider(resourceName: "catalog_playlists")
        try mock.catalog(.playlists, ids: ["123", "456", "789"])
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { _ in
                completionExpectation.fulfill()
            }, receiveValue: { value in
                XCTAssertNotNil(value.data)
                valueExpectation.fulfill()
            }).store(in: &tasks)

        wait(for: [completionExpectation, valueExpectation], timeout: timeout)
    }
    
    func testCatalogSongs() throws {
        let completionExpectation = XCTestExpectation(description: "completion should be called")
        let valueExpectation = XCTestExpectation(description: "value callback should be called")
        let mock = mockDataProvider(resourceName: "catalog_songs")
        try mock.catalog(.songs, ids: ["123", "456", "789"])
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { _ in
                completionExpectation.fulfill()
            }, receiveValue: { value in
                XCTAssertNotNil(value.data)
                valueExpectation.fulfill()
            }).store(in: &tasks)

        wait(for: [completionExpectation, valueExpectation], timeout: timeout)
    }

    func testCatalogSearch() throws {
        let completionExpectation = XCTestExpectation(description: "completion should be called")
        let valueExpectation = XCTestExpectation(description: "value callback should be called")
        let mock = mockDataProvider(resourceName: "catalog_search")
        try mock.catalogSearch(searchTerm: "")
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { _ in
                completionExpectation.fulfill()
            }, receiveValue: { value in
                XCTAssertNotNil(value.results?.playlists)
                XCTAssertNotNil(value.results?.albums)
                XCTAssertNotNil(value.results?.artists)
                XCTAssertNotNil(value.results?.songs)
                XCTAssertNotNil(value.results?.musicVideos)
                valueExpectation.fulfill()
            }).store(in: &tasks)

        wait(for: [completionExpectation, valueExpectation], timeout: timeout)
    }
    
    // MARK: Library Methods
    
    func testLibraryAlbums() throws {
        let completionExpectation = XCTestExpectation(description: "completion should be called")
        let valueExpectation = XCTestExpectation(description: "value callback should be called")
        let mock = mockDataProvider(resourceName: "library_albums")
        try mock.library(.albums)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { _ in
                completionExpectation.fulfill()
            }, receiveValue: { value in
                XCTAssertNotNil(value.data)
                valueExpectation.fulfill()
            }).store(in: &tasks)

        wait(for: [completionExpectation, valueExpectation], timeout: timeout)
    }
    
    func testLibraryArtists() throws {
        let completionExpectation = XCTestExpectation(description: "completion should be called")
        let valueExpectation = XCTestExpectation(description: "value callback should be called")
        let mock = mockDataProvider(resourceName: "library_artists")
        try mock.library(.artists)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { _ in
                completionExpectation.fulfill()
            }, receiveValue: { value in
                XCTAssertNotNil(value.data)
                valueExpectation.fulfill()
            }).store(in: &tasks)

        wait(for: [completionExpectation, valueExpectation], timeout: timeout)
    }
    
    func testLibraryPlaylists() throws {
        let completionExpectation = XCTestExpectation(description: "completion should be called")
        let valueExpectation = XCTestExpectation(description: "value callback should be called")
        let mock = mockDataProvider(resourceName: "library_playlists")
        try mock.library(.playlists)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { _ in
                completionExpectation.fulfill()
            }, receiveValue: { value in
                XCTAssertNotNil(value.data)
                valueExpectation.fulfill()
            }).store(in: &tasks)

        wait(for: [completionExpectation, valueExpectation], timeout: timeout)
    }
    
    func testLibraryMusicVideos() throws {
        let completionExpectation = XCTestExpectation(description: "completion should be called")
        let valueExpectation = XCTestExpectation(description: "value callback should be called")
        let mock = mockDataProvider(resourceName: "library_music-videos")
        try mock.library(.musicVideos)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { error in
                print(error)
                completionExpectation.fulfill()
            }, receiveValue: { value in
                XCTAssertNotNil(value.data)
                valueExpectation.fulfill()
            }).store(in: &tasks)

        wait(for: [completionExpectation, valueExpectation], timeout: timeout)
    }


    func testLibrarySongs() throws {
        let completionExpectation = XCTestExpectation(description: "completion should be called")
        let valueExpectation = XCTestExpectation(description: "value callback should be called")
        let mock = mockDataProvider(resourceName: "library_songs")
        try mock.library(.songs)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { _ in
                completionExpectation.fulfill()
            }, receiveValue: { value in
                XCTAssertNotNil(value.data)
                valueExpectation.fulfill()
            }).store(in: &tasks)

        wait(for: [completionExpectation, valueExpectation], timeout: timeout)
    }
    
    func testLibrarySearch() throws {
        let completionExpectation = XCTestExpectation(description: "completion should be called")
        let valueExpectation = XCTestExpectation(description: "value callback should be called")
        let mock = mockDataProvider(resourceName: "library_search")
        try mock.librarySearch(searchTerm: "")
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { _ in
                completionExpectation.fulfill()
            }, receiveValue: { value in
                XCTAssertNotNil(value.results?.playlists)
                XCTAssertNotNil(value.results?.albums)
                XCTAssertNotNil(value.results?.artists)
                XCTAssertNotNil(value.results?.songs)
                valueExpectation.fulfill()
            }).store(in: &tasks)

        wait(for: [completionExpectation, valueExpectation], timeout: timeout)
    }
    
    // MARK: - Helper Methods
    
    private func mockDataProvider(resourceName: String) -> AmuseKit.DataProvider {
        var service: MockAPIService = MockAPIService()
        service.resourceName = resourceName
        var mock: AmuseKit.DataProvider
        mock = .init(storage: MockStorageService(),
                        service: service)
        mock.setDeveloperToken("A1D2E3V4T5O6K7E8N9")
        return mock
    }

    static var allTests = [
        // Catalog
        ("testCatalogAlbums", testCatalogAlbums),
        ("testCatalogArtists", testCatalogArtists),
        ("testCatalogMusicVideos", testCatalogMusicVideos),
        ("testCatalogPlaylists", testCatalogPlaylists),
        ("testCatalogSongs", testCatalogSongs),
        ("testCatalogSearch", testCatalogSearch),
        // Library
        ("testLibraryAlbums", testLibraryAlbums),
        ("testLibraryArtists", testLibraryArtists),
        ("testLibraryMusicVideos", testLibraryMusicVideos),
        ("testLibraryPlaylists", testLibraryPlaylists),
        ("testLibrarySongs", testLibrarySongs),
        ("testLibrarySearch", testLibrarySearch)
    ]
}

