//
//  SignupEmailViewController.swift
//  SpotifyVIP
//
//  Created by Marcos Kilmer Pereira de Aquino on 09/08/21.
//

import UIKit
import Cartography

protocol SignupEmailViewControllerInput: SignupEmailPresenterOutput {}

protocol SignupEmailViewControllerOutput {
    func verificationEmail(email: String)
}

class SignupEmailViewController: UIViewController {

    private var emailTextField: CommonSignupTextField = {
        let textfield = CommonSignupTextField(title: CommonStrings.whatsYourEmail, footerTitle: CommonStrings.youWillNeddConfirmEmailLater)
        return textfield
    }()
    
    private var nextButton: RoundedActionButton =  { 
        let button = RoundedActionButton(title: CommonStrings.next, color: UIColor.white)
        button.addTarget(self, action: #selector(nextDidTapped), for: .touchUpInside)
        return button
    }()
    
    public var router: SignupEmailRouter?
    public var output: SignupEmailViewControllerOutput?
    
    init(configurator: SignupEmailConfigurator = SignupEmailConfigurator.shared) {
        super.init(nibName: nil, bundle: nil)
        self.configure(configurator)
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
// MARK: - Textfield Delegates
extension SignupEmailViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        output?.verificationEmail(email: textField.text ?? "")
        return true
    }
}
// MARK: - InputPresenter
extension SignupEmailViewController: SignupEmailViewControllerInput {
    func displayValidEmail() {
        DispatchQueue.main.async {
            self.nextButton.alpha = 1.0
            self.nextButton.isUserInteractionEnabled = true
        }
    }
    
    func displayInvalidEmail() {
        DispatchQueue.main.async {
            self.nextButton.alpha = 0.3
            self.nextButton.isUserInteractionEnabled = false
        }
    }
}
// MARK: - Configurator
extension SignupEmailViewController {
    private func configure(_ configurator: SignupEmailConfigurator = SignupEmailConfigurator.shared) {
        configurator.configure(self)
    }
}
// MARK: - Action functions
extension SignupEmailViewController {
    @objc private func nextDidTapped() {
        router?.navigateToCreatePasswordScreen()
    }
}
// MARK: - Configure view
extension SignupEmailViewController: CommonView {
    func setupViews() {
        view.addSubview(emailTextField)
        view.addSubview(nextButton)
    }
    
    func configureViews() {
        emailTextField.textField.delegate = self
        nextButton.alpha = 0.3
        nextButton.isUserInteractionEnabled = false
        setupNavigationTitle(title: CommonStrings.createAccount)
        view.backgroundColor = UIColor.mainBackground
    }
    
    func setupConstraints() {
        constrain(emailTextField, nextButton) { email, button in
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
