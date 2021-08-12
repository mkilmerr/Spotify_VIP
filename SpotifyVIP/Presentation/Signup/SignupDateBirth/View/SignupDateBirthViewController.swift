//
//  SignupDateBirthViewController.swift
//  SpotifyVIP
//
//  Created by Marcos Kilmer Pereira de Aquino on 12/08/21.
//

import UIKit
import Cartography

protocol SignupDateBirthViewControllerInput: SignupDateBirthPresenterOutput {}

protocol SignupDateBirthViewControllerOutput {
    func verifyDateBirth(date: String)
}

class SignupDateBirthViewController: UIViewController {
    
    private var dateBirthTextField: CommonSignupTextField = {
        let textfield = CommonSignupTextField(title: CommonStrings.whatsYourDateBirth, footerTitle: "", type: .date)
        return textfield
    }()
    
    private var nextButton: RoundedActionButton =  {
        let button = RoundedActionButton(title: CommonStrings.next, color: UIColor.white)
        button.addTarget(self, action: #selector(nextDidTapped), for: .touchUpInside)
        return button
    }()
    
    public var router: SignupDateBirthRouter?
    public var output: SignupDateBirthViewControllerOutput?
    
    init(configurator: SignupDateBirthConfigurator = SignupDateBirthConfigurator.shared) {
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
// MARK: - Action functions
extension SignupDateBirthViewController {
    @objc private func nextDidTapped() {
        router?.navigateToGenderView()
    }
}
// MARK: - TextField delegate
extension SignupDateBirthViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        output?.verifyDateBirth(date: textField.text ?? "")
    }
}
// MARK: - Configurator
extension SignupDateBirthViewController {
    private func configure(configurator: SignupDateBirthConfigurator = SignupDateBirthConfigurator.shared) {
        configurator.configure(self)
    }
}
// MARK: - Input presenter
extension SignupDateBirthViewController: SignupDateBirthViewControllerInput {
    func presentValidEmail() {
        DispatchQueue.main.async {
            self.nextButton.alpha = 1.0
            self.nextButton.isUserInteractionEnabled = true
        }
    }
    
    func presentInvalidEmail() {
        DispatchQueue.main.async {
            self.nextButton.alpha = 0.3
            self.nextButton.isUserInteractionEnabled = false
        }
    }
}
// MARK: - Configure view
extension SignupDateBirthViewController: CommonView {
    func setupViews() {
        view.addSubview(dateBirthTextField)
        view.addSubview(nextButton)
    }
    
    func configureViews() {
        dateBirthTextField.textField.delegate = self
        nextButton.alpha = 0.3
        nextButton.isUserInteractionEnabled = false
        setupNavigationTitle(title: CommonStrings.createAccount)
        view.backgroundColor = UIColor.mainBackground
    }
    
    func setupConstraints() {
        constrain(dateBirthTextField, nextButton) { date, button in
            guard let superView = date.superview else {
                return
            }
            
            date.height == 100
            date.leftMargin == superView.leftMargin + 10
            date.rightMargin == superView.rightMargin + 10
            date.safeAreaLayoutGuide.top == superView.safeAreaLayoutGuide.top + 20
            date.centerX == superView.centerX
            
            button.top == date.bottom + 100
            button.centerX == superView.centerX
        }
        
    }
    
}
