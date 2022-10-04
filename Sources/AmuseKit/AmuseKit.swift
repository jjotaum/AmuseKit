//
//  AmuseKit.swift
//  AmuseKit
//
//  Created by Jota Uribe on 15/06/20.
//

import Foundation

protocol AmuseOption: RawRepresentable, Hashable, CaseIterable {}

public enum AmuseKit {
    enum AmuseError: Error {
        case missingDevToken
        case missingUserToken
    }
}

extension AmuseKit.AmuseError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .missingDevToken:
            return "Developer token is missing"
        case .missingUserToken:
            return "UserToken token is missing"
        }
    }
}
