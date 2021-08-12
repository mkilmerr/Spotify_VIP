//
//  SignupDateBirthPresenter.swift
//  SpotifyVIP
//
//  Created by Marcos Kilmer Pereira de Aquino on 12/08/21.
//

import Foundation

protocol SignupDateBirthPresenterInput: SignupDateBirthInteractorOutput {}

protocol SignupDateBirthPresenterOutput {
    func presentValidEmail()
    func presentInvalidEmail()
}

class SignupDateBirthPresenter {
    var output: SignupDateBirthPresenterOutput?
    
    init(output: SignupDateBirthPresenterOutput) {
        self.output = output
    }
}

extension SignupDateBirthPresenter: SignupDateBirthPresenterInput {
    func displayValidDate() {
        output?.presentValidEmail()
    }
    
    func displayInvalidDate() {
        output?.presentInvalidEmail()
    }
}
