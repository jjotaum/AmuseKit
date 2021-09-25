//
//  AmuseKit.swift
//  AmuseKit
//
//  Created by Jota Uribe on 15/06/20.
//

import Foundation

protocol AmuseOption: RawRepresentable, Hashable, CaseIterable {}

public class AmuseKit {
    enum AmuseError: Error {
        case invalidRequest
        case missingDevToken
        case missingUserToken
    }
}

extension AmuseKit.AmuseError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .invalidRequest:
            return NSLocalizedString("", comment: "")
        default:
            return nil
        }
    }
}
