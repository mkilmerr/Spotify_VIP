//
//  ChooseArtistsCollectionViewCell.swift
//  SpotifyVIP
//
//  Created by Marcos Kilmer Pereira de Aquino on 15/08/21.
//

import UIKit
import Cartography
import SDWebImage

class ChooseArtistsCollectionViewCell: UICollectionViewCell {
    static var reuseIndentifier: String {
        return String(describing: self)
    }
    
    public lazy var circularArtistImage: UIImageView = {
       let imageView = UIImageView()
        imageView.layer.cornerRadius = self.frame.width / 2
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    var viewModel: ArtistViewModel? {
        didSet {
            if let artist = viewModel {
                let httpsUrl = artist.imageUrl.replacingOccurrences(of: "http", with: "https")
                circularArtistImage.load(url: httpsUrl)
            }
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        circularArtistImage.image = nil
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
        addSubview(circularArtistImage)
    }
    
    func setupConstraints() {
        constrain(self, circularArtistImage) { view,image in
            image.leftMargin == view.leftMargin
            image.rightMargin == view.rightMargin
            image.centerX == view.centerX
            view.centerY == view.centerY
            image.width == view.width
            image.height == view.height
        }
    }
}
