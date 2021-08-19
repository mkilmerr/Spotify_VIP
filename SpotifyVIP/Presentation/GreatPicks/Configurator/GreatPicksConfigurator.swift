//
//  GreatPicksConfigurator.swift
//  SpotifyVIP
//
//  Created by Marcos Kilmer Pereira de Aquino on 18/08/21.
//

import Foundation

class GreatPicksConfigurator {
    static let shared = GreatPicksConfigurator()
   
    func configure(viewController: GreatPicksViewController) {
        let router = GreatPicksRouter(viewController: viewController)
        let presenter = GreatPicksPresenter(output: viewController)
        let interactor = GreatPicksInteractor(output: presenter)
        
        viewController.router = router
        viewController.output = interactor
    }
}
