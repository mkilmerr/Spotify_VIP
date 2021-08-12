//
//  SignupPasswordRouter.swift
//  SpotifyVIP
//
//  Created by Marcos Kilmer Pereira de Aquino on 12/08/21.
//

import Foundation

protocol SignupPasswordRouterProtocol {
    func navigateToBirthDayScreen()
}

class SignupPasswordRouter {
    var viewController: SignupPasswordViewController?
    
    init(viewController: SignupPasswordViewController) {
        self.viewController = viewController
    }
}

extension SignupPasswordRouter: SignupPasswordRouterProtocol {
    func navigateToBirthDayScreen() {
        viewController?.navigationController?.pushViewController(OnboardingViewController(), animated: true)
    }
}
