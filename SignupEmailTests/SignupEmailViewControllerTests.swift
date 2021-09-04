//
//  SignupEmailViewControllerTests.swift
//  SignupEmailTests
//
//  Created by Marcos Kilmer Pereira de Aquino on 04/09/21.
//

import XCTest
@testable import SpotifyVIP

class SignupEmailViewControllerTests: XCTestCase {

    private let viewController = SignupEmailViewController()
    
    func testShouldInitViewControllerRouter() {
        XCTAssertNotNil(viewController.router)
    }
    
    func testShouldInitViewControllerOutput() {
        XCTAssertNotNil(viewController.output)
    }
    
    func testShouldInitInteractorOutput() {
        if let interactor = viewController.output as? SignupEmailInteractor {
            XCTAssertNotNil(interactor.output)
        } else {
            XCTFail()
        }
    }
    
    func testShouldInitPresenterOutput() {
        if let interactor = viewController.output as? SignupEmailInteractor, let presenter = interactor.output as? SignupEmailPresenter {
            XCTAssertNotNil(presenter.output)
        } else {
            XCTFail()
        }
    }
    
    func testShouldInitSignupEmailRouter() {
        guard let routerViewController = viewController.router?.viewController else { return }
        XCTAssertEqual(routerViewController, viewController)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
