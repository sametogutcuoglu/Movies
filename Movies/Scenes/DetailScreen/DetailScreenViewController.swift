//
//  DetailScreenViewController.swift
//  Movies
//
//  Created by samet ogutcuoglu on 11.08.2022.
//

import UIKit
import SDWebImage

protocol DetailScreenDisplayLogic: AnyObject {
    func displayToDetailMovie(viewModel: DetailScreen.Fetch.ViewModel.MovieDetail)
    func alertError(error:String)
}

final class DetailScreenViewController: UIViewController {
    
    @IBOutlet weak var headerImageView: UIImageView!
    @IBOutlet weak var imbdImageView: UIImageView!
    
    @IBOutlet weak var movieInfoLabel: UILabel!
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var movieReleaseDateLabel: UILabel!
    @IBOutlet weak var movieVoteAverageLabel: UILabel!
    
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
        navigationController?.setNavigationBarHidden(false, animated: true)
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
        DispatchQueue.main.async {
            self.movieTitleLabel.text = self.detailMovie?.title
            self.movieInfoLabel.text = self.detailMovie?.overview
            self.movieReleaseDateLabel.text = self.detailMovie?.release_date
            self.movieVoteAverageLabel.text = "\(self.detailMovie?.voteAverage ?? "")"
            self.imbdImageView.layer.cornerRadius = 5
        }
        let imageUrl = AppConstants.getMovieImageUrl+(self.detailMovie?.posterPath ?? "")
        self.headerImageView.sd_setImage(with: URL(string: imageUrl))
    }
    
    func alertError(error: String) {
        self.present(AppConstants.alertError(Error: error), animated: true)
    }
}
