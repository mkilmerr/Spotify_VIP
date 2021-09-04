//
//  SignupEmailInteractorTests.swift
//  SpotifyVIPTests
//
//  Created by Marcos Kilmer Pereira de Aquino on 04/09/21.
//

import XCTest
@testable import SpotifyVIP

class SignupEmailInteractorTests: XCTestCase {
    private let viewController = SignupEmailViewController()
    
    func testEnterInvalidEmail() {
        let spy = SignupEmailInputSpy()
        let invalidEmail = "invalid.email.com"
        spy.verificationEmail(email: invalidEmail)
        
        XCTAssertTrue(spy.outputSpy.presentInvalidEmail)
        XCTAssertFalse(spy.outputSpy.presentValidEmail)
    }
    
    func testEnterValidEmail() {
        let spy = SignupEmailInputSpy()
        let validEmail = "valid@email.com"
        spy.verificationEmail(email: validEmail)
        
        XCTAssertTrue(spy.outputSpy.presentValidEmail)
        XCTAssertFalse(spy.outputSpy.presentInvalidEmail)
    }
}

final class SignupEmailInputSpy: SignupEmailInteractorInput {
    let outputSpy = SignupEmailOutputSpy()
    
    func verificationEmail(email: String) {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        emailPred.evaluate(with: email) ? outputSpy.displayValidEmail() : outputSpy.displayInvalidEmail()
    }
}

final class SignupEmailOutputSpy: SignupEmailPresenterOutput {
    var presentInvalidEmail: Bool = false
    var presentValidEmail: Bool = false
    
    func displayValidEmail() {
        presentValidEmail = true
    }
    
    func displayInvalidEmail() {
        presentInvalidEmail = true
    }
}

