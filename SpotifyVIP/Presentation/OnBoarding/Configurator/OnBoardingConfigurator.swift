//
//  OnBoardingConfigurator.swift
//  SpotifyVIP
//
//  Created by Marcos Kilmer Pereira de Aquino on 09/08/21.
//

import Foundation

final class OnBoardingConfigurator {
    static let shared = OnBoardingConfigurator()
    
    public func configure(_ viewController: OnboardingViewController) {
        let router = OnBoardingRouter(viewController: viewController)
        viewController.router = router
    }
}
