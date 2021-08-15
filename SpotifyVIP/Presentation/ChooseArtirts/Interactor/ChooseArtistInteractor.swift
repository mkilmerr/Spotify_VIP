//
//  ChooseArtistInteractor.swift
//  SpotifyVIP
//
//  Created by Marcos Kilmer Pereira de Aquino on 12/08/21.
//

import Foundation

protocol ChooseArtistInteractorInput {}

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
