//
//  SignupPasswordConfigurator.swift
//  SpotifyVIP
//
//  Created by Marcos Kilmer Pereira de Aquino on 12/08/21.
//

import Foundation

class SignupPasswordConfigurator {
    static  let shared = SignupPasswordConfigurator()
    
    public func configure(_ viewController: SignupPasswordViewController) {
        let router = SignupPasswordRouter(viewController: viewController)
        let presenter = SignupPasswordPresenter(output: viewController)
        let interactor = SignupPasswordInteractor(output: presenter)
        
        viewController.output = interactor
        viewController.router = router
        
    }
}
