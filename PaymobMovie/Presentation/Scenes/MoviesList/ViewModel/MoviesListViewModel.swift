//
//  MoviesListViewModel.swift
//  PaymobMovie
//
//  Created by Ahmed Emad on 07/07/2024.
//

import Foundation
import Combine

class MoviesListViewModel {
    
    @Published var movies: Movies = []

    private let movieSelectedSubject = PassthroughSubject<Int, Never>()
    var movieSelectedPublisher: AnyPublisher<Int, Never> {
        return movieSelectedSubject.eraseToAnyPublisher()
    }
    
    @Inject var moviesListUseCases: MovieListUseCasesProtocol
    
    private var cancellables = Set<AnyCancellable>()
    
    func viewDidLoad() {
        getListMovies()
    }
    
    private func getListMovies() {
        moviesListUseCases.getMoviesList()
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print("Error fetching movies: \(error)")
                }
            }, receiveValue: { [weak self] movies in
                guard let self else { return }
                var moviesWithFavoriteItems = movies
                moviesWithFavoriteItems = moviesWithFavoriteItems.map { movie in
                    var updatedMovie = movie
                    if UserDefaultsManager.shared.favortieIDs.contains(movie.id) {
                        updatedMovie.isFavorite = true
                    }
                    return updatedMovie
                }
                self.movies = moviesWithFavoriteItems
            })
            .store(in: &cancellables)
    }
    
    func updateFavoriteStatus(for movie: MovieDetails) {
        if let index = movies.firstIndex(where: { $0.id == movie.id }) {
            movies[index].isFavorite = movie.isFavorite
            movie.isFavorite ? saveIdInFavorites(movie.id) : removeIDFromFavorites(movie.id)
        }
    }
    
    func didSelectMovie(_ index: Int) {
        movieSelectedSubject.send(index)
    }
    
    func bindToFavoriteStatusChanges(from viewModel: MovieDetailsViewModel) {
        viewModel.favoriteStatusChangedPublisher
            .sink { [weak self] updatedMovie in
                guard let self = self else { return }
                self.updateFavoriteStatus(for: updatedMovie)
                
            }
            .store(in: &cancellables)
    }
    
    private func saveIdInFavorites(_ id: Int) {
        UserDefaultsManager.shared.favortieIDs.append(id)
    }
    
    private func removeIDFromFavorites(_ id: Int) {
        if let index = UserDefaultsManager.shared.favortieIDs.firstIndex(where: { $0 == id }) {
            UserDefaultsManager.shared.favortieIDs.remove(at: index)
        }
    }
}
