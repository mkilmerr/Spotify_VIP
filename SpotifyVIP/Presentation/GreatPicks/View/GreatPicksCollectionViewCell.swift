//
//  GreatPicksCollectionViewCell.swift
//  SpotifyVIP
//
//  Created by Marcos Kilmer Pereira de Aquino on 18/08/21.
//

import UIKit
import Cartography

class GreatPicksCollectionViewCell: UICollectionViewCell {
    static var reuseIndentifier: String {
        return String(describing: self)
    }
    
    var viewModel: GreatPicksViewModel? {
        didSet {
            circularArtistImage.image = viewModel?.image
        }
    }
    
    public lazy var circularArtistImage: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = self.frame.width / 2
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    var greatPicksImage: UIImage? {
        didSet {
            circularArtistImage.image = greatPicksImage
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        viewModel = nil
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
    }
    
    func setupConstraints() {
        constrain(self, circularArtistImage) { view, image in
            image.leftMargin == view.leftMargin
            image.rightMargin == view.rightMargin
            image.centerX == view.centerX
            image.centerY == view.centerY
            view.centerY == view.centerY
            image.width == view.width
            image.height == view.height
            
        }
    }
    
}
