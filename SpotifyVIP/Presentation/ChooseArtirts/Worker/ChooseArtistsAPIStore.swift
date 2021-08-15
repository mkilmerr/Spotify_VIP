//
//  ChooseArtistsAPIStore.swift
//  SpotifyVIP
//
//  Created by Marcos Kilmer Pereira de Aquino on 12/08/21.
//

import Foundation

class ChooseArtistsAPIStore {
    private var networkClient: NetworkClient?
    
    init(networkClient: NetworkClient = NetworkClient.shared) {
        self.networkClient = networkClient
    }
}

extension ChooseArtistsAPIStore: ChooseArtistsStoreProtocol {
    func fetchArtists(completion: @escaping ([Artist]?, Error?) -> ()) {
        guard let url = Endpoints.getChooseArtists.url() else  {
            return completion(nil, NetworkClientTypeError.invalidUrl)
        }
        
        let request = URLRequest.jsonRequest(url: url)
        
        networkClient?.sendRequest(request: request, completion: { (data, response, error) in
            if error != nil {
                completion(nil, NetworkClientTypeError.generic)
                return
            }
            
            if let json = data?.jsonToDictionaryArray() {
                completion(Artist.fromJSON(json: json), nil)
            } else {
                completion(nil, NetworkClientTypeError.invalidResponse)
            }
        })
    }
}
