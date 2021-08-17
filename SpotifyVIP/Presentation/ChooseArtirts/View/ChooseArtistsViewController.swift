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
    
    private var amount: Int = 0
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
    
    private var doneButton: RoundedActionButton =  {
        let button = RoundedActionButton(title: CommonStrings.done, color: UIColor.white)
        button.addTarget(self, action: #selector(doneDidTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var searchBar: SearchBarArtists = {
       let searchBar = SearchBarArtists()
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        return searchBar
    }()
    
    private lazy var artistsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 50
        layout.sectionInset = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.allowsMultipleSelection = true 
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
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

// MARK: UI Rules
extension ChooseArtistsViewController {
    func enableDoneButton(_ amount: Int) {
        DispatchQueue.main.async {
            if amount >= 3 {
                self.doneButton.alpha = 1.0
                self.doneButton.isUserInteractionEnabled = true
            } else {
                self.doneButton.alpha = 0.3
                self.doneButton.isUserInteractionEnabled = false
            }
        }
        
    }
    
    @objc private func doneDidTapped() {
        router?.navigateToGreatPicksScreen()
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
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        amount += 1
        enableDoneButton(amount)
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        amount -= 1
        enableDoneButton(amount)
    }
    
}
// MARK: - Configure view
extension ChooseArtistsViewController: CommonView {
    func setupViews() {
        view.addSubview(chooseArtistsTitle)
        view.addSubview(searchBar)
        view.addSubview(doneButton)
        view.addSubview(artistsCollectionView)
    }
    
    func configureViews() {
        artistsCollectionView.delegate = self
        artistsCollectionView.dataSource = self
        artistsCollectionView.register(ChooseArtistsCollectionViewCell.self, forCellWithReuseIdentifier: ChooseArtistsCollectionViewCell.reuseIndentifier)
        doneButton.isUserInteractionEnabled = false
        doneButton.alpha = 0.3
        setupNavigationTitle(title: CommonStrings.createAccount)
        view.backgroundColor = UIColor.mainBackground
    }
    
    func setupConstraints() {
        constrain(chooseArtistsTitle, artistsCollectionView, searchBar, doneButton) { title, collection, search, button in
            guard let superView = title.superview else {
                return
            }
            
            title.leftMargin == superView.leftMargin + 10
            title.rightMargin == superView.rightMargin + 10
            title.safeAreaLayoutGuide.top == superView.safeAreaLayoutGuide.top + 20
            title.centerX == superView.centerX
            
            
            search.height == 30
            search.leftMargin == superView.leftMargin + 10
            search.rightMargin == superView.rightMargin + 10
            search.top == title.bottom + 30
            search.centerX == superView.centerX
            
            button.centerX == superView.centerX
            button.top == search.bottom + 60
            
            collection.top == button.bottom + 50
            collection.leftMargin == superView.leftMargin
            collection.rightMargin == superView.rightMargin
            collection.height == superView.height

        }
    }
}
