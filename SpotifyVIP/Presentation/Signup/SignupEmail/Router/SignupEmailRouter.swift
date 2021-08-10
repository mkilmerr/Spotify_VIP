//
//  SignupEmailRouter.swift
//  SpotifyVIP
//
//  Created by Marcos Kilmer Pereira de Aquino on 10/08/21.
//

import Foundation

protocol SignupEmailRouterProtocol {
    func navigateToCreatePasswordScreen()
}

class SignupEmailRouter {
    let viewController: SignupEmailViewController?
    
    init(viewController: SignupEmailViewController ) {
        self.viewController = viewController
    }
}

extension SignupEmailRouter: SignupEmailRouterProtocol {
    func navigateToCreatePasswordScreen() {
        viewController?.navigationController?.pushViewController(SignupPasswordViewController(), animated: true)
    }
}
