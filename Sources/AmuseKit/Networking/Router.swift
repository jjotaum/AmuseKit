//
//  Router.swift
//  AmuseKit
//
//  Created by Jota Uribe on 9/08/20.
//

import Foundation

protocol URLConvertible {
    func asURL(_ queryItems: [URLQueryItem]) -> URL?
}

protocol URLRequestConvertible {
    func asURLRequest(_ queryItems: [URLQueryItem]) throws -> URLRequest
}

extension AmuseKit {
    enum Router {
        case catalog(countryCode: String, resourceType: CatalogResourceType)
        case library(LibraryResourceType)
        case recommendations
        case search(countryCode: String)
        case librarySearch
    }
}

extension AmuseKit.Router: URLConvertible, URLRequestConvertible {
    private var path: String {
        switch self {
        case .catalog(let countryCode, let type):
            return "/v1/catalog/\(countryCode)/\(type.lastPathComponent)"
        case .library(let type):
            return "/v1/me/\(type.lastPathComponent)"
        case .recommendations:
            return "/v1/me/recommendations"
        case .search(let countryCode):
            return "/v1/catalog/\(countryCode)/search"
        case .librarySearch:
            return "/v1/me/library/search"
        }
    }

    func asURL(_ queryItems: [URLQueryItem]) -> URL? {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.music.apple.com"
        components.path = path
        components.queryItems = queryItems
        return components.url
    }

    func asURLRequest(_ queryItems: [URLQueryItem]) throws -> URLRequest {
        guard let url = asURL(queryItems) else {
            throw URLError(.badURL)
        }
        return URLRequest(url: url)
    }
}

fileprivate extension CatalogResourceType {
    var lastPathComponent: String {
        switch self {
        case .musicVideos:
            return "music-videos"
        default:
            return rawValue
        }
    }
}

fileprivate extension LibraryResourceType {
    var lastPathComponent: String {
        switch self {
        case .musicVideos:
            return "library/music-videos"
        default:
            return rawValue.replacingOccurrences(of: "-", with: "/")
        }
    }
}
