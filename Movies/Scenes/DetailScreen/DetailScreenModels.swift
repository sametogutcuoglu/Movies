//
//  DetailScreenModels.swift
//  Movies
//
//  Created by samet ogutcuoglu on 11.08.2022.
//

import Foundation

// swiftlint:disable nesting
enum DetailScreen {
    
    enum Fetch {
        
        struct Request {
            
        }
        
        struct Response {
            var movie : DetailMovie
        }
        
        struct ViewModel {
            struct MovieDetail {
                let backdropPath: String
                let homepage: String
                let id: Int
                let imdbID, originalLanguage, originalTitle, overview: String
                let popularity: Double
                let posterPath: String
                let revenue, runtime: Int
                let status, tagline, title: String
                var voteAverage: String
                let voteCount: Int
                let release_date : String
            }
        }
        
    }
    
}
// swiftlint:enable nesting
