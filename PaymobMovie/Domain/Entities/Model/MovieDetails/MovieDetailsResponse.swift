//
//  MovieDetailsResponse.swift
//  PaymobMovie
//
//  Created by Ahmed Emad on 07/07/2024.
//

import Foundation

struct MovieDetailsResponse: Codable {
    let backdropPath: String
    let id: Int
    let originalLanguage, originalTitle, overview: String
    let popularity: Double
    let posterPath, releaseDate: String
    let voteAverage: Double

    enum CodingKeys: String, CodingKey {
        case backdropPath = "backdrop_path"
        case id
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview, popularity
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case voteAverage = "vote_average"
    }
}
