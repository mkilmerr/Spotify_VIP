//
//  SignupPasswordViewController.swift
//  SpotifyVIP
//
//  Created by Marcos Kilmer Pereira de Aquino on 10/08/21.
//

import UIKit
import Cartography

class SignupPasswordViewController: UIViewController {
    
    private var passwordTextField: CommonSignupTextField = {
        let textfield = CommonSignupTextField(title: CommonStrings.createPassword, footerTitle: CommonStrings.useAtLeast)
        return textfield
    }()
    
    private var nextButton: RoundedActionButton =  {
        let button = RoundedActionButton(title: CommonStrings.next, color: UIColor.white)
//        button.addTarget(self, action: #selector(nextDidTapped), for: .touchUpInside)
        return button
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        configureViews()
        setupConstraints()
    }
    
}
// MARK: -- Configure view
extension SignupPasswordViewController: CommonView {
    func setupViews() {
        view.addSubview(passwordTextField)
        view.addSubview(nextButton)
    }
    
    func configureViews() {
        setupNavigationTitle(title: CommonStrings.createAccount)
        view.backgroundColor = UIColor.mainBackground
    }
    
    func setupConstraints() {
        constrain(passwordTextField, nextButton) { email, button in
            guard let superView = email.superview else {
                return
            }
            
            email.height == 100
            email.leftMargin == superView.leftMargin + 10
            email.rightMargin == superView.rightMargin + 10
            email.safeAreaLayoutGuide.top == superView.safeAreaLayoutGuide.top + 20
            email.centerX == superView.centerX
            
            button.top == email.bottom + 50
            button.centerX == superView.centerX
        }
    }
}
