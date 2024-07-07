//
//  MovieDetailsRouter.swift
//  PaymobMovie
//
//  Created by Ahmed Emad on 07/07/2024.
//

import UIKit

protocol MovieDetailsRouterProtocol {
    static func createScene(viewModel: MovieDetailsViewModel) -> UIViewController
    func navigateTo(destination: MovieDetailsRouterDestinations, fromViewController viewController: MovieDetailsViewController)
}

enum MovieDetailsRouterDestinations {
    case moviesList
}

class MovieDetailsRouter : MovieDetailsRouterProtocol {
   
    static func createScene(viewModel: MovieDetailsViewModel) -> UIViewController {
        let router = MovieDetailsRouter()
        let viewController = MovieDetailsViewController(router: router, viewModel: viewModel)
        return viewController
    }
    
    func navigateTo(destination: MovieDetailsRouterDestinations, fromViewController viewController: MovieDetailsViewController) {
        switch destination {
        case .moviesList:
            navigateToMoviesListScreen(fromView: viewController)
        }
    }
    
    private func navigateToMoviesListScreen(fromView viewController: MovieDetailsViewController){
        viewController.navigationController?.popViewController(animated: true)
    }
}
