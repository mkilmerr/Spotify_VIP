//
//  SignupEmailInteractor.swift
//  SpotifyVIP
//
//  Created by Marcos Kilmer Pereira de Aquino on 10/08/21.
//

import Foundation

protocol SignupEmailInteractorInput: SignupEmailViewControllerOutput {}

protocol SignupEmailInteractorOutput {
    func presentValidEmail()
    func presentInvalidEmail()
}

final class SignupEmailInteractor {
    var output: SignupEmailInteractorOutput?
    var isValidEmail: Bool?
    
    init(output: SignupEmailInteractorOutput) {
        self.output = output
    }
}

extension SignupEmailInteractor: SignupEmailInteractorInput {
    func verificationEmail(email: String) {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        emailPred.evaluate(with: email) ? output?.presentValidEmail() : output?.presentInvalidEmail()
    }
}
