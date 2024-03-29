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
    
    func test_developerTokenSavesOnStorage() {
        let developerToken = "A1U2S3E4R5T6O7K8E9N0"
        let mockStorage = MockStorageService()
        let sut: AmuseKit.DataProvider = .init(storage: mockStorage,
                                               requestCoordinator: MockRequestCoordinator())
        sut.setDeveloperToken(developerToken)
        XCTAssertEqual(mockStorage.developerToken, developerToken)
    }
    
    func test_userTokenSavesOnStorage() {
        let userToken = "A1U2S3E4R5T6O7K8E9N0"
        let mockStorage = MockStorageService()
        let sut: AmuseKit.DataProvider = .init(storage: mockStorage,
                                               requestCoordinator: MockRequestCoordinator())
        sut.setUserToken(userToken)
        XCTAssertEqual(mockStorage.userToken, userToken)
    }
    
    func test_request_withErrorResponse_returnsErrors() throws {
        let completionExpectation = XCTestExpectation(description: "completion should be called")
        let valueExpectation = XCTestExpectation(description: "value callback should be called")
        let sut: AmuseKit.DataProvider = .mock(resourceName: "invalid_authentication")
        try sut.library(.albums).sink { error in
            completionExpectation.fulfill()
        } receiveValue: { response in
            let error = response.errors?.first
            XCTAssertEqual(error?.id, "KHFHBMG2ZFDUYJQUMALKZAZ6LI")
            XCTAssertEqual(error?.code, "40300")
            XCTAssertEqual(error?.detail, "Invalid authentication")
            XCTAssertEqual(error?.status, "403")
            valueExpectation.fulfill()
        }.store(in: &tasks)
        wait(for: [valueExpectation, completionExpectation], timeout: timeout)
    }
    
    // MARK: - Catalog Methods
    
    func test_catalogRequest_withMissingDeveloperToken_throwsError() throws {
        let sut: AmuseKit.DataProvider = .init(storage: MockStorageService(),
                                               requestCoordinator: MockRequestCoordinator())
        XCTAssertThrowsError(try sut.catalog(.albums, ids: []))
    }
    
    func test_catalogAlbumsRequest_withValidResponse_returnsData() throws {
        let ids = ["123", "456", "789"]
        let sut: AmuseKit.DataProvider = .mock(resourceName: "catalog_albums")
        try test_catalogRequest_withValidResponse_returnsData(provider: sut,
                                                              resourceType: .albums,
                                                              ids: ids)
    }
    
    @available(iOS 15.0, *)
    @available(macOS 12.0, *)
    func test_async_catalogAlbumsRequest_withValidResponse_returnsData() async throws {
        let ids = ["123", "456", "789"]
        let sut: AmuseKit.DataProvider = .mock(resourceName: "catalog_albums")
        try await test_async_catalogRequest_withValidResponse_returnsData(provider: sut,
                                                                          resourceType: .albums,
                                                                          ids: ids)
    }
    
    func test_catalogArtistsRequest_withValidResponse_returnsData() throws {
        let ids = ["123", "456", "789"]
        let sut: AmuseKit.DataProvider = .mock(resourceName: "catalog_artists")
        try test_catalogRequest_withValidResponse_returnsData(provider: sut,
                                                              resourceType: .artists,
                                                              ids: ids)
    }
    
    @available(iOS 15.0, *)
    @available(macOS 12.0, *)
    func test_async_catalogArtistsRequest_withValidResponse_returnsData() async throws {
        let ids = ["123", "456", "789"]
        let sut: AmuseKit.DataProvider = .mock(resourceName: "catalog_artists")
        try await test_async_catalogRequest_withValidResponse_returnsData(provider: sut,
                                                                          resourceType: .artists,
                                                                          ids: ids)
    }
    
    func test_catalogMusicVideosRequest_withValidResponse_returnsData() throws {
        let ids = ["123", "456", "789"]
        let sut: AmuseKit.DataProvider = .mock(resourceName: "catalog_music-videos")
        try test_catalogRequest_withValidResponse_returnsData(provider: sut,
                                                              resourceType: .musicVideos,
                                                              ids: ids)
    }
    
    @available(iOS 15.0, *)
    @available(macOS 12.0, *)
    func test_async_catalogMusicVideosRequest_withValidResponse_returnsData() async throws {
        let ids = ["123", "456", "789"]
        let sut: AmuseKit.DataProvider = .mock(resourceName: "catalog_music-videos")
        try await test_async_catalogRequest_withValidResponse_returnsData(provider: sut,
                                                                          resourceType: .musicVideos,
                                                                          ids: ids)
    }
    
    func test_catalogPlaylistsRequest_withValidResponse_returnsData() throws {
        let ids = ["123", "456", "789"]
        let sut: AmuseKit.DataProvider = .mock(resourceName: "catalog_playlists")
        try test_catalogRequest_withValidResponse_returnsData(provider: sut,
                                                              resourceType: .playlists,
                                                              ids: ids)
    }
    
    @available(iOS 15.0, *)
    @available(macOS 12.0, *)
    func test_async_catalogPlaylistsRequest_withValidResponse_returnsData() async throws {
        let ids = ["123", "456", "789"]
        let sut: AmuseKit.DataProvider = .mock(resourceName: "catalog_playlists")
        try await test_async_catalogRequest_withValidResponse_returnsData(provider: sut,
                                                                          resourceType: .playlists,
                                                                          ids: ids)
    }
    
    func test_catalogSongsRequest_withValidResponse_returnsData() throws {
        let ids = ["123", "456", "789"]
        let sut: AmuseKit.DataProvider = .mock(resourceName: "catalog_songs")
        try test_catalogRequest_withValidResponse_returnsData(provider: sut,
                                                              resourceType: .songs,
                                                              ids: ids)
    }
    
    @available(iOS 15.0, *)
    @available(macOS 12.0, *)
    func test_async_catalogSongsRequest_withValidResponse_returnsData() async throws {
        let ids = ["123", "456", "789"]
        let sut: AmuseKit.DataProvider = .mock(resourceName: "catalog_songs")
        try await test_async_catalogRequest_withValidResponse_returnsData(provider: sut,
                                                                          resourceType: .songs,
                                                                          ids: ids)
    }
    
    @available(iOS 15.0, *)
    @available(macOS 12.0, *)
    func test_async_catalogSearchRequest_withValidResponse_returnsResults() async throws {
        let sut: AmuseKit.DataProvider = .mock(resourceName: "catalog_search")
        let response = try await sut.catalogSearch(searchTerm: "")
        XCTAssertNotNil(response.results?.playlists)
        XCTAssertNotNil(response.results?.albums)
        XCTAssertNotNil(response.results?.artists)
        XCTAssertNotNil(response.results?.songs)
        XCTAssertNotNil(response.results?.musicVideos)
    }
    
    func test_catalogSearchRequest_withValidResponse_returnsResults() throws {
        let completionExpectation = XCTestExpectation(description: "completion should be called")
        let valueExpectation = XCTestExpectation(description: "value callback should be called")
        let sut: AmuseKit.DataProvider = .mock(resourceName: "catalog_search")
        try sut.catalogSearch(searchTerm: "")
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
    
    func test_libraryRequest_withMissingDeveloperToken_throwsError() throws {
        let sut: AmuseKit.DataProvider = .init(storage: MockStorageService(),
                                               requestCoordinator: MockRequestCoordinator())
        XCTAssertThrowsError(try sut.library(.albums))
    }
    
    func test_libraryAlbumsRequest_withValidResponse_returnsData() throws {
        let sut: AmuseKit.DataProvider = .mock(resourceName: "library_albums")
        try test_libraryRequest_withValidResponse_returnsData(provider: sut,
                                                              resourceType: .albums)
    }
    
    @available(iOS 15.0, *)
    @available(macOS 12.0, *)
    func test_async_libraryAlbumsRequest_withValidResponse_returnsData() async throws {
        let sut: AmuseKit.DataProvider = .mock(resourceName: "library_albums")
        try await test_async_libraryRequest_withValidResponse_returnsData(provider: sut,
                                                                          resourceType: .albums)
    }
    
    func test_libraryArtistsRequest_withValidResponse_returnsData() throws {
        let sut: AmuseKit.DataProvider = .mock(resourceName: "library_artists")
        try test_libraryRequest_withValidResponse_returnsData(provider: sut,
                                                              resourceType: .artists)
    }
    
    @available(iOS 15.0, *)
    @available(macOS 12.0, *)
    func test_async_libraryArtistsRequest_withValidResponse_returnsData() async throws {
        let sut: AmuseKit.DataProvider = .mock(resourceName: "library_artists")
        try await test_async_libraryRequest_withValidResponse_returnsData(provider: sut,
                                                                          resourceType: .artists)
    }
    
    func test_libraryMusicVideosRequest_withValidResponse_returnsData() throws {
        let sut: AmuseKit.DataProvider = .mock(resourceName: "library_music-videos")
        try test_libraryRequest_withValidResponse_returnsData(provider: sut,
                                                              resourceType: .musicVideos)
    }
    
    @available(iOS 15.0, *)
    @available(macOS 12.0, *)
    func test_async_libraryMusicVideosRequest_withValidResponse_returnsData() async throws {
        let sut: AmuseKit.DataProvider = .mock(resourceName: "library_music-videos")
        try await test_async_libraryRequest_withValidResponse_returnsData(provider: sut,
                                                                          resourceType: .musicVideos)
    }
    
    func test_libraryPlaylistsRequest_withValidResponse_returnsData() throws {
        let sut: AmuseKit.DataProvider = .mock(resourceName: "library_playlists")
        try test_libraryRequest_withValidResponse_returnsData(provider: sut,
                                                              resourceType: .playlists)
    }
    
    @available(iOS 15.0, *)
    @available(macOS 12.0, *)
    func test_async_libraryPlaylistsRequest_withValidResponse_returnsData() async throws {
        let sut: AmuseKit.DataProvider = .mock(resourceName: "library_playlists")
        try await test_async_libraryRequest_withValidResponse_returnsData(provider: sut,
                                                                          resourceType: .playlists)
    }
    
    func test_librarySongsRequest_withValidResponse_returnsData() throws {
        let sut: AmuseKit.DataProvider = .mock(resourceName: "library_songs")
        try test_libraryRequest_withValidResponse_returnsData(provider: sut,
                                                              resourceType: .songs)
    }
    
    @available(iOS 15.0, *)
    @available(macOS 12.0, *)
    func test_async_librarySongsRequest_withValidResponse_returnsData() async throws {
        let sut: AmuseKit.DataProvider = .mock(resourceName: "library_songs")
        try await test_async_libraryRequest_withValidResponse_returnsData(provider: sut,
                                                                          resourceType: .songs)
    }
    
    @available(iOS 15.0, *)
    @available(macOS 12.0, *)
    func test_async_librarySearchRequest_withValidResponse_returnsResults() async throws {
        let sut: AmuseKit.DataProvider = .mock(resourceName: "library_search")
        let response = try await sut.librarySearch(searchTerm: "")
        XCTAssertNotNil(response.results?.playlists)
        XCTAssertNotNil(response.results?.albums)
        XCTAssertNotNil(response.results?.artists)
        XCTAssertNotNil(response.results?.songs)
    }
    
    func test_LibrarySearchRequest_withValidResponse_returnsResults() throws {
        let completionExpectation = XCTestExpectation(description: "completion should be called")
        let valueExpectation = XCTestExpectation(description: "value callback should be called")
        let sut: AmuseKit.DataProvider = .mock(resourceName: "library_search")
        try sut.librarySearch(searchTerm: "")
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
    
    static var allTests = [
        ("test_developerTokenSavesOnStorage", test_developerTokenSavesOnStorage),
        ("test_userTokenSavesOnStorage", test_userTokenSavesOnStorage),
        ("test_request_withErrorResponse_returnsErrors", test_request_withErrorResponse_returnsErrors),
        // Catalog
        ("test_catalogRequest_withMissingDeveloperToken_throwsError", test_catalogRequest_withMissingDeveloperToken_throwsError),
        ("test_catalogAlbumsRequest_withValidResponse_returnsData", test_catalogAlbumsRequest_withValidResponse_returnsData),
        ("test_catalogArtistsRequest_withValidResponse_returnsData", test_catalogArtistsRequest_withValidResponse_returnsData),
        ("test_catalogMusicVideosRequest_withValidResponse_returnsData", test_catalogMusicVideosRequest_withValidResponse_returnsData),
        ("test_catalogPlaylistsRequest_withValidResponse_returnsData", test_catalogPlaylistsRequest_withValidResponse_returnsData),
        ("test_catalogSongsRequest_withValidResponse_returnsData", test_catalogSongsRequest_withValidResponse_returnsData),
        ("test_async_catalogSearchRequest_withValidResponse_returnsResults", test_async_catalogSearchRequest_withValidResponse_returnsResults),
        ("test_catalogSearchRequest_withValidResponse_returnsResults", test_catalogSearchRequest_withValidResponse_returnsResults),
        // Library
        ("test_libraryRequest_withMissingDeveloperToken_throwsError", test_libraryRequest_withMissingDeveloperToken_throwsError),
        ("test_libraryAlbumsRequest_withValidResponse_returnsData", test_libraryAlbumsRequest_withValidResponse_returnsData),
        ("test_libraryArtistsRequest_withValidResponse_returnsData", test_libraryArtistsRequest_withValidResponse_returnsData),
        ("test_libraryMusicVideosRequest_withValidResponse_returnsData", test_libraryMusicVideosRequest_withValidResponse_returnsData),
        ("test_libraryPlaylistsRequest_withValidResponse_returnsData", test_libraryPlaylistsRequest_withValidResponse_returnsData),
        ("test_librarySongsRequest_withValidResponse_returnsData", test_librarySongsRequest_withValidResponse_returnsData),
        ("test_async_librarySearchRequest_withValidResponse_returnsResults", test_async_librarySearchRequest_withValidResponse_returnsResults),
        ("test_LibrarySearchRequest_withValidResponse_returnsResults", test_LibrarySearchRequest_withValidResponse_returnsResults)
    ]
}

// MARK: - Helper Methods

extension CatalogResourceType {
    var mock: String? {
        switch self {
        case .albums, .artists, .playlists, .songs:
            return "catalog_\(self.rawValue)"
        case .musicVideos:
            return "catalog_music_videos"
        default:
            return nil
        }
    }
}

extension DataProviderTests {
    
    @available(iOS 15.0, *)
    @available(macOS 12.0, *)
    private func test_async_catalogRequest_withValidResponse_returnsData<Resource: Codable>(
        provider: AmuseKit.DataProvider,
        resourceType: CatalogResourceConvertible<Resource>,
        ids: [String]
    ) async throws {
        let result = try await provider.catalog(resourceType, ids: ids)
        XCTAssertNotNil(result.data)
    }
    
    private func test_catalogRequest_withValidResponse_returnsData<Resource: Codable>(
        provider: AmuseKit.DataProvider,
        resourceType: CatalogResourceConvertible<Resource>,
        ids: [String]
    ) throws {
        let completionExpectation = XCTestExpectation(description: "completion should be called")
        let valueExpectation = XCTestExpectation(description: "value callback should be called")
        try provider.catalog(resourceType, ids: ids)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { _ in
                completionExpectation.fulfill()
            }, receiveValue: { value in
                XCTAssertNotNil(value.data)
                valueExpectation.fulfill()
            }).store(in: &tasks)
        
        wait(for: [completionExpectation, valueExpectation], timeout: timeout)
    }
    
    @available(iOS 15.0, *)
    @available(macOS 12.0, *)
    private func test_async_libraryRequest_withValidResponse_returnsData<Resource: Codable>(
        provider: AmuseKit.DataProvider,
        resourceType: LibraryResourceConvertible<Resource>
    ) async throws {
        let result = try await provider.library(resourceType)
        XCTAssertNotNil(result.data)
    }
    
    private func test_libraryRequest_withValidResponse_returnsData<Resource: Codable>(
        provider: AmuseKit.DataProvider,
        resourceType: LibraryResourceConvertible<Resource>
    ) throws {
        let completionExpectation = XCTestExpectation(description: "completion should be called")
        let valueExpectation = XCTestExpectation(description: "value callback should be called")
        try provider.library(resourceType)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { _ in
                completionExpectation.fulfill()
            }, receiveValue: { value in
                XCTAssertNotNil(value.data)
                valueExpectation.fulfill()
            }).store(in: &tasks)
        
        wait(for: [completionExpectation, valueExpectation], timeout: timeout)
    }
}
