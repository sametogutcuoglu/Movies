// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let nowPlayingMovies = try? newJSONDecoder().decode(NowPlayingMovies.self, from: jsonData)

import Foundation

// MARK: - NowPlayingMovies
struct NowPlayingMovies: Codable {
    let dates: NowPlayingDates?
    let page: Int?
    let results: [NowPlayingMovie]?
    let totalPages, totalResults: Int?

    enum CodingKeys: String, CodingKey {
        case dates, page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

// MARK: - Dates
struct NowPlayingDates: Codable {
    let maximum, minimum: String
}

// MARK: - Result
struct NowPlayingMovie: Codable {
    let adult: Bool?
    let backdropPath: String?
    let genreIDS: [Int]?
    let id: Int?
    let originalLanguage: NowPlayingOriginalLanguage?
    let originalTitle, overview: String?
    let popularity: Double?
    let posterPath, releaseDate, title: String?
    let video: Bool?
    let voteAverage: Double?
    let voteCount: Int?

    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case genreIDS = "genre_ids"
        case id
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview, popularity
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title, video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}

enum NowPlayingOriginalLanguage: String, Codable {
    case en = "en"
    case ja = "ja"
}

