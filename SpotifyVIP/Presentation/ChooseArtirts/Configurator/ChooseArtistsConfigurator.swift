//
//  ChooseArtistsConfigurator.swift
//  SpotifyVIP
//
//  Created by Marcos Kilmer Pereira de Aquino on 15/08/21.
//

import Foundation

class ChooseArtistsConfigurator {
    static let shared = ChooseArtistsConfigurator()
    
    public func configure(viewController: ChooseArtistsViewController) {
        let router = ChooseArtistsRouter(viewController: viewController)
        let presenter = ChooseArtistsPresenter(output: viewController)
        let interactor = ChooseArtistInteractor(output: presenter)
        
        viewController.output = interactor
        viewController.router = router
    }
}
