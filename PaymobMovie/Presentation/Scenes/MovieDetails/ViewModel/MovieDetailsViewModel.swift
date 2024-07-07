//
//  MovieDetailsViewModel.swift
//  PaymobMovie
//
//  Created by Ahmed Emad on 07/07/2024.
//

import Foundation
import Combine

class MovieDetailsViewModel {
    @Published var movie: MovieDetails? = nil
    @Published var id: Int
    @Published var isFavorite: Bool
    
    @Inject var moveDetailsUseCases: MovieDetailsUseCasesProtcol
    private var cancellables = Set<AnyCancellable>()

    private let favoriteStatusChangedSubject = PassthroughSubject<MovieDetails, Never>()
    
    var favoriteStatusChangedPublisher: AnyPublisher<MovieDetails, Never> {
        return favoriteStatusChangedSubject.eraseToAnyPublisher()
    }
    
    init(id: Int, isFavorite: Bool) {
        self.id = id
        self.isFavorite = isFavorite
    }
    
    func viewDidLoad() {
        getListMovieDetails()
    }
    
    func getListMovieDetails() {
        moveDetailsUseCases.getMovieDetails(id)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print("Error fetching movies: \(error)")
                }
            }, receiveValue: { [weak self] movie in
                guard let self else { return }
                var updatedMovie = movie
                updatedMovie.isFavorite = self.isFavorite
                self.movie = updatedMovie
            })
            .store(in: &cancellables)
    }
    
    func toggleFavoriteStatus() {
        movie?.isFavorite.toggle()
        guard let movie = movie else { return }
        favoriteStatusChangedSubject.send(movie)
    }
    
}
