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
                let spokenLanguages: [SpokenLanguage]
                let status, tagline, title: String
                let voteAverage: Double
                let voteCount: Int
            }
        }
        
    }
    
}
// swiftlint:enable nesting
