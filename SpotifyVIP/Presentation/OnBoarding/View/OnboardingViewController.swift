//
//  OnboardingViewController.swift
//  SpotifyVIP
//
//  Created by Marcos Kilmer Pereira de Aquino on 08/08/21.
//

import UIKit
import Cartography

class OnboardingViewController: UIViewController {
    
    private lazy var spotifyLogo: UIImageView = {
       let imageView = UIImageView()
        imageView.image = CommonAssets.spotifyWhiteLogo
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var mainTitle: UILabel = {
        let label = UILabel().bannerLabel
        label.text = CommonStrings.onboardingMainTitle
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textColor = UIColor.white
        return label
    }()
    
    private lazy var navigationTitle: UILabel = {
        let label = UILabel().navigationTitle
        label.text = CommonStrings.createAccount
        return label
    }()
    
    private lazy var signupButton: RoundedFillButton = {
        let button = RoundedFillButton(title: CommonStrings.signUpFree, color: UIColor.mainGreen)
        button.addTarget(self, action: #selector(self.signupDidTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var continueWithGoole: RoundedButton = {
        let button = RoundedButton(title: CommonStrings.continueWithGoogle, image: CommonAssets.googleLogo)
        return button
    }()
    
    private lazy var continueWithFacebook: RoundedButton = {
        let button = RoundedButton(title: CommonStrings.continueWithFacebook, image: CommonAssets.facebookLogo)
        return button
    }()
    
    private lazy var continueWithApple: RoundedButton = {
        let button = RoundedButton(title: CommonStrings.continueWithApple, image: CommonAssets.appleLogo)
        return button
    }()
    
    private lazy var loginButton: RoundedButton = {
        let button = RoundedButton(title: CommonStrings.logIn, hasBorder: false)
        return button
    }()
    
    private lazy var buttonsStackView: UIStackView = {
       let stackView = UIStackView()
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    
    public var router: OnBoardingRouterProtocol?
    
    init(configurator: OnBoardingConfigurator = OnBoardingConfigurator.shared ) {
        super.init(nibName: nil, bundle: nil)
        self.configure(configurator: configurator)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        configureViews()
        setupConstraints()
    }
}

// MARK: - Configurator
extension OnboardingViewController {
    private func configure(configurator: OnBoardingConfigurator = OnBoardingConfigurator.shared) {
        configurator.configure(self)
    }
}
// MARK: - Action functions
extension OnboardingViewController {
    @objc func signupDidTapped() {
        router?.navigateToSignupEmailScreen()
    }
}
// MARK: - Configure view
extension OnboardingViewController: CommonView {
    func setupViews() {
        view.addSubview(spotifyLogo)
        view.addSubview(mainTitle)
        view.addSubview(buttonsStackView)
    }
    
    func configureViews() {
        navigationItem.backButtonTitle = ""
        view.backgroundColor = UIColor.mainBackground
        let stackButtons = [signupButton, continueWithGoole, continueWithFacebook, continueWithApple, loginButton]
        stackButtons.forEach { (button) in
            buttonsStackView.addArrangedSubview(button)
        }
    }
    
    func setupConstraints() {
        constrain(spotifyLogo, mainTitle, signupButton, buttonsStackView) { logo, title, signupButton, stackView in
            guard let superView = logo.superview else {
                return
            }
            
            logo.centerY == superView.centerY - 60
            logo.centerX == superView.centerX
            logo.width == 80
            logo.height == 80
            
            title.top == logo.bottom + 10
            title.centerX == superView.centerX
            
            stackView.top == title.bottom + 40
            stackView.centerX == superView.centerX
            stackView.height == superView.height * 0.35
            stackView.leading == superView.leading + 30
           
        }
        
    }
}
