//
//  ChooseArtistsViewController.swift
//  SpotifyVIP
//
//  Created by Marcos Kilmer Pereira de Aquino on 15/08/21.
//

import Foundation
import UIKit
import Cartography

class ChooseArtistsViewController: UIViewController {
    
    private var passwordTextField: CommonSignupTextField = {
        let textfield = CommonSignupTextField(title: CommonStrings.createPassword, footerTitle: CommonStrings.useAtLeast, type: .password)
        return textfield
    }()
    
    private var nextButton: RoundedActionButton =  {
        let button = RoundedActionButton(title: CommonStrings.next, color: UIColor.white)
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
extension ChooseArtistsViewController: CommonView {
    func setupViews() {
        view.addSubview(passwordTextField)
        view.addSubview(nextButton)
    }
    
    func configureViews() {
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
