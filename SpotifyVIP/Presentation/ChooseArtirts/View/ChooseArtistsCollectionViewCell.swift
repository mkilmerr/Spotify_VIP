//
//  ChooseArtistsCollectionViewCell.swift
//  SpotifyVIP
//
//  Created by Marcos Kilmer Pereira de Aquino on 15/08/21.
//

import UIKit
import Cartography
import SDWebImage
import WebKit

class ChooseArtistsCollectionViewCell: UICollectionViewCell {
    static var reuseIndentifier: String {
        return String(describing: self)
    }
    
   
    private lazy var checkView: UIView = {
       let view = UIView()
        view.backgroundColor = UIColor.white
        view.layer.cornerRadius = 15
        view.clipsToBounds = true
        view.layer.borderColor = UIColor.white.cgColor
        view.layer.borderWidth = 5.0
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override var isSelected: Bool {
        didSet {
            if self.isSelected {
                addCheck()
            }
            else {
                removeCheck()
            }
        }
    }
    
    private func addCheck() {
        let checkIcon = UIImageView()
        checkIcon.image = CommonAssets.check
        addSubview(checkView)
        checkView.addSubview(checkIcon)
        constrain(self,checkView, checkIcon) { content, view, icon in
            view.width == 30
            view.height == 30
            view.trailingMargin == content.trailingMargin
            view.top == content.top + 2
            
            icon.centerX == view.centerX
            icon.centerY == view.centerY
        }
    }
    
    private func removeCheck() {
        checkView.removeFromSuperview()
    }
    
    public lazy var circularArtistImage: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = self.frame.width / 2
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    public lazy var artistName: UILabel = {
       let  label = UILabel()
        label.font = UIFont(name: "Gotham-Bold", size: 20)
        label.textColor = UIColor.white
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    
    var viewModel: ArtistViewModel? {
        didSet {
            if let artist = viewModel {
                let httpsUrl = artist.imageUrl.replacingOccurrences(of: "http", with: "https")
                artistName.text = artist.name
                circularArtistImage.load(url: httpsUrl)
            }
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        artistName.text = ""
        self.viewModel = nil 
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        backgroundColor = UIColor.mainBackground
        translatesAutoresizingMaskIntoConstraints = false
        circularArtistImage.translatesAutoresizingMaskIntoConstraints = false
        addSubview(circularArtistImage)
        addSubview(artistName)
    }
    
    func setupConstraints() {
        constrain(self, circularArtistImage, artistName) { view,image, name in
            image.leftMargin == view.leftMargin
            image.rightMargin == view.rightMargin
            image.centerX == view.centerX
            image.centerY == view.centerY
            view.centerY == view.centerY
            image.width == view.width
            image.height == view.height
            
            name.top == image.bottom + 1
            name.centerX == image.centerX
        }
    }

}
