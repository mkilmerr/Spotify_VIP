//
//  ChooseArtistWorker.swift
//  SpotifyVIP
//
//  Created by Marcos Kilmer Pereira de Aquino on 12/08/21.
//

import Foundation

class ChooseArtistWorker {
    var store: ChooseArtistsStoreProtocol?
    
    init(store: ChooseArtistsStoreProtocol = ChooseArtistsAPIStore() ) {
        self.store = store
    }
    
    func fetchArtists(completion: @escaping ([Artist]?, Error?) -> ()) {
        
        store?.fetchArtists(completion: completion)
    }
}
