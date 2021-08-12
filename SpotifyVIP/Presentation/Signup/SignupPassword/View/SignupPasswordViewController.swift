//
//  SignupPasswordViewController.swift
//  SpotifyVIP
//
//  Created by Marcos Kilmer Pereira de Aquino on 10/08/21.
//

import UIKit
import Cartography

protocol SignupPasswordViewControllerInput: SignupPasswordPresenterOutput {}

protocol SignupPasswordViewControllerOutput {
    func verifyPassword(password: String)
}

class SignupPasswordViewController: UIViewController {
    
    private var passwordTextField: CommonSignupTextField = {
        let textfield = CommonSignupTextField(title: CommonStrings.createPassword, footerTitle: CommonStrings.useAtLeast, type: .password)
        return textfield
    }()
    
    private var nextButton: RoundedActionButton =  {
        let button = RoundedActionButton(title: CommonStrings.next, color: UIColor.white)
        button.addTarget(self, action: #selector(nextDidTapped), for: .touchUpInside)
        return button
    }()
    
    public var router: SignupPasswordRouter?
    public var output: SignupPasswordViewControllerOutput?
    
    init(configurator: SignupPasswordConfigurator = SignupPasswordConfigurator.shared) {
        super.init(nibName: nil, bundle: nil)
        self.configure(configurator: configurator)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        configureViews()
        setupConstraints()
    }
    
}

// MARK: - Event functions
extension SignupPasswordViewController {
    @objc func nextDidTapped() {
        router?.navigateToBirthDayScreen()
    }
}
// MARK: - Configurator
extension SignupPasswordViewController {
    private func configure(configurator: SignupPasswordConfigurator = SignupPasswordConfigurator.shared) {
        configurator.configure(self)
    }
}
// MARK: - Textfield Delegates
extension SignupPasswordViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        output?.verifyPassword(password: textField.text ?? "")
        return true
    }
}
// MARK: Input Presenter
extension SignupPasswordViewController: SignupPasswordViewControllerInput {
    func presentValidPassword() {
        DispatchQueue.main.async {
            self.nextButton.isUserInteractionEnabled = true
            self.nextButton.alpha = 1.0
        }
    }
    
    func presentInvalidPassword() {
        DispatchQueue.main.async {
            self.nextButton.isUserInteractionEnabled = false
            self.nextButton.alpha = 0.3
        }
    }
}
// MARK: - Configure view
extension SignupPasswordViewController: CommonView {
    func setupViews() {
        view.addSubview(passwordTextField)
        view.addSubview(nextButton)
    }
    
    func configureViews() {
        passwordTextField.textField.delegate = self
        nextButton.isUserInteractionEnabled = false
        nextButton.alpha = 0.3
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
