//
//  ChooseArtistsStoreProtocol.swift
//  SpotifyVIP
//
//  Created by Marcos Kilmer Pereira de Aquino on 12/08/21.
//

import Foundation

enum ChooseArtistsStoreProtocolError: Error {
    case generic
    case invalidUrl
    case invalidResponse
}

protocol ChooseArtistsStoreProtocol {
    func fetchArtists(completion: @escaping ([Artist]?, Error?) -> ())
}
