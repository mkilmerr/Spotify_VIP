//
//  SignupPasswordInteractorTests.swift
//  SpotifyVIPTests
//
//  Created by Marcos Kilmer Pereira de Aquino on 04/09/21.
//

import XCTest
@testable import SpotifyVIP

class SignupPasswordInteractorTests: XCTestCase {
    let viewController = SignupPasswordViewController()
    
    func testShouldEnterInvalidPassword() {
        let invalidPassword = "123456"
        let spy = SignupPasswordInputSpy()
        spy.verifyPassword(password: invalidPassword)
        
        XCTAssertTrue(spy.outputSpy.invalidPassword)
        XCTAssertFalse(spy.outputSpy.validPassword)
    }
    
    func testShouldEnterValidEmail() {
        let validPassword = "12345678"
        let spy = SignupPasswordInputSpy()
        spy.verifyPassword(password: validPassword)
        
        XCTAssertTrue(spy.outputSpy.validPassword)
        XCTAssertFalse(spy.outputSpy.invalidPassword)
    }
}

final class SignupPasswordInputSpy: SignupPasswordInteractorInput {
    let outputSpy = SignupPasswordOutputSpy()
    
    func verifyPassword(password: String) {
        password.count >= 8 ? outputSpy.displayValidPassword(): outputSpy.displayInvalidPassword()
    }
}

final class SignupPasswordOutputSpy: SignupPasswordInteractorOutput {
    var validPassword: Bool = false
    var invalidPassword: Bool = false
    
    func displayValidPassword() {
        validPassword = true
    }
    
    func displayInvalidPassword() {
        invalidPassword = true
    }
}
