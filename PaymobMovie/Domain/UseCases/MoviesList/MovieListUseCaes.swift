//
//  MovieListUseCaes.swift
//  PaymobMovie
//
//  Created by Ahmed Emad on 07/07/2024.
//

import Foundation
import Combine

protocol MovieListUseCasesProtocol {
    func getMoviesList()-> AnyPublisher<Movies, Error>
}

class MovieListUseCases: MovieListUseCasesProtocol {
    
    @Inject var repo: MoviesListRepoProtocol

    func getMoviesList()-> AnyPublisher<Movies, Error> {
        repo.getMoviesList()
        .map { movies in
            movies.results.map { movie in
                return .init(
                    id: movie.id,
                    name: movie.originalTitle,
                    poster: Constants.imageBase + (movie.posterPath ?? (movie.backdropPath ?? "")),
                    rate: "\(movie.popularity)",
                    date: movie.releaseDate,
                    language: movie.originalLanguage,
                    isFavorite: false
                )
            }
        }
        .eraseToAnyPublisher()
    }
}
