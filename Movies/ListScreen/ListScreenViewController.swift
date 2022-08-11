//
//  ListScreenViewController.swift
//  Movies
//
//  Created by samet ogutcuoglu on 11.08.2022.
//

import UIKit

protocol ListScreenDisplayLogic: AnyObject {
    func displayFetchedOffices(viewModel: ListScreen.Fetch.ViewModel)
}

final class ListScreenViewController: UIViewController {
    
    @IBOutlet weak var collectionView : UICollectionView!
    
    var interactor: ListScreenBusinessLogic?
    var router: (ListScreenRoutingLogic & ListScreenDataPassing)?
    
    var Movies: [ListScreen.Fetch.ViewModel.Movie] = []
    
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
        collectionView.register(UINib(nibName: "ListDataCell", bundle: nil), forCellWithReuseIdentifier: "ListDataCell")
    }
    
    private func fetchMovies() {
        interactor?.getMovies()
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
    func displayFetchedOffices(viewModel: ListScreen.Fetch.ViewModel) {
        Movies = viewModel.displayedMovies
    }
}

extension ListScreenViewController : UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ListDataCell", for: indexPath)
                as? ListDataCell else { return UICollectionViewCell() }
        cell.configure(viewModel: Movies[indexPath.row])
        return cell
    }
    
    
}
