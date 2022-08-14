//
//  NetworkManager.swift
//  Movies
//
//  Created by samet ogutcuoglu on 11.08.2022.
//

import Foundation

protocol NetworkManagerProtocol {
    func getFetchMovies(complation: @escaping ((Result<Movies, Error>) -> Void))
    func getNowPlaying(complation: @escaping ((Result<NowPlayingMovies, Error>) -> Void))
    func getFetchDetailMovie(movieId : Int,complation: @escaping ((Result<DetailMovie, Error>) -> Void))
    
}

struct NetworkManager : NetworkManagerProtocol {
    func getNowPlaying(complation: @escaping ((Result<NowPlayingMovies, Error>) -> Void)) {
        
        guard let url = URL(string: AppConstants.getNowPlayingUrl)
        else { return }
        let dataTask = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                complation(.failure(error ?? NSError(domain: "Unkown error", code: -1)))
                return
            }
            do {
                let moviesList = try JSONDecoder().decode(NowPlayingMovies.self
                                                          , from: data)
                complation(.success((moviesList)))
            }
               catch {
                     complation(.failure(NSError(domain: "decode Parse Error \(error)", code: -2)))
                }
        }
        dataTask.resume()
    }
    
    func getFetchMovies(complation: @escaping ((Result<Movies, Error>) -> Void))  {
        guard let url = URL(string: AppConstants.getFetchMoviesUrl)
        else { return }
        let dataTask = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                complation(.failure(error ?? NSError(domain: "Unkown error", code: -1)))
                return
            }
            do {
                
                let moviesList = try JSONDecoder().decode(Movies.self
                                                          , from: data)
                complation(.success((moviesList)))
            }
               catch {
                   complation(.failure(NSError(domain: "decode Parse Error \(error.localizedDescription)", code: -2)))
                }
        }
        dataTask.resume()
    }
    
    func getFetchDetailMovie(movieId : Int,complation: @escaping ((Result<DetailMovie, Error>) -> Void)) {
        guard let url = URL(string: AppConstants.getFetchDetailMovie+"\(movieId)?api_key="+AppConstants.apiKey)
        else { return }
        let dataTask = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                complation(.failure(error ?? NSError(domain: "Unkown error", code: -1)))
                return
            }
            do {
                let movieList = try JSONDecoder().decode(DetailMovie.self, from: data)
                complation(.success((movieList)))
            }
               catch {
                   complation(.failure(NSError(domain: "decode Parse Error \(error.localizedDescription)", code: -2)))
                }
        }
        dataTask.resume()
    }
}
