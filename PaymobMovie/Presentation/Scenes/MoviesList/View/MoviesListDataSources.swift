//
//  MoviesListDataSources.swift
//  PaymobMovie
//
//  Created by Ahmed Emad on 07/07/2024.
//

import UIKit

class MoviesListCollectionViewDataSources: NSObject, UICollectionViewDelegate, UICollectionViewDataSource {

    private let viewModel: MoviesListViewModel
    
    // Initializer that takes a view model as a parameter.
    init(_ viewModel: MoviesListViewModel) {
        self.viewModel = viewModel
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeue(indexPath: indexPath) as MovieCollectionViewCell
        cell.configureCell(viewModel.movies[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModel.didSelectMovie(indexPath.row)
    }
}

extension MoviesListCollectionViewDataSources: UICollectionViewDelegateFlowLayout {
    // Defines the size for each item in the collection view.
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.size.width / 2 - 20
        let height =  width * 1.25
        return .init(width: width , height: height)
    }
}
