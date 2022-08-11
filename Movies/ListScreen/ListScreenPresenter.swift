//
//  ListScreenPresenter.swift
//  Movies
//
//  Created by samet ogutcuoglu on 11.08.2022.
//

import Foundation

protocol ListScreenPresentationLogic: AnyObject {
    func presentOffices(response: ListScreen.Fetch.Response)
    func Alert(AlertMessage: String)
}

final class ListScreenPresenter: ListScreenPresentationLogic {

    weak var viewController: ListScreenDisplayLogic?
    
    func presentOffices(response: ListScreen.Fetch.Response) {
        var displayedOffices: [ListScreen.Fetch.ViewModel.Movie] = []
        for items in response.movies.results {
            let displayMovies = ListScreen.Fetch.ViewModel.Movie(adult: items.adult,
                                                                 backdropPath: items.backdropPath,
                                                                 genreIDS: items.genreIDS,
                                                                 id: items.id,
                                                                 originalLanguage: items.originalLanguage,
                                                                 originalTitle: items.originalTitle,
                                                                 overview: items.overview,
                                                                 popularity: items.popularity,
                                                                 posterPath: items.posterPath,
                                                                 releaseDate: items.releaseDate,
                                                                 title: items.title,
                                                                 video: items.video,
                                                                 voteAverage: items.voteAverage,
                                                                 voteCount: items.voteCount)
            displayedOffices.append(displayMovies)
        }
        let viewModel = ListScreen.Fetch.ViewModel(displayedMovies: displayedOffices)
        viewController?.displayFetchedOffices(viewModel: viewModel)
    }
    
    func Alert(AlertMessage: String) {
        
    }
}
