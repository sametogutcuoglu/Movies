//
//  ListScreenModels.swift
//  Movies
//
//  Created by samet ogutcuoglu on 11.08.2022.
//

import Foundation

// swiftlint:disable nesting
enum ListScreen {
    
    enum Fetch {
        
        struct Request {
            
        }
        
        struct Response {
            var movies : Movies
        }
        
        struct ViewModel {
            struct Movie {
  
            let adult: Bool?
            let backdropPath: String?
            let genreIDS: [Int]?
            let id: Int?
            let originalLanguage: OriginalLanguage?
            let originalTitle, overview: String?
            let popularity: Double?
            let posterPath, releaseDate, title: String?
            let video: Bool?
            let voteAverage: Double?
            let voteCount: Int?
            }
            
            var displayedMovies : [Movie]
        }
        
    }
    
}
