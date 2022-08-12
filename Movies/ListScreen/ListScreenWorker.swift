//
//  ListScreenWorker.swift
//  Movies
//
//  Created by samet ogutcuoglu on 11.08.2022.
//

import Foundation

protocol ListScreenWorkingLogic: AnyObject {
    func getMovies(complation : @escaping ((Result<Movies,Error>) -> Void))
}

final class ListScreenWorker: ListScreenWorkingLogic {
    func getMovies(complation: @escaping ((Result<Movies, Error>) -> Void)) {
        NetworkManager().getFetcMovies {  result in
            switch result {
            case .success(let response):
                complation(.success(response))
            case .failure(let error):
                complation(.failure(error))
            }
        }
    }
    
    
}
