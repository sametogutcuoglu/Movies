//
//  ListScreenPresenter.swift
//  Movies
//
//  Created by samet ogutcuoglu on 11.08.2022.
//

import Foundation

protocol ListScreenPresentationLogic: AnyObject {
    func presentMovies(response: ListScreen.Fetch.Response)
    func Alert(AlertMessage: String)
}

final class ListScreenPresenter: ListScreenPresentationLogic {

    weak var viewController: ListScreenDisplayLogic?
    
    func presentMovies(response: ListScreen.Fetch.Response) {
        var displayedOffices: [ListScreen.Fetch.ViewModel.Movie] = []
        for items in response.movies.results {
            let displayMovies = ListScreen.Fetch.ViewModel.Movie(
                                                                 backdropPath: items.backdropPath,
                                                                 id: items.id,
                                                                 overview: items.overview,
                                                                 releaseDate: items.releaseDate,
                                                                 title: items.title)
            displayedOffices.append(displayMovies)
        }
        let viewModel = ListScreen.Fetch.ViewModel(displayedMovies: displayedOffices)
        viewController?.displayFetchedOffices(viewModel: viewModel)
    }
    
    func Alert(AlertMessage: String) {
        
    }
}
