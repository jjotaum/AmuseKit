//
//  Resource.swift
//  AmuseKit
//
//  Created by Jota Uribe on 15/06/20.
//

import Foundation

// A resource—such as an album, song, or playlist—in the Apple Music catalog or iCloud Music Library.
// https://developer.apple.com/documentation/applemusicapi/resource

protocol Resource: Codable, Identifiable {
    associatedtype Attributes
    associatedtype Relationships
    var attributes: Attributes? { get }
    var href: String? { get }
    var id: String { get }
    var relationships: Relationships? { get }
    var type: String { get }
}

// An object that represents artwork.
// https://developer.apple.com/documentation/applemusicapi/artwork

public struct ResourceArtwork: Codable {
    public let bgColor: String?
    public let height: Int?
    public let width: Int?
    public let textColor1: String?
    public let textColor2: String?
    public let textColor3: String?
    public let textColor4: String?
    public let url: String
}

public extension ResourceArtwork {
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

// An object that represents notes.
// https://developer.apple.com/documentation/applemusicapi/editorialnotes

public struct ResourceEditorialNotes: Codable {
    public var short: String?
    public var standard: String?
}

// An object that represents play parameters for resources.
// https://developer.apple.com/documentation/applemusicapi/playparameters

public struct ResourcePlayParameters: Codable {
    public let id: String
    public let kind: String
    public let catalogId: String?
    public let isLibrary: Bool?
    public let reporting: Bool?
}

// An object that represents a preview for resources.
// https://developer.apple.com/documentation/applemusicapi/preview

public struct ResourcePreview: Codable {
    public let artwork: ResourceArtwork?
    public let url: String
}
