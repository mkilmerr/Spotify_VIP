//
//  ChooseArtistInteractor.swift
//  SpotifyVIP
//
//  Created by Marcos Kilmer Pereira de Aquino on 12/08/21.
//

import Foundation

protocol ChooseArtistInteractorInput: ChooseArtistsViewControllerOutput {}

protocol ChooseArtistInteractorOutput {
    func presentArtists(artists: Array<Artist>)
    func presentError(error: Error)
}

class ChooseArtistInteractor {
    let output: ChooseArtistInteractorOutput?
    let worker: ChooseArtistWorker?
    
    var artists: Array<Artist>?
    
    init(output: ChooseArtistInteractorOutput?, worker: ChooseArtistWorker = ChooseArtistWorker()) {
        self.output = output
        self.worker = worker
    }
}

extension ChooseArtistInteractor: ChooseArtistInteractorInput {
    func fetchChooseArtists() {
        worker?.fetchArtists { [weak self]  artists, error in
            guard let self = self else { return }
            if let error = error {
                self.output?.presentError(error: error)
            } else if let artists = artists {
                self.artists = artists
                self.output?.presentArtists(artists: artists)
            }
        }
    }
}
