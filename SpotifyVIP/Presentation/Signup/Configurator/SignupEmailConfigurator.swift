//
//  SignupEmailConfigurator.swift
//  SpotifyVIP
//
//  Created by Marcos Kilmer Pereira de Aquino on 10/08/21.
//

import Foundation

final class SignupEmailConfigurator {
    static let shared = SignupEmailConfigurator()
    
    public func configure(_ viewController: SignupEmailViewController) {
        let router = SignupEmailRouter(viewController: viewController)
        viewController.router = router
    }
}
