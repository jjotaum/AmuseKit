//
//  StorageService.swift
//  AmuseKit
//
//  Created by Jota Uribe on 17/06/21.
//

import Foundation
import class KeychainAccess.Keychain

protocol StorageService {
    var developerToken: String? { get set }
    var userToken: String? { get set }
}

public extension AmuseKit {
    struct StorageConfiguration {
        let serviceName: String
        let developerTokenKey: String
        let userTokenKey: String
        
        public init(serviceName: String,
                    developerTokenKey: String,
                    userTokenKey: String) {
            self.serviceName = serviceName
            self.developerTokenKey = developerTokenKey
            self.userTokenKey = userTokenKey
        }
    }
}

extension AmuseKit {
    struct KeyChainService: StorageService {
        private let configuration: StorageConfiguration
        private let keychain: Keychain

        init(_ configuration: StorageConfiguration) {
            self.configuration = configuration
            self.keychain = .init(service: configuration.serviceName)
        }
        
        var developerToken: String? {
            get {
                try? keychain.getString(configuration.developerTokenKey)
            }
            set {
                try? keychain.set(newValue ?? "", key: configuration.developerTokenKey)
            }
        }
        
        var userToken: String? {
            get {
                return try? keychain.getString(configuration.userTokenKey)
            }
            set {
                try? keychain.set(newValue ?? "", key: configuration.userTokenKey)
            }
        }
    }
}
