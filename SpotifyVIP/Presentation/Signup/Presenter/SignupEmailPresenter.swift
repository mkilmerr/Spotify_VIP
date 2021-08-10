//
//  SignupEmailPresenter.swift
//  SpotifyVIP
//
//  Created by Marcos Kilmer Pereira de Aquino on 10/08/21.
//

import Foundation

protocol SignupEmailPresenterInput {
    
}
protocol SignupEmailPresenterOutput: class {
    func displayValidEmail()
    func displayInvalidEmail()
}

final class SignupEmailPresenter {
    weak var output: SignupEmailPresenterOutput?
    
    init(output: SignupEmailPresenterOutput) {
        self.output = output
    }
}
