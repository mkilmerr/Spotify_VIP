//
//  ChooseArtistsViewController.swift
//  SpotifyVIP
//
//  Created by Marcos Kilmer Pereira de Aquino on 15/08/21.
//

import Foundation
import UIKit
import Cartography

protocol ChooseArtistsViewControllerInput: ChooseArtistsPresenterOutput {}

protocol ChooseArtistsViewControllerOutput {
    func fetchChooseArtists()
}

class ChooseArtistsViewController: UIViewController {
    
    private var passwordTextField: CommonSignupTextField = {
        let textfield = CommonSignupTextField(title: CommonStrings.createPassword, footerTitle: CommonStrings.useAtLeast, type: .password)
        return textfield
    }()
    
    private var nextButton: RoundedActionButton =  {
        let button = RoundedActionButton(title: CommonStrings.next, color: UIColor.white)
        return button
    }()
    
    private var artistsViewModel: Array<ArtistViewModel> = []
    public var router: ChooseArtistsRouter?
    public var output: ChooseArtistsViewControllerOutput?
    
    init(configurator: ChooseArtistsConfigurator = ChooseArtistsConfigurator.shared) {
        super.init(nibName: nil, bundle: nil)
        self.configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        configureViews()
        setupConstraints()
        fetchChooseArtists()
    }
    
}
// MARK: - Configurator
extension ChooseArtistsViewController {
    func configure(configurator: ChooseArtistsConfigurator = ChooseArtistsConfigurator.shared) {
        configurator.configure(viewController: self)
    }
}
//MARK: - Fetch artists
extension ChooseArtistsViewController: ChooseArtistsViewControllerOutput {
    func fetchChooseArtists() {
        CommonAnimations.shared.presentLoadingSearch(self)
        output?.fetchChooseArtists()
    }
}

// MARK: - Output presenter
extension ChooseArtistsViewController: ChooseArtistsViewControllerInput {
    func displayArtists(viewModels: Array<ArtistViewModel>) {
        artistsViewModel = viewModels
        CommonAnimations.shared.stopAnimation(self)
    }
    
    func displayError(errorViewModel: ArtistViewModelError) {
        
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
