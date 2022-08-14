//
//  ListScreenViewController.swift
//  Movies
//
//  Created by samet ogutcuoglu on 11.08.2022.
//

import UIKit
import ImageSlideshow

protocol ListScreenDisplayLogic: AnyObject {
    func displayFetchedMovies(viewModel: ListScreen.Fetch.ViewModel)
    func displayFetchedNowPlayingMovies(viewModel: ListScreen.Fetch.ViewModel)
    func moviesToDetail(MovieId : Int)
    func alertError(Error: String)
}

final class ListScreenViewController: UIViewController {
    
    @IBOutlet weak var collectionView :UICollectionView!
    
    var interactor: ListScreenBusinessLogic?
    var router: (ListScreenRoutingLogic & ListScreenDataPassing)?
    
    var movies: [ListScreen.Fetch.ViewModel.Movie] = []
    var nowPlayingMovies: [ListScreen.Fetch.ViewModel.Nowplaying] = []
    
    // MARK: Object lifecycle
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchMovies()
        collectionView.register(UINib(nibName: ListDataCell.Id, bundle: nil), forCellWithReuseIdentifier: ListDataCell.Id)
        collectionView.register(UINib(nibName: ImageCell.Id, bundle: nil), forCellWithReuseIdentifier: ImageCell.Id)
        collectionView.setCollectionViewLayout(createLayout(), animated: true)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    private func fetchMovies()  {
        interactor?.getMovies()
        interactor?.getNowplayingMovies()
    }
    
    // MARK: Setup
    
    private func setup() {
        let viewController = self
        let interactor = ListScreenInteractor()
        let presenter = ListScreenPresenter()
        let router = ListScreenRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
}

extension ListScreenViewController: ListScreenDisplayLogic {
    func displayFetchedNowPlayingMovies(viewModel: ListScreen.Fetch.ViewModel) {
        guard let model = viewModel.displayedNowPlaying else { return }
        nowPlayingMovies = model
        
    }
    
    func moviesToDetail(MovieId: Int) {
        router?.routerToOfficeDetail(movieId: MovieId)
    }
    
    func displayFetchedMovies(viewModel: ListScreen.Fetch.ViewModel) {
        guard let model = viewModel.displayedMovies else { return }
        movies = model
        DispatchQueue.main.async { [weak self] in
            self?.collectionView.dataSource = self
            self?.collectionView.delegate = self
            self?.collectionView.reloadData()
        }
    }
    
    func alertError(Error: String) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: "Error", message: Error, preferredStyle: UIAlertController.Style.alert)
            let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler:nil)
            alert.addAction(okButton)
            self.present(alert, animated: true)
        }
    }
}

extension ListScreenViewController : UICollectionViewDelegate,UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return CollectionViewSections.allCases.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let section = CollectionViewSections(rawValue: section) else { return 0 }
        switch section {
        case .detailData:
            return movies.count
        case .image:
            return nowPlayingMovies.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let sectionCell = CollectionViewSections(rawValue: indexPath.section) else { return UICollectionViewCell() }
        let rowMoview = movies[indexPath.row]
        switch sectionCell {
        case .image:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCell", for: indexPath)
                    as? ImageCell else { return UICollectionViewCell() }
            cell.configure(viewModel: nowPlayingMovies[indexPath.row],pageNumber: nowPlayingMovies.count,selectPage: indexPath.row)
            return cell
        case .detailData:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ListDataCell", for: indexPath)
                    as? ListDataCell else { return UICollectionViewCell() }
            cell.configure(viewModel: rowMoview)
            return cell
        }
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)  {
        guard let selectCell = CollectionViewSections(rawValue: indexPath.section) else { return  }
        switch selectCell {
        case .image:
            moviesToDetail(MovieId: nowPlayingMovies[indexPath.row].id)
        case .detailData:
            moviesToDetail(MovieId: movies[indexPath.row].id)
        }
    }
}

extension ListScreenViewController {
    func makeVerticalLayout () -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize (widthDimension: .fractionalWidth(1),
                                               heightDimension: .fractionalWidth(0.4))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = .init(top: 5, leading: 5, bottom: 5, trailing: 5)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                               heightDimension: .fractionalWidth(0.4))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = .init(top: 5, leading: 5, bottom: 5, trailing: 5)
        return section
    }
    
    func makeHorizontalLayout() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                              heightDimension: .fractionalWidth(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        //item.contentInsets = .init(top: 2, leading: 2, bottom: 2, trailing: 2)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(1))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        let section = NSCollectionLayoutSection (group: group)
        //section.contentInsets = .init(top: 5, leading: 5, bottom: 5, trailing: 5)
        section.orthogonalScrollingBehavior = .paging
        return section
    }
    
    func createLayout () -> UICollectionViewLayout {
        UICollectionViewCompositionalLayout { sectionIndex, _ in
            if sectionIndex == 0 {
                return self.makeHorizontalLayout()
            }
            else {
               return self.makeVerticalLayout()
                
            }
        }
    }
}
