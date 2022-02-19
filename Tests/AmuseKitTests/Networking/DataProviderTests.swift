//
//  DataProviderTests.swift
//  AmuseKit
//
//  Created by Jota Uribe on 18/06/21.
//

import Combine
import XCTest
@testable import AmuseKit

final class DataProviderTests: XCTestCase {

    let mock: AmuseKit.DataProvider = .init(storage: MockStorageService(),
                                            service: MockAPIService())
    var tasks: Set<AnyCancellable> = []

    override func setUp() {
        mock.setDeveloperToken("A1D2E3V4T5O6K7E8N9")
    }
    
    override func tearDown() {
        tasks = []
    }

    func testCatalogSearch() throws {
        let completionExpectation = XCTestExpectation(description: "completion should be called")
        let valueExpectation = XCTestExpectation(description: "value callback should be called")
        try mock.catalogSearch(searchTerm: "")
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { _ in
                completionExpectation.fulfill()
            }, receiveValue: { value in
                XCTAssertNotNil(value.results?.albums)
                XCTAssertNotNil(value.results?.artists)
                XCTAssertNotNil(value.results?.playlists)
                valueExpectation.fulfill()
            }).store(in: &tasks)

        wait(for: [completionExpectation, valueExpectation], timeout: 2.0)
    }

    func testLibrarySearch() throws {
        let completionExpectation = XCTestExpectation(description: "completion should be called")
        let valueExpectation = XCTestExpectation(description: "value callback should be called")
        try mock.librarySearch(searchTerm: "")
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { _ in
                completionExpectation.fulfill()
            }, receiveValue: { value in
                XCTAssertNotNil(value.results?.albums)
                XCTAssertNotNil(value.results?.artists)
                valueExpectation.fulfill()
            }).store(in: &tasks)

        wait(for: [completionExpectation, valueExpectation], timeout: 2.0)
    }

    func testLibraryPlaylists() throws {
        let completionExpectation = XCTestExpectation(description: "completion should be called")
        let valueExpectation = XCTestExpectation(description: "value callback should be called")
        try mock.libraryPlaylists()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { _ in
                completionExpectation.fulfill()
            }, receiveValue: { value in
                XCTAssertNotNil(value.data)
                valueExpectation.fulfill()
            }).store(in: &tasks)

        wait(for: [completionExpectation, valueExpectation], timeout: 2.0)
    }
    
    func testLibraryAlbums() throws {
        let completionExpectation = XCTestExpectation(description: "completion should be called")
        let valueExpectation = XCTestExpectation(description: "value callback should be called")
        try mock.libraryAlbums()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { _ in
                completionExpectation.fulfill()
            }, receiveValue: { value in
                XCTAssertNotNil(value.data)
                valueExpectation.fulfill()
            }).store(in: &tasks)

        wait(for: [completionExpectation, valueExpectation], timeout: 2.0)
    }
    
    func testLibraryArtists() throws {
        let completionExpectation = XCTestExpectation(description: "completion should be called")
        let valueExpectation = XCTestExpectation(description: "value callback should be called")
        try mock.libraryArtists()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { _ in
                completionExpectation.fulfill()
            }, receiveValue: { value in
                XCTAssertNotNil(value.data)
                valueExpectation.fulfill()
            }).store(in: &tasks)

        wait(for: [completionExpectation, valueExpectation], timeout: 2.0)
    }

    func testLibraryTracks() throws {
        let completionExpectation = XCTestExpectation(description: "completion should be called")
        let valueExpectation = XCTestExpectation(description: "value callback should be called")
        try mock.librarySongs()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { _ in
                completionExpectation.fulfill()
            }, receiveValue: { value in
                XCTAssertNotNil(value.data)
                valueExpectation.fulfill()
            }).store(in: &tasks)

        wait(for: [completionExpectation, valueExpectation], timeout: 2.0)
    }

    static var allTests = [
        ("testCatalogSearch", testCatalogSearch),
        ("testLibrarySearch", testLibrarySearch),
        ("testLibraryAlbums", testLibraryAlbums),
        ("testLibraryArtists", testLibraryArtists),
        ("testLibraryPlaylists", testLibraryPlaylists),
        ("testLibraryTracks", testLibraryTracks)
    ]
}

