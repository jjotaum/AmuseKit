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
        public let height: Int?
        public let width: Int?
        public let textColor1: String?
        public let textColor2: String?
        public let textColor3: String?
        public let textColor4: String?
        public let url: String
    }
}

public extension AmuseKit.Artwork {
    typealias ArtworkSize = (width: Int, height: Int)
    /// Returns artwork formatted url for specific size when possible.
    /// if `size` parameter is nil `width` & `height` properties will be used as default values for size.
    /// if `width` and `height` property are also nil full size image URL will be returned.
    func formattedURL(size: ArtworkSize? = nil) -> URL? {
        guard let width = size?.width ?? width, let height = size?.height ?? height else {
            return URL(string: url)
        }
        
        return URL(string: url.replacingOccurrences(of: "{w}x{h}", with: "\(width)x\(height)"))
    }
}
