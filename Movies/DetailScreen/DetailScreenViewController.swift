//
//  DetailScreenViewController.swift
//  Movies
//
//  Created by samet ogutcuoglu on 11.08.2022.
//

import UIKit

protocol DetailScreenDisplayLogic: AnyObject {
    func displayToDetailMovie(viewModel: DetailScreen.Fetch.ViewModel.MovieDetail)
}

final class DetailScreenViewController: UIViewController {
    
    @IBOutlet weak var movieInfo: UILabel!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var detailMovieImage: UIImageView!
    
    var interactor: DetailScreenBusinessLogic?
    var router: (DetailScreenRoutingLogic & DetailScreenDataPassing)?
    
    var detailMovie: DetailScreen.Fetch.ViewModel.MovieDetail?
    
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
        interactor?.getMovie()
    }
    
    // MARK: Setup
    
    private func setup() {
        let viewController = self
        let interactor = DetailScreenInteractor()
        let presenter = DetailScreenPresenter()
        let router = DetailScreenRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
}

extension DetailScreenViewController: DetailScreenDisplayLogic {
    func displayToDetailMovie(viewModel: DetailScreen.Fetch.ViewModel.MovieDetail) {
        detailMovie = viewModel
        setupUI()
    }
    
    private func setupUI() {
        movieTitle.text = detailMovie?.originalTitle
        movieInfo.text = detailMovie?.overview
    }
    
    
}
