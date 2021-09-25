//
//  PlayParameters.swift
//  AmuseKit
//
//  Created by Jota Uribe on 15/06/20.
//

import Foundation

public extension AmuseKit {
    // An object that represents play parameters for resources.
    // https://developer.apple.com/documentation/applemusicapi/playparameters

    struct PlayParameters: Codable {
        public let id: String
        public let kind: String
        public let catalogId: String?
        public let isLibrary: Bool?
        public let reporting: Bool?
    }
}
