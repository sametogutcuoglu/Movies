//
//  NetworkManager.swift
//  Movies
//
//  Created by samet ogutcuoglu on 11.08.2022.
//

import Foundation

protocol NetworkManagerProtocol {
    func getFetchOffice(complation: @escaping ((Result<Movies, Error>) -> Void))
}

struct NetworkManager : NetworkManagerProtocol {
    
    func getFetchOffice(complation: @escaping ((Result<Movies, Error>) -> Void)) {
        guard let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=427850bdab99077035ddf9d6bacf3253")
        else { return }
        let dataTask = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                complation(.failure(error ?? NSError(domain: "Unkown error", code: -1)))
                return
            }
            do {
                let moviesList = try JSONDecoder().decode(Movies.self, from: data)
                complation(.success((moviesList)))
            }
               catch {
                     complation(.failure(NSError(domain: "decode Parse Error \(error)", code: -2)))
                }
         
        }
        dataTask.resume()
    }
}
