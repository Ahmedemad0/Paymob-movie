//
//  MoviesListViewModel.swift
//  PaymobMovie
//
//  Created by Ahmed Emad on 07/07/2024.
//

import Foundation
import Combine

class MoviesListViewModel {
    
    var movies: Movies = [
        .init(id: 0, name: "Movie 1", rate: "2.1", isFavorite: true),
        .init(id: 0, name: "Movie 2", rate: "2.4", isFavorite: false),
        .init(id: 0, name: "Movie 3", rate: "3.1", isFavorite: false),
        .init(id: 0, name: "Movie 4", rate: "1.0", isFavorite: true)
    ]
    
    private let movieSelectedSubject = PassthroughSubject<Int, Never>()
    var movieSelectedPublisher: AnyPublisher<Int, Never> {
        return movieSelectedSubject.eraseToAnyPublisher()
    }
        
    func viewDidLoad() {
        
    }
    
    func didSelectMovie(_ index: Int) {
        movieSelectedSubject.send(index)
    }
}
