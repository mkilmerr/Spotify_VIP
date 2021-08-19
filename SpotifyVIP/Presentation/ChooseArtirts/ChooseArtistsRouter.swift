//
//  ChooseArtistsRouter.swift
//  SpotifyVIP
//
//  Created by Marcos Kilmer Pereira de Aquino on 15/08/21.
//

import Foundation

protocol ChooseArtistsRouterProtocol {
    func navigateToGreatPicksScreen()
}
class ChooseArtistsRouter {
    var viewController: ChooseArtistsViewController?
    
    init(viewController: ChooseArtistsViewController) {
        self.viewController = viewController
    }
}

extension ChooseArtistsRouter: ChooseArtistsRouterProtocol {
    public func navigateToGreatPicksScreen() {
        viewController?.navigationController?.pushViewController(GreatPicksViewController(), animated: true)
    }
}
