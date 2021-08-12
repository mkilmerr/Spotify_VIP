//
//  SignupDateBirthConfigurator.swift
//  SpotifyVIP
//
//  Created by Marcos Kilmer Pereira de Aquino on 12/08/21.
//

import Foundation

final class SignupDateBirthConfigurator {
    static let shared = SignupDateBirthConfigurator()
    
    public func configure(_ viewController: SignupDateBirthViewController) {
        let router = SignupDateBirthRouter(viewController: viewController)
        let presenter = SignupDateBirthPresenter(output: viewController)
        let interactor = SignupDateBirthInteractor(output: presenter)
        
        viewController.router = router
        viewController.output = interactor
    }
}
