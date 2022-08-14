//
//  AppConstants.swift
//  Movies
//
//  Created by samet ogutcuoglu on 14.08.2022.
//

import Foundation
import UIKit

struct AppConstants {
    static let apiKey = "427850bdab99077035ddf9d6bacf3253"
    static let getFetchDetailMovie = "https://api.themoviedb.org/3/movie/"
    static let getFetchMoviesUrl = "https://api.themoviedb.org/3/movie/upcoming?api_key="+apiKey
    static let getNowPlayingUrl = "https://api.themoviedb.org/3/movie/now_playing?api_key="+apiKey
    static let getMovieImageUrl = "https://image.tmdb.org/t/p/w533_and_h300_bestv2/"
    static let error = "Upss Try Again.."
    
    static func alertError(Error: String) -> UIViewController {
    let alert = UIAlertController(title: "Error", message: Error, preferredStyle: UIAlertController.Style.alert)
    let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler:nil)
    alert.addAction(okButton)
    return alert
    }
}
