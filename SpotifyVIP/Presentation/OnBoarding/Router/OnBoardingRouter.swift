//
//  OnBoardingRouter.swift
//  SpotifyVIP
//
//  Created by Marcos Kilmer Pereira de Aquino on 09/08/21.
//

import Foundation

protocol OnBoardingRouterProtocol {
    var viewController: OnboardingViewController? {get}
    
    func navigateToSignupEmailScreen()
}


final class OnBoardingRouter {
    var viewController: OnboardingViewController?
    
    init(viewController: OnboardingViewController) {
        self.viewController = viewController
    }
}

extension OnBoardingRouter: OnBoardingRouterProtocol {
    func navigateToSignupEmailScreen() {
        viewController?.navigationController?.pushViewController(SignupEmailViewController(), animated: true)
    }
}
