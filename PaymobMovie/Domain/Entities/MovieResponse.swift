//
//  MovieResponse.swift
//  PaymobMovie
//
//  Created by Ahmed Emad on 07/07/2024.
//

import Foundation

// MARK: - Movie
struct MoviesResponse: Codable {
    let results: [MovieResponse]
}

// MARK: - Result
struct MovieResponse: Codable {
    let id: Int
    let originalTitle, overview: String
    let popularity: Double
    let posterPath: String?
    let voteAverage: Int
    let releaseDate: String
    let originalLanguage: String
    let backdropPath: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case originalTitle = "original_title"
        case overview, popularity
        case posterPath = "poster_path"
        case voteAverage = "vote_average"
        case originalLanguage = "original_language"
        case releaseDate = "release_date"
        case backdropPath = "backdrop_path"
    }
}
