//
//  TurnOnNotificationsViewController.swift
//  SpotifyVIP
//
//  Created by Marcos Kilmer Pereira de Aquino on 19/08/21.
//

import UIKit
import Cartography

class TurnOnNotificationsViewController: UIViewController {
    
    private lazy var turnOnNotificationsImage: UIImageView = {
       let imageView = UIImageView()
        imageView.image = CommonAssets.spotifyNotification
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var turnOnNotificationsTitle: UILabel = {
        let label = UILabel().bannerLabel
        label.font = UIFont(name: "Gotham-Bold", size: 20)
        label.text = CommonStrings.turnOnPushNotifications
        label.textColor = UIColor.white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var getUpdatesTitle: UILabel = {
        let label = UILabel().mainTitleLabel
        label.text = CommonStrings.getUpdates
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textColor = UIColor.white
        return label
    }()
    
    private var turnOnNotificationButton: RoundedActionButton =  {
        let button = RoundedActionButton(title: CommonStrings.turnOnNotifications, color: UIColor.white, fontSize: 13)
        return button
    }()
    
    private lazy var notNowButton: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.white
        label.text = CommonStrings.notNow
        label.font = UIFont(name: "Gotham-Bold", size: 13)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var footerTitle: UILabel = {
        let label = UILabel().bannerLabel
        label.font = UIFont(name: "Gotham-Bold", size: 13)
        label.text = CommonStrings.manageYourNotification
        label.textColor = UIColor.white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        configureViews()
        setupConstraints()
    }
    
}

extension TurnOnNotificationsViewController: CommonView {
    func setupViews() {
        view.addSubview(turnOnNotificationsImage)
        view.addSubview(turnOnNotificationsTitle)
        view.addSubview(getUpdatesTitle)
        view.addSubview(turnOnNotificationButton)
        view.addSubview(notNowButton)
        view.addSubview(footerTitle)
    }
    
    func configureViews() {
        self.navigationItem.setHidesBackButton(true, animated: true)
        self.view.backgroundColor = UIColor.mainBackground
    }
    
    func setupConstraints() {
        constrain(self.view, turnOnNotificationsImage, turnOnNotificationsTitle, getUpdatesTitle, turnOnNotificationButton, notNowButton, footerTitle) { view, image, mainTitle, secondTitle, turnOnButton, notNow, footer in
            
            image.centerX == view.centerX
            image.safeAreaLayoutGuide.top == view.safeAreaLayoutGuide.top + 20
            mainTitle.top == image.bottom + 40
            mainTitle.centerX == view.centerX
            
            secondTitle.leftMargin == view.leftMargin
            secondTitle.rightMargin == view.rightMargin
            
            turnOnButton.centerX == view.centerX
            notNow.centerX == view.centerX
            
            distribute(by: 15, vertically: mainTitle, secondTitle, turnOnButton, notNow)
            
            footer.top == notNow.bottom + 40
            footer.centerX == view.centerX
        }
        
    }
    
}
