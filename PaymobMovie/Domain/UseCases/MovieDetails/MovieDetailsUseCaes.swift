//
//  MovieDetailsUseCaes.swift
//  PaymobMovie
//
//  Created by Ahmed Emad on 07/07/2024.
//

import Foundation
import Combine

protocol MovieDetailsUseCasesProtcol {
    func getMovieDetails(_ id: Int)-> AnyPublisher<MovieDetails, Error>
}

class MovieDetailsUseCases: MovieDetailsUseCasesProtcol {
    
    @Inject var repo: MovieDetailsRepoProtocol
    
    func getMovieDetails(_ id: Int)-> AnyPublisher<MovieDetails, Error> {
        repo.getMovieDetails(id)
        .map { movie in
            return .init(
                id: movie.id,
                name: movie.originalTitle,
                poster: Constants.imageBase + (movie.posterPath ?? (movie.backdropPath ?? "")),
                rate: "\(movie.popularity)",
                date: movie.releaseDate,
                overView: movie.overview,
                voteAverage: "\(movie.voteAverage)",
                language: movie.originalLanguage,
                isFavorite: false
            )
        }
        .eraseToAnyPublisher()
    }
}
