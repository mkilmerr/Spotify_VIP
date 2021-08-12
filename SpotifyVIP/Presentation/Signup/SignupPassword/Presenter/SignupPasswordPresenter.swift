//
//  SignupPasswordPresenter.swift
//  SpotifyVIP
//
//  Created by Marcos Kilmer Pereira de Aquino on 12/08/21.
//

import Foundation

protocol SignupPasswordPresenterInput: SignupPasswordInteractorOutput {}

protocol SignupPasswordPresenterOutput {
    func presentValidPassword()
    func presentInvalidPassword()
}

class SignupPasswordPresenter {
    var output: SignupPasswordPresenterOutput?
    
    init(output: SignupPasswordPresenterOutput) {
        self.output = output
    }
}

extension SignupPasswordPresenter: SignupPasswordPresenterInput {
    func displayValidPassword() {
        output?.presentValidPassword()
    }
    
    func displayInvalidPassword() {
        output?.presentInvalidPassword()
    }
}
