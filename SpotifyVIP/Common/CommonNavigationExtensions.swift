//
//  CommonNavigationExtensions.swift
//  SpotifyVIP
//
//  Created by Marcos Kilmer Pereira de Aquino on 09/08/21.
//

import UIKit

extension UIViewController {
    func setupNavigationTitle(title: String, color: UIColor? = .white) {
        navigationItem.backButtonTitle = ""
        let titleFont = UIFont(name: "Gotham-Bold", size: 18)
        let title = title
        let titleSize = title.size(withAttributes: [.font: titleFont ?? UIFont.systemFont(ofSize: 18)])
        
        let frame = CGRect(x: 0, y: 0, width: titleSize.width, height: 20.0)
        let titleLabel = UILabel(frame: frame)
        titleLabel.font = titleFont
        titleLabel.textColor = color
        titleLabel.textAlignment = .center
        titleLabel.text = title
        navigationItem.titleView = titleLabel
    }
}
