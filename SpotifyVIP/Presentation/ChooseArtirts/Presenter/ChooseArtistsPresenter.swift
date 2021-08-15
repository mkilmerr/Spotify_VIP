//
//  ChooseArtistsPresenter.swift
//  SpotifyVIP
//
//  Created by Marcos Kilmer Pereira de Aquino on 15/08/21.
//

import Foundation

protocol ChooseArtistsPresenterInput: ChooseArtistInteractorOutput {}

protocol ChooseArtistsPresenterOutput {
    func displayArtists(viewModels: Array<ArtistViewModel>)
    func displayError(errorViewModel: ArtistViewModelError)
}

class ChooseArtistsPresenter {
    var output: ChooseArtistsPresenterOutput?
    
    init(output: ChooseArtistsPresenterOutput) {
        self.output = output
    }
}

extension ChooseArtistsPresenter: ChooseArtistsPresenterInput {
    func presentArtists(artists: Array<Artist>) {
        let artistsViewmodel =  artists.compactMap { artists -> ArtistViewModel? in
            return ArtistViewModel(id: artists.artirstId, name: artists.artirstName, imageUrl: artists.artirstImageUrl)
        }
        
        output?.displayArtists(viewModels: artistsViewmodel)
    }
    
    func presentError(error: Error) {
        let errorViewModel = ArtistViewModelError(title: CommonStrings.errorToFindArtists, message: CommonStrings.tryAgainLater)
        output?.displayError(errorViewModel: errorViewModel)
    }
}
