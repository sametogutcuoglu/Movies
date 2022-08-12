//
//  DetailScreenInteractor.swift
//  Movies
//
//  Created by samet ogutcuoglu on 11.08.2022.
//

import Foundation

protocol DetailScreenBusinessLogic: AnyObject {
    func getMovie()
}

protocol DetailScreenDataStore: AnyObject {
    var movie : Movie? { get set }
}

final class DetailScreenInteractor: DetailScreenBusinessLogic, DetailScreenDataStore {
    var movie: Movie?
   
    var presenter: DetailScreenPresentationLogic?
    var worker: DetailScreenWorkingLogic = DetailScreenWorker()
    
    func getMovie() {
        guard let movie = movie else {
            return
        }
        worker.getMovie(movieId: movie.id, complation: { result in
            switch result {
            case .success(let data):
                let response = DetailScreen.Fetch.Response(movie: data)
                self.presenter?.presentMovieDetail(Response: response)
            case .failure(let error):
                print(error)
                //self.presenter?.Alert(AlertMessage: "Hata oluştu !  \(error)")
            }
        })
    }
}
