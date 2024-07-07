//
//  MovieDetailsRouter.swift
//  PaymobMovie
//
//  Created by Ahmed Emad on 07/07/2024.
//

import UIKit

protocol MovieDetailsRouterProtocol {
    static func createScene() -> UIViewController
    func navigateTo(destination: MovieDetailsRouterDestinations, fromViewController viewController: MovieDetailsViewController)
}

enum MovieDetailsRouterDestinations {
    case moviesList
}

class MovieDetailsRouter : MovieDetailsRouterProtocol {
   
    static func createScene() -> UIViewController {
        let router = MovieDetailsRouter()
        let viewController = MovieDetailsViewController(router: router)
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
