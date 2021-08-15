//
//  Endpoints.swift
//  SpotifyVIP
//
//  Created by Marcos Kilmer Pereira de Aquino on 12/08/21.
//

import Foundation

struct BaseUrls {
    static let baseUrl = "https://6114feaeaec65d0017e9dc4f.mockapi.io/spotify/vip"
    static let chooseArtists = "\(baseUrl)/artists"
}

protocol GetUrl {
    func url() -> URL?
}

enum Endpoints {
    case getChooseArtists
}

extension Endpoints: GetUrl {
    func url() -> URL? {
        switch self {
        case .getChooseArtists:
            return URL(string: BaseUrls.chooseArtists)
        }
    }
}
