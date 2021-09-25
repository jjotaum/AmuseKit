//
//  EditorialNotes.swift
//  AmuseKit
//
//  Created by Jota Uribe on 15/06/20.
//

import Foundation

public extension AmuseKit {
    // An object that represents notes.
    // https://developer.apple.com/documentation/applemusicapi/editorialnotes

    struct EditorialNotes: Codable {
        public var short: String?
        public var standard: String?
    }
}
