//
//  FindindMusicViewController.swift
//  SpotifyVIP
//
//  Created by Marcos Kilmer Pereira de Aquino on 19/08/21.
//

import UIKit
import Cartography

class FindindMusicViewController: UIViewController {
    
    private lazy var findingMusicLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Gotham-Bold", size: 20)
        label.text = CommonStrings.findingMusicForYou
        label.textColor = UIColor.white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label 
    }()
    
    public var router: FindingMusicRouter?
    init(configurator: FindingMusicConfigurator = FindingMusicConfigurator.shared) {
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
        CommonAnimations.shared.presentAnimation(self, type: .searchMusic)
        router?.navigateToTurnNotificationScreen()
    }
}
// MARK: - Configurator
extension FindindMusicViewController {
    private func configure(configurator: FindingMusicConfigurator = FindingMusicConfigurator.shared) {
        configurator.configure(self)
    }
}
// MARK: - Common view methods
extension FindindMusicViewController: CommonView {
    func setupViews() {
        view.addSubview(findingMusicLabel)
    }
    
    func configureViews() {
        self.navigationItem.setHidesBackButton(true, animated: true)
        self.view.backgroundColor = UIColor.mainBackground
    }
    
    func setupConstraints() {
        constrain(self.view, findingMusicLabel) { view, title in
            title.safeAreaLayoutGuide.bottom == view.safeAreaLayoutGuide.bottom - 40
            title.centerX == view.centerX
        }
    }
}
