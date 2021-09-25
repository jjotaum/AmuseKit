//
//  Preview.swift
//  AmuseKit
//
//  Created by Jota Uribe on 24/06/20.
//

import Foundation

public extension AmuseKit {
    // An object that represents a preview for resources.
    // https://developer.apple.com/documentation/applemusicapi/preview

    struct Preview: Codable {
        var artwork: AmuseKit.Artwork?
        var url: String
    }
}
