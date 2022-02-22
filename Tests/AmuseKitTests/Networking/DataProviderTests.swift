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

    func testLibraryPlaylists() throws {
        let completionExpectation = XCTestExpectation(description: "completion should be called")
        let valueExpectation = XCTestExpectation(description: "value callback should be called")
        let mock = mockDataProvider(resourceName: "library_playlists")
        try mock.libraryPlaylists()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { _ in
                completionExpectation.fulfill()
            }, receiveValue: { value in
                XCTAssertNotNil(value.data)
                valueExpectation.fulfill()
            }).store(in: &tasks)

        wait(for: [completionExpectation, valueExpectation], timeout: timeout)
    }
    
    func testLibraryAlbums() throws {
        let completionExpectation = XCTestExpectation(description: "completion should be called")
        let valueExpectation = XCTestExpectation(description: "value callback should be called")
        let mock = mockDataProvider(resourceName: "library_albums")
        try mock.libraryAlbums()
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
        try mock.libraryArtists()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { _ in
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
        try mock.librarySongs()
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
        try mock.libraryMusicVideos()
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
        ("testCatalogSearch", testCatalogSearch),
        ("testLibrarySearch", testLibrarySearch),
        ("testLibraryPlaylists", testLibraryPlaylists),
        ("testLibraryAlbums", testLibraryAlbums),
        ("testLibraryArtists", testLibraryArtists),
        ("testLibrarySongs", testLibrarySongs),
        ("testLibraryMusicVideos", testLibraryMusicVideos)
    ]
}

