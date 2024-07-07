//
//  MoviesListRepoProtocol.swift
//  PaymobMovie
//
//  Created by Ahmed Emad on 07/07/2024.
//

import Foundation
import Combine

protocol MoviesListRepoProtocol {
    func getMoviesList() -> AnyPublisher<MoviesResponse, any Error>
}
