//
//  Artwork.swift
//  AmuseKit
//
//  Created by Jota Uribe on 15/06/20.
//

import Foundation

public extension AmuseKit {
    // An object that represents artwork.
    // https://developer.apple.com/documentation/applemusicapi/artwork

    struct Artwork: Codable {
        public let bgColor: String?
        public let height: Int
        public let width: Int
        public let textColor1: String?
        public let textColor2: String?
        public let textColor3: String?
        public let textColor4: String?
        public let url: String
    }

    struct LibraryArtwork: Codable {
        public let height: Int
        public let width: Int
        public let url: String
    }
}
