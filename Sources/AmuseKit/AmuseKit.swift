//
//  AmuseKit.swift
//  AmuseKit
//
//  Created by Jota Uribe on 15/06/20.
//

import Foundation

public enum AmuseKit {}

enum AmuseKitError: Error {
    case missingDevToken
    case missingUserToken
}

extension AmuseKitError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .missingDevToken:
            return "Developer token is missing"
        case .missingUserToken:
            return "UserToken token is missing"
        }
    }
}

