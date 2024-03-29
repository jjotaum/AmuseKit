//
//  MockDataProvider.swift
//  AmuseKit
//
//  Created by Jota Uribe on 16/09/22.
//

@testable import AmuseKit


extension AmuseKit.DataProvider {
    static func mock(resourceName: String) -> AmuseKit.DataProvider {
        var requestCoordinator: MockRequestCoordinator = MockRequestCoordinator()
        requestCoordinator.resourceName = resourceName
        var mock: AmuseKit.DataProvider
        mock = .init(storage: MockStorageService(),
                     requestCoordinator: requestCoordinator)
        mock.setDeveloperToken("A1D2E3V4T5O6K7E8N9")
        return mock
    }
}
