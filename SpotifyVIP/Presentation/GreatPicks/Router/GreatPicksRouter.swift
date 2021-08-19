//
//  GreatPicksRouter.swift
//  SpotifyVIP
//
//  Created by Marcos Kilmer Pereira de Aquino on 18/08/21.
//

import UIKit

protocol GreatPicksRouterProtcol {
    func navigateToFindindMusicScreen()
}

class GreatPicksRouter {
    var viewController: UIViewController?
    
    init(viewController: UIViewController) {
        self.viewController = viewController
    }
}

extension GreatPicksRouter: GreatPicksRouterProtcol {
    func navigateToFindindMusicScreen() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.viewController?.navigationController?.pushViewController(OnboardingViewController(), animated: true)
        }
    }
}
