//
//  MovieListRepositoryImplementation.swift
//  PaymobMovie
//
//  Created by Ahmed Emad on 07/07/2024.
//

import Foundation
import Combine

final class MoviesListRepositoryImplementation: MoviesListRepoProtocol {
    
    @Inject var networking: NetworkDispatcher
    
    func getMoviesList() -> AnyPublisher<MoviesResponse, Error> {
        Future { promise in
            Task {
                do {
                    let request = MoviesListRequest()
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
