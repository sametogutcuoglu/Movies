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
            var movies : Movies?
            var nowPlaying : NowPlayingMovies?
        }
        
        struct ViewModel {
            struct Movie {
  
            let backdropPath: String
            let id: Int
            let overview: String
            let releaseDate, title: String
            }
            
            struct Nowplaying {
                let id : Int
                let posterPath : String
                let originalTitle : String
                let overview : String
            }
            
            var displayedNowPlaying : [Nowplaying]?
            var displayedMovies : [Movie]?
        }
        
    }
    
}
