//
//  SignupDateBirthRouter.swift
//  SpotifyVIP
//
//  Created by Marcos Kilmer Pereira de Aquino on 12/08/21.
//

import Foundation

protocol SignupDateBirthRouterProtocol {
    func navigateToGenderView()
}

class SignupDateBirthRouter {
    var viewController: SignupDateBirthViewController?
    
    init(viewController: SignupDateBirthViewController) {
        self.viewController = viewController
    }
}

extension SignupDateBirthRouter: SignupDateBirthRouterProtocol {
    func navigateToGenderView() {
        viewController?.navigationController?.pushViewController(OnboardingViewController(), animated: true)
    }
}
