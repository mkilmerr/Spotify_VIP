//
//  SignupPasswordInteractor.swift
//  SpotifyVIP
//
//  Created by Marcos Kilmer Pereira de Aquino on 12/08/21.
//

import Foundation

protocol SignupPasswordInteractorInput: SignupPasswordViewControllerOutput {}

protocol SignupPasswordInteractorOutput {
    func displayValidPassword()
    func displayInvalidPassword()
}

class SignupPasswordInteractor {
    var output: SignupPasswordInteractorOutput?
    
    init(output: SignupPasswordInteractorOutput) {
        self.output = output
    }
}

extension SignupPasswordInteractor: SignupPasswordInteractorInput {
    func verifyPassword(password: String) {
        password.count >= 8 ? output?.displayValidPassword() : output?.displayInvalidPassword()
    }
}

