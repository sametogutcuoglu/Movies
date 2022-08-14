//
//  ListScreenWorker.swift
//  Movies
//
//  Created by samet ogutcuoglu on 11.08.2022.
//

import Foundation

protocol ListScreenWorkingLogic: AnyObject {
    func getMovies(complation : @escaping ((Result<Movies,Error>) -> Void))
    func getNowPlaying(complation : @escaping ((Result<NowPlayingMovies,Error>) -> Void))
}

final class ListScreenWorker: ListScreenWorkingLogic {
    func getNowPlaying(complation: @escaping ((Result<NowPlayingMovies, Error>) -> Void)) {
        NetworkManager().getNowPlaying {  result in
            switch result {
            case .success(let response):
                complation(.success(response))
            case .failure(let error):
                complation(.failure(error))
            }
        }
    }
    
    func getMovies(complation: @escaping ((Result<Movies, Error>) -> Void)) {
        NetworkManager().getFetchMovies {  result in
            switch result {
            case .success(let response):
                complation(.success(response))
            case .failure(let error):
                complation(.failure(error))
            }
        }
    }
}
