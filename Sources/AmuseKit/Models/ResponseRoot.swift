//
//  Response.swift
//  AmuseKit
//
//  Created by Jota Uribe on 15/06/20.
//

import Foundation

public extension AmuseKit {
    // The JSON root object contained in every response.
    // https://developer.apple.com/documentation/applemusicapi/responseroot
    
    struct ResponseRoot<D: Codable, R: Codable>: Codable {
        public let data: [D]?
        public let errors: [Error]?
        public let next: String?
        public let href: String?
        public let results: R?
    }
}

public extension AmuseKit.ResponseRoot {
    // Information about an error that occurred while processing a request.
    // https://developer.apple.com/documentation/applemusicapi/error

    struct Error: Codable {
        public let code: String
        public let detail: String?
        public let id: String
        public let source: Source?
        public let status: String
        public let title: String
    }
}

public extension AmuseKit.ResponseRoot.Error {
    // The Source object represents the source of an error.
    // https://developer.apple.com/documentation/applemusicapi/error/source

    struct Source: Codable {
        public let parameter: String?
    }
}
