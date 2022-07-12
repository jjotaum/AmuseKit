//
//  Resource.swift
//  AmuseKit
//
//  Created by Jota Uribe on 15/06/20.
//

import Foundation

// A resource—such as an album, song, or playlist—in the Apple Music catalog or iCloud Music Library.
// https://developer.apple.com/documentation/applemusicapi/resource

protocol Resource: Codable {
    associatedtype Attributes
    associatedtype Relationships
    var attributes: Attributes? { get }
    var href: String? { get }
    var id: String { get }
    var relationships: Relationships? { get }
    var type: String { get }
}
