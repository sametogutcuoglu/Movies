//
//  ListScreenPresenter.swift
//  Movies
//
//  Created by samet ogutcuoglu on 11.08.2022.
//

import Foundation

protocol ListScreenPresentationLogic: AnyObject {
    func presentMovies(response: ListScreen.Fetch.Response)
    func presentNowPlaying(response: ListScreen.Fetch.Response)
    func alert(AlertMessage: String)
}

final class ListScreenPresenter: ListScreenPresentationLogic {
    
    weak var viewController: ListScreenDisplayLogic?
    
    func presentMovies(response: ListScreen.Fetch.Response) {
        
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd"
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy"
        
        var displayedMovies: [ListScreen.Fetch.ViewModel.Movie] = []
        guard let model = response.movies?.results else { return }
        for items in model {
            
            guard let movieReleaseDate = items.releaseDate else { return }
            let date: Date? = dateFormatterGet.date(from: movieReleaseDate)
            guard let date = date else {
                return
            }
            let releaseDates = (dateFormatter.string(from: date))
            let displayMovies = ListScreen.Fetch.ViewModel.Movie(
                                                    backdropPath: items.backdropPath ?? "",
                                                    id: items.id ?? .zero,
                                                    overview: items.overview ?? "",
                                                    releaseDate: releaseDates,
                                                    title: items.title ?? "")
            displayedMovies.append(displayMovies)
        }
        let viewModel = ListScreen.Fetch.ViewModel(displayedMovies: displayedMovies)
        viewController?.displayFetchedMovies(viewModel: viewModel)
    }
    
    func presentNowPlaying(response: ListScreen.Fetch.Response) {
        
        var displayedNowPlayingMovies: [ListScreen.Fetch.ViewModel.Nowplaying] = []
        guard let model = response.nowPlaying?.results else { return }
        for items in model {
            let displayMovies = ListScreen.Fetch.ViewModel.Nowplaying(
                id: items.id ?? .zero,
                posterPath: items.posterPath ?? "",
                originalTitle: items.originalTitle ?? "",
                overview: items.overview ?? "")
            displayedNowPlayingMovies.append(displayMovies)
        }
        let viewModel = ListScreen.Fetch.ViewModel(displayedNowPlaying: displayedNowPlayingMovies)
        viewController?.displayFetchedNowPlayingMovies(viewModel: viewModel)
    }
    
    func alert(AlertMessage: String) {
        viewController?.alertError(Error: AlertMessage)
    }
}
