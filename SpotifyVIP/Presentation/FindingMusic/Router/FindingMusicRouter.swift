//
//  FindingMusicRouter.swift
//  SpotifyVIP
//
//  Created by Marcos Kilmer Pereira de Aquino on 19/08/21.
//

import Foundation

protocol FindingMusicRouterProtocol {
    func navigateToTurnNotificationScreen()
}

class FindingMusicRouter {
    var viewController: FindindMusicViewController?
    
    init(viewController: FindindMusicViewController) {
        self.viewController = viewController
    }
}

extension FindingMusicRouter: FindingMusicRouterProtocol {
    func navigateToTurnNotificationScreen() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            self.viewController?.navigationController?.pushViewController(TurnOnNotificationsViewController(), animated: true)
        }
    }
}
