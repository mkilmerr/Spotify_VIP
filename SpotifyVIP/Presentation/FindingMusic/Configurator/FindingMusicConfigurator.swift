//
//  FindingMusicConfigurator.swift
//  SpotifyVIP
//
//  Created by Marcos Kilmer Pereira de Aquino on 19/08/21.
//

import Foundation

class FindingMusicConfigurator {
    static let shared = FindingMusicConfigurator()
    
    func configure(_ viewController: FindindMusicViewController) {
        let router = FindingMusicRouter(viewController: viewController)
        viewController.router = router
    }
}
