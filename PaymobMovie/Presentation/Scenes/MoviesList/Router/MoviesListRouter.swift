//
//  MoviesListRouter.swift
//  PaymobMovie
//
//  Created by Ahmed Emad on 07/07/2024.
//

import UIKit

protocol MoviesListRouterProtocol {
    static func createScene() -> UIViewController
    func navigateTo(destination: MoviesListRouterDestinations, fromViewController viewController: MoviesListViewController)
}

enum MoviesListRouterDestinations {
    case movieDetails(Int, Bool)
}

class MoviesListRouter : MoviesListRouterProtocol {
   
    static func createScene() -> UIViewController {
        let router = MoviesListRouter()
        let viewController = MoviesListViewController(router: router)
        
        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.modalPresentationStyle = .fullScreen
        navigationController.isNavigationBarHidden = true

        return navigationController
    }
    
    func navigateTo(destination: MoviesListRouterDestinations, fromViewController viewController: MoviesListViewController) {
        switch destination {
        case .movieDetails(let id, let isFavorite):
            navigateToMovieDetailsScreen(fromView: viewController, id: id, isFavorite: isFavorite)
        }
    }
    
    private func navigateToMovieDetailsScreen(fromView viewController: MoviesListViewController, id: Int, isFavorite: Bool){
        let viewModel = MovieDetailsViewModel(id: id, isFavorite: isFavorite)
        let destinationViewController = MovieDetailsRouter.createScene(viewModel: viewModel)
        viewController.viewModel.bindToFavoriteStatusChanges(from: viewModel)
        viewController.navigationController?.pushViewController(destinationViewController, animated: true)
    }
}
