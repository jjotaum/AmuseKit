//
//  MockStorageService.swift
//  AmuseKit
//
//  Created by Jota Uribe on 18/06/21.
//

import Foundation
@testable import AmuseKit

struct MockStorageService: StorageService {
    var developerToken: String?
    var userToken: String?
}
