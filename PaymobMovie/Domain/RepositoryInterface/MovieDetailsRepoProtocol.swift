//
//  MovieDetailsRepoProtocol.swift
//  PaymobMovie
//
//  Created by Ahmed Emad on 07/07/2024.
//

import Foundation
import Combine

protocol MovieDetailsRepoProtocol {
    func getMovieDetails(_ id: Int) -> AnyPublisher<MovieDetailsResponse, any Error>
}
