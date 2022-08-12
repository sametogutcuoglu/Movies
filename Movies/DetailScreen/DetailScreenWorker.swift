//
//  DetailScreenWorker.swift
//  Movies
//
//  Created by samet ogutcuoglu on 11.08.2022.
//

import Foundation

protocol DetailScreenWorkingLogic: AnyObject {
    func getMovie(movieId : Int,complation : @escaping ((Result<DetailMovie,Error>) -> Void))
}

final class DetailScreenWorker: DetailScreenWorkingLogic {
    func getMovie(movieId : Int,complation: @escaping ((Result<DetailMovie, Error>) -> Void)) {
        NetworkManager().getFetcMovie(movieId: movieId) { result in
            switch result {
            case .success(let response):
                complation(.success(response))
            case .failure(let error):
                complation(.failure(error))
            }
        }
    }
    
    
}
