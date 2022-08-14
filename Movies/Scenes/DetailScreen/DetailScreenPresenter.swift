//
//  DetailScreenPresenter.swift
//  Movies
//
//  Created by samet ogutcuoglu on 11.08.2022.
//

import Foundation

protocol DetailScreenPresentationLogic: AnyObject {
    func presentMovieDetail(Response : DetailScreen.Fetch.Response)
    func alert(Error : String)
}

final class DetailScreenPresenter: DetailScreenPresentationLogic {

    weak var viewController: DetailScreenDisplayLogic?
    
    func presentMovieDetail(Response: DetailScreen.Fetch.Response) {
        guard let formatvoteAverageData = Response.movie.voteAverage else { return }
        let voteAverage =  NSString(format: "%.1f",formatvoteAverageData) as String
        
        guard let formatReleaseDate = Response.movie.releaseDate else { return }
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd"
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy"
        let date: Date? = dateFormatterGet.date(from: formatReleaseDate)
        guard let date = date else {
            return
        }
        let releaseDate = (dateFormatter.string(from: date))
    
        let movie = DetailScreen.Fetch.ViewModel.MovieDetail.init(backdropPath: Response.movie.backdropPath ?? "",
                                                                  homepage: Response.movie.homepage ?? "",
                                                                  id: Response.movie.id ?? .zero,
                                                                  imdbID: Response.movie.imdbID ?? "",
                                                                  originalLanguage: Response.movie.originalLanguage ?? "",
                                                                  originalTitle: Response.movie.originalTitle ?? "",
                                                                  overview: Response.movie.overview ?? "",
                                                                  popularity: Response.movie.popularity ?? .zero,
                                                                  posterPath: Response.movie.posterPath ?? "",
                                                                  revenue: Response.movie.revenue ?? .zero,
                                                                  runtime: Response.movie.runtime ?? .zero,
                                                                  status: Response.movie.status ?? "",
                                                                  tagline: Response.movie.tagline ?? "",
                                                                  title: Response.movie.title ?? "",
                                                                  voteAverage: voteAverage,
                                                                  voteCount: Response.movie.voteCount ?? .zero,
                                                                  release_date: releaseDate)
        viewController?.displayToDetailMovie(viewModel: movie)
    }
    
    func alert(Error: String) {
        viewController?.alertError(error: Error)
    }
}
