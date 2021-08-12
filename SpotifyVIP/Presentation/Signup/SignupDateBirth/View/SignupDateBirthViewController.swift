//
//  SignupDateBirthViewController.swift
//  SpotifyVIP
//
//  Created by Marcos Kilmer Pereira de Aquino on 12/08/21.
//

import UIKit
import Cartography

class SignupDateBirthViewController: UIViewController {
    
    private var dateBirthTextField: CommonSignupTextField = {
        let textfield = CommonSignupTextField(title: CommonStrings.whatsYourDateBirth, footerTitle: CommonStrings.useAtLeast, type: .date)
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

// MARK: - Configure view
extension SignupDateBirthViewController: CommonView {
    func setupViews() {
        view.addSubview(dateBirthTextField)
        view.addSubview(nextButton)
    }
    
    func configureViews() {
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
            
            button.top == date.bottom + 50
            button.centerX == superView.centerX
        }
        
    }
    
}
