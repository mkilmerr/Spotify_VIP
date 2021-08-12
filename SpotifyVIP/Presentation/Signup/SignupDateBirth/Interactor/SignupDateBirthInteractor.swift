//
//  SignupDateBirthInteractor.swift
//  SpotifyVIP
//
//  Created by Marcos Kilmer Pereira de Aquino on 12/08/21.
//

import Foundation

protocol SignupDateBirthInteractorInput: SignupDateBirthViewControllerOutput {}

protocol SignupDateBirthInteractorOutput {
    func displayValidDate()
    func displayInvalidDate()
}

class SignupDateBirthInteractor {
    var output: SignupDateBirthInteractorOutput?
    
    init(output: SignupDateBirthInteractorOutput) {
        self.output = output
    }
}

extension SignupDateBirthInteractor: SignupDateBirthInteractorInput {
    func verifyDateBirth(date: String) {
        date.isEmpty ? output?.displayInvalidDate() : output?.displayValidDate()
    }
}
