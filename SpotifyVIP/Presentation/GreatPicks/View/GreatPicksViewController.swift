//
//  GreatPicksViewController.swift
//  SpotifyVIP
//
//  Created by Marcos Kilmer Pereira de Aquino on 17/08/21.
//
import UIKit
import Cartography

protocol GreatPicksViewControllerInput: GreatPicksPresenterOutput {}

protocol GreatPicksViewControllerOutput {
    func getGreatPicks()
}

class GreatPicksViewController: UIViewController {
    
    private lazy var artistsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 0
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.allowsMultipleSelection = true
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    private lazy var greatPicksTitle: UILabel = {
        let label = UILabel().bannerLabel
        label.text = CommonStrings.greatPicks
        label.textColor = UIColor.white
        return label 
    }()
    
    private var artistsViewModel: Array<GreatPicksViewModel> = []
    public var router: GreatPicksRouter?
    public var output: GreatPicksViewControllerOutput?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        configureViews()
        setupConstraints()
        getGreatPicks()
        router?.navigateToFindindMusicScreen()
    }
    
    init(configurator: GreatPicksConfigurator = GreatPicksConfigurator.shared) {
        super.init(nibName: nil, bundle: nil)
        self.configure(configurator: configurator)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: - Configurator
extension GreatPicksViewController {
    private func configure(configurator: GreatPicksConfigurator = GreatPicksConfigurator.shared) {
        configurator.configure(viewController: self)
    }
}
// MARK: - GreatPicksViewControllerOutput
extension GreatPicksViewController: GreatPicksViewControllerOutput {
    func getGreatPicks() {
        output?.getGreatPicks()
    }
}
// MARK: - GreatPicksViewControllerInput
extension GreatPicksViewController: GreatPicksViewControllerInput {
    func displayPicks(picks: Array<GreatPicksViewModel>) {
        artistsViewModel.append(contentsOf: picks)
        DispatchQueue.main.async {
            self.artistsCollectionView.reloadData()
        }
    }
}

// MARK: - Collection view delegate & data source
extension GreatPicksViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return artistsViewModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GreatPicksCollectionViewCell.reuseIndentifier, for: indexPath) as?  GreatPicksCollectionViewCell {
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
extension GreatPicksViewController: CommonView {
    func setupViews() {
        view.addSubview(artistsCollectionView)
        view.addSubview(greatPicksTitle)
    }
    
    func configureViews() {
        self.navigationItem.setHidesBackButton(true, animated: true)
        artistsCollectionView.delegate = self
        artistsCollectionView.dataSource = self
        artistsCollectionView.register(GreatPicksCollectionViewCell.self, forCellWithReuseIdentifier: GreatPicksCollectionViewCell.reuseIndentifier)
        view.backgroundColor = UIColor.mainBackground
    }
    
    func setupConstraints() {
        constrain(self.view, artistsCollectionView, greatPicksTitle) { view, collection, title in
    
            collection.centerY == view.centerY
            collection.centerX == view.centerX
            collection.leftMargin == view.leftMargin
            collection.rightMargin == view.rightMargin
            collection.height == view.height * 0.3
            collection.width == view.width
            
            title.centerX == view.centerX
            title.top == collection.bottom + 10
        }
    }
}
