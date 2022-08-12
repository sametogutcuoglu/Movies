//
//  DetailScreenPresenter.swift
//  Movies
//
//  Created by samet ogutcuoglu on 11.08.2022.
//

import Foundation

protocol DetailScreenPresentationLogic: AnyObject {
    func presentMovieDetail(Response : DetailScreen.Fetch.Response)
}

final class DetailScreenPresenter: DetailScreenPresentationLogic {
   
    weak var viewController: DetailScreenDisplayLogic?
    
    func presentMovieDetail(Response: DetailScreen.Fetch.Response) {
        let movie = DetailScreen.Fetch.ViewModel.MovieDetail.init(backdropPath: Response.movie.backdropPath,
                                                                  homepage: Response.movie.homepage,
                                                                  id: Response.movie.id,
                                                                  imdbID: Response.movie.imdbID,
                                                                  originalLanguage: Response.movie.originalLanguage,
                                                                  originalTitle: Response.movie.originalTitle,
                                                                  overview: Response.movie.overview,
                                                                  popularity: Response.movie.popularity,
                                                                  posterPath: Response.movie.posterPath,
                                                                  revenue: Response.movie.revenue,
                                                                  runtime: Response.movie.runtime,
                                                                  spokenLanguages: Response.movie.spokenLanguages,
                                                                  status: Response.movie.status,
                                                                  tagline: Response.movie.tagline,
                                                                  title: Response.movie.title,
                                                                  voteAverage: Response.movie.voteAverage,
                                                                  voteCount: Response.movie.voteCount)
        viewController?.displayToDetailMovie(viewModel: movie)
    }
}
