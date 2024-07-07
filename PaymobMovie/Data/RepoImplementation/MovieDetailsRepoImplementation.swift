//
//  MovieDetailsRepoImplementation.swift
//  PaymobMovie
//
//  Created by Ahmed Emad on 07/07/2024.
//

import Foundation
import Combine

final class MovieDetailsRepoImplementation: MovieDetailsRepoProtocol {
    
    @Inject var networking: NetworkDispatcher
    
    func getMovieDetails(_ id: Int) -> AnyPublisher<MovieDetailsResponse, any Error> {
        Future { promise in
            Task {
                do {
                    let request = MovieDetailsRequest(id: "\(id)")
                    let data = try await self.networking.dispatch(request)
                    promise(.success(data))
                } catch {
                    promise(.failure(error))
                }
            }
        }
        .eraseToAnyPublisher()
    }
}
