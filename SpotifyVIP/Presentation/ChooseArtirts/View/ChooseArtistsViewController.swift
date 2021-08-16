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
    
    private lazy var chooseArtistsTitle: UILabel = {
       let label = UILabel()
        label.font = UIFont(name: "Gotham-Bold", size: 35)
        label.textColor = UIColor.white
        label.numberOfLines = 0
        label.text = CommonStrings.chooseThreeOrMoreArtists
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var artistsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
//        layout.minimumInteritemSpacing = 10
//        layout.minimumLineSpacing = 10
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
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
        DispatchQueue.main.async {
            self.artistsCollectionView.reloadData()
        }
        CommonAnimations.shared.stopAnimation(self)
    }
    
    func displayError(errorViewModel: ArtistViewModelError) {
        
    }
}
// MARK: - Collection view delegate & data source
extension ChooseArtistsViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return artistsViewModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ChooseArtistsCollectionViewCell.reuseIndentifier, for: indexPath) as?  ChooseArtistsCollectionViewCell {
//            let httpsUrl = self.artistsViewModel[indexPath.row].imageUrl.replacingOccurrences(of: "http", with: "https")
//            cell.circularArtistImage.load(url: httpsUrl)
            cell.viewModel = self.artistsViewModel[indexPath.item]
            return cell
        }
        
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
       {
        let screenBounds = UIScreen.main.bounds
        return CGSize(width: screenBounds.width/4 , height: 100)
       }
}
// MARK: - Configure view
extension ChooseArtistsViewController: CommonView {
    func setupViews() {
        view.addSubview(chooseArtistsTitle)
        view.addSubview(artistsCollectionView)
    }
    
    func configureViews() {
        artistsCollectionView.delegate = self
        artistsCollectionView.dataSource = self
        artistsCollectionView.register(ChooseArtistsCollectionViewCell.self, forCellWithReuseIdentifier: ChooseArtistsCollectionViewCell.reuseIndentifier)
        nextButton.isUserInteractionEnabled = false
        nextButton.alpha = 0.3
        setupNavigationTitle(title: CommonStrings.createAccount)
        view.backgroundColor = UIColor.mainBackground
    }
    
    func setupConstraints() {
        constrain(chooseArtistsTitle, artistsCollectionView) { title, collection in
            guard let superView = title.superview else {
                return
            }
            
            title.leftMargin == superView.leftMargin + 10
            title.rightMargin == superView.rightMargin + 10
            title.safeAreaLayoutGuide.top == superView.safeAreaLayoutGuide.top + 20
            title.centerX == superView.centerX
            
            collection.top == title.bottom + 20
            collection.leftMargin == superView.leftMargin
            collection.rightMargin == superView.rightMargin
            collection.height == superView.height

        }
    }
}
