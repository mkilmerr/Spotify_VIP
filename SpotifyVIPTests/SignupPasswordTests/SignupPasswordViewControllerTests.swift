//
//  SignupPasswordViewControllerTests.swift
//  SpotifyVIPTests
//
//  Created by Marcos Kilmer Pereira de Aquino on 04/09/21.
//

import XCTest
@testable import SpotifyVIP

class SignupPasswordViewControllerTests: XCTestCase {
    let viewController = SignupPasswordViewController()
    
    func testShouldInitOutput() {
       XCTAssertNotNil(viewController.output)
    }
    
    func testShouldInitRouter() {
        XCTAssertNotNil(viewController.router)
    }
    
    func testShouldInitInteractorOutput() {
        if let interactor = viewController.output as? SignupPasswordInteractor {
            XCTAssertNotNil(interactor.output)
        } else {
            XCTFail()
        }
    }
    
    func testShouldInitPresenterOutput() {
        if let interactor = viewController.output as? SignupPasswordInteractor, let presenter = interactor.output as? SignupPasswordPresenter {
           XCTAssertNotNil(presenter.output)
        } else {
            XCTFail()
        }
    }
}
